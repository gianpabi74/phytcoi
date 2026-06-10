#!/usr/bin/env bash
TS=$(date +%Y%m%d-%H%M%S)
ROOT="/opt/phytcoi"

mkdir -p "$ROOT/experience/records" "$ROOT/experience/journal"

python3 - <<PY
import json
from pathlib import Path
from datetime import datetime

root = Path("/opt/phytcoi")
ts = "$TS"

def load(path):
    return json.loads(Path(path).read_text())

observer = load(root / "observer/state/observer-state.json")
discovery = load(root / "discovery/state/discovery-state.json")
memory = load(root / "memory/state/memory-state.json")
state_path = root / "experience/state/experience-state.json"
state = load(state_path)

o = int(observer.get("run_count", 0))
d = int(discovery.get("run_count", 0))
m = int(memory.get("run_count", 0))

max_runs = max(o, d, m)
min_runs = min(o, d, m)
divergence = max_runs - min_runs

if min_runs >= 10 and divergence <= 2:
    exp_type = "stable_growth"
    confidence = "high"
    meaning = "Observer, Discovery and Memory are growing coherently across repeated metabolism cycles."
elif min_runs >= 3 and divergence <= 5:
    exp_type = "coherent_growth"
    confidence = "medium"
    meaning = "Organ growth is mostly coherent, but more observation is required."
else:
    exp_type = "insufficient_experience"
    confidence = "low"
    meaning = "Not enough repeated metabolism exists to derive a stable experience."

record = {
    "timestamp": datetime.now().astimezone().isoformat(),
    "organ": "experience",
    "lifecycle": "OBSERVE",
    "experience_type": exp_type,
    "confidence": confidence,
    "observed_pattern": {
        "observer_runs": o,
        "discovery_runs": d,
        "memory_runs": m,
        "max_divergence": divergence
    },
    "meaning": meaning,
    "forbidden_outcome": [
        "decision",
        "execution",
        "habitat_modification"
    ]
}

record_path = root / f"experience/records/experience-record-{ts}.json"
record_path.write_text(json.dumps(record, indent=2) + "\\n")

journal = {
    "timestamp": datetime.now().astimezone().isoformat(),
    "event": "experience_metabolism_completed",
    "run_id": ts,
    "experience_type": exp_type,
    "confidence": confidence
}
(root / f"experience/journal/run-{ts}.json").write_text(json.dumps(journal, indent=2) + "\\n")

state["last_run"] = datetime.now().astimezone().isoformat()
state["run_count"] = int(state.get("run_count", 0)) + 1
state["experience_records_count"] = int(state.get("experience_records_count", 0)) + 1
state["last_experience_type"] = exp_type
state["confidence"] = confidence
state_path.write_text(json.dumps(state, indent=2) + "\\n")
PY
