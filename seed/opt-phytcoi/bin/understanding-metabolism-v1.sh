#!/usr/bin/env bash
TS=$(date +%Y%m%d-%H%M%S)

python3 - <<PY
import json
from pathlib import Path
from datetime import datetime

ROOT = Path("/opt/phytcoi")
ts = "$TS"

knowledge_dir = ROOT / "knowledge" / "records"
state_file = ROOT / "understanding" / "state" / "understanding-state.json"

knowledge_records = []
for f in sorted(knowledge_dir.glob("knowledge-record-*.json")):
    try:
        knowledge_records.append(json.loads(f.read_text()))
    except Exception:
        pass

stable = [
    r for r in knowledge_records
    if r.get("knowledge_type") == "stable_internal_metabolism"
]

if len(stable) >= 3:
    understanding_type = "healthy_internal_growth"
    confidence = "high"
    meaning = "the organism demonstrates healthy and coherent cognitive growth across observer, discovery, memory, experience and knowledge"
elif len(stable) >= 1:
    understanding_type = "emerging_internal_health"
    confidence = "medium"
    meaning = "the organism shows signs of coherent cognitive development"
else:
    understanding_type = "insufficient_understanding"
    confidence = "low"
    meaning = "not enough stable knowledge exists yet"

record = {
    "timestamp": datetime.now().astimezone().isoformat(),
    "organ": "understanding",
    "lifecycle": "OBSERVE",
    "understanding_type": understanding_type,
    "confidence": confidence,
    "derived_from": {
        "knowledge_type": "stable_internal_metabolism",
        "matching_records": len(stable)
    },
    "meaning": meaning,
    "forbidden_outcome": [
        "decision",
        "execution",
        "habitat_modification"
    ]
}

record_file = ROOT / f"understanding/records/understanding-record-{ts}.json"
record_file.write_text(json.dumps(record, indent=2) + "\\n")

journal = {
    "timestamp": datetime.now().astimezone().isoformat(),
    "event": "understanding_metabolism_completed",
    "run_id": ts,
    "understanding_type": understanding_type,
    "confidence": confidence
}

(ROOT / f"understanding/journal/run-{ts}.json").write_text(json.dumps(journal, indent=2) + "\\n")

state = json.loads(state_file.read_text())
state["last_run"] = datetime.now().astimezone().isoformat()
state["run_count"] = int(state.get("run_count", 0)) + 1
state["understanding_records_count"] = int(state.get("understanding_records_count", 0)) + 1
state["last_understanding_type"] = understanding_type
state["confidence"] = confidence
state_file.write_text(json.dumps(state, indent=2) + "\\n")
PY
