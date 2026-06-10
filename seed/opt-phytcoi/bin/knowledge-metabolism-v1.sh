#!/usr/bin/env bash
TS=$(date +%Y%m%d-%H%M%S)
ROOT="/opt/phytcoi"

mkdir -p "$ROOT/knowledge/records" "$ROOT/knowledge/journal"

python3 - <<PY
import json
from pathlib import Path
from datetime import datetime

root = Path("/opt/phytcoi")
ts = "$TS"

def load(path):
    return json.loads(Path(path).read_text())

records_dir = root / "experience/records"
state_path = root / "knowledge/state/knowledge-state.json"
state = load(state_path)

experience_records = []
for p in sorted(records_dir.glob("experience-record-*.json")):
    try:
        experience_records.append(load(p))
    except Exception:
        pass

stable = [
    r for r in experience_records
    if r.get("experience_type") == "stable_growth"
    and r.get("confidence") == "high"
]

if len(stable) >= 3:
    knowledge_type = "stable_internal_metabolism"
    confidence = "high"
    meaning = "Repeated high-confidence stable_growth experiences indicate that PHYT-001 internal observe-discover-memory-experience metabolism is stable."
elif len(stable) >= 1:
    knowledge_type = "emerging_internal_metabolism_stability"
    confidence = "medium"
    meaning = "Stable growth has appeared, but repetition is not yet sufficient for stable knowledge."
else:
    knowledge_type = "insufficient_experience_for_knowledge"
    confidence = "low"
    meaning = "No stable repeated experience exists yet."

record = {
    "timestamp": datetime.now().astimezone().isoformat(),
    "organ": "knowledge",
    "lifecycle": "OBSERVE",
    "knowledge_type": knowledge_type,
    "confidence": confidence,
    "derived_from": {
        "experience_type": "stable_growth",
        "matching_records": len(stable),
        "total_experience_records": len(experience_records)
    },
    "meaning": meaning,
    "forbidden_outcome": [
        "decision",
        "execution",
        "habitat_modification"
    ]
}

record_path = root / f"knowledge/records/knowledge-record-{ts}.json"
record_path.write_text(json.dumps(record, indent=2) + "\\n")

journal = {
    "timestamp": datetime.now().astimezone().isoformat(),
    "event": "knowledge_metabolism_completed",
    "run_id": ts,
    "knowledge_type": knowledge_type,
    "confidence": confidence
}
(root / f"knowledge/journal/run-{ts}.json").write_text(json.dumps(journal, indent=2) + "\\n")

state["last_run"] = datetime.now().astimezone().isoformat()
state["run_count"] = int(state.get("run_count", 0)) + 1
state["knowledge_records_count"] = int(state.get("knowledge_records_count", 0)) + 1
state["last_knowledge_type"] = knowledge_type
state["confidence"] = confidence
state_path.write_text(json.dumps(state, indent=2) + "\\n")
PY
