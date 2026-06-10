#!/usr/bin/env bash
TS=$(date +%Y%m%d-%H%M%S)

python3 - <<PY
import json
from pathlib import Path
from datetime import datetime

ROOT = Path("/opt/phytcoi")
ts = "$TS"

knowledge_dir = ROOT / "knowledge" / "records"
understanding_dir = ROOT / "understanding" / "records"
state_file = ROOT / "relationship" / "state" / "relationship-state.json"

def load_json(path):
    return json.loads(Path(path).read_text())

knowledge_records = []
understanding_records = []

for f in sorted(knowledge_dir.glob("knowledge-record-*.json")):
    try:
        knowledge_records.append(load_json(f))
    except Exception:
        pass

for f in sorted(understanding_dir.glob("understanding-record-*.json")):
    try:
        understanding_records.append(load_json(f))
    except Exception:
        pass

has_stable_metabolism = any(
    r.get("knowledge_type") == "stable_internal_metabolism"
    and r.get("confidence") == "high"
    for r in knowledge_records
)

has_healthy_growth = any(
    r.get("understanding_type") == "healthy_internal_growth"
    and r.get("confidence") == "high"
    for r in understanding_records
)

if has_stable_metabolism and has_healthy_growth:
    relationship_type = "enables"
    source = "stable_internal_metabolism"
    target = "healthy_internal_growth"
    confidence = "high"
    meaning = "stable internal metabolism enables healthy internal growth"
else:
    relationship_type = "insufficient_relationship_evidence"
    source = "knowledge"
    target = "understanding"
    confidence = "low"
    meaning = "not enough validated knowledge and understanding exists to derive a stable relationship"

record = {
    "timestamp": datetime.now().astimezone().isoformat(),
    "organ": "relationship",
    "lifecycle": "OBSERVE",
    "relationship_type": relationship_type,
    "source": source,
    "target": target,
    "confidence": confidence,
    "meaning": meaning,
    "scope": "internal_cognition",
    "derived_from": {
        "knowledge": "stable_internal_metabolism",
        "understanding": "healthy_internal_growth"
    },
    "forbidden_outcome": [
        "decision",
        "execution",
        "habitat_modification"
    ]
}

record_file = ROOT / f"relationship/records/relationship-record-{ts}.json"
record_file.write_text(json.dumps(record, indent=2) + "\\n")

journal = {
    "timestamp": datetime.now().astimezone().isoformat(),
    "event": "relationship_metabolism_completed",
    "run_id": ts,
    "relationship_type": relationship_type,
    "confidence": confidence
}

(ROOT / f"relationship/journal/run-{ts}.json").write_text(json.dumps(journal, indent=2) + "\\n")

state = load_json(state_file)
state["last_run"] = datetime.now().astimezone().isoformat()
state["run_count"] = int(state.get("run_count", 0)) + 1
state["relationship_records_count"] = int(state.get("relationship_records_count", 0)) + 1
state["last_relationship_type"] = relationship_type
state["confidence"] = confidence
state_file.write_text(json.dumps(state, indent=2) + "\\n")
PY
