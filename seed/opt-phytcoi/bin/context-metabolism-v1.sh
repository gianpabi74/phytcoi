#!/usr/bin/env bash
TS=$(date +%Y%m%d-%H%M%S)

python3 - <<PY
import json
from pathlib import Path
from datetime import datetime

ROOT = Path("/opt/phytcoi")
ts = "$TS"

relationship_dir = ROOT / "relationship" / "records"
experience_state_file = ROOT / "experience" / "state" / "experience-state.json"
state_file = ROOT / "context" / "state" / "context-state.json"

def load_json(path, default=None):
    try:
        return json.loads(Path(path).read_text())
    except Exception:
        return default if default is not None else {}

relationship_records = []
for f in sorted(relationship_dir.glob("relationship-record-*.json")):
    try:
        relationship_records.append(load_json(f))
    except Exception:
        pass

experience_state = load_json(experience_state_file, {})
has_internal_enables = any(
    r.get("relationship_type") == "enables"
    and r.get("source") == "stable_internal_metabolism"
    and r.get("target") == "healthy_internal_growth"
    and r.get("confidence") == "high"
    for r in relationship_records
)

stable_cycles = (
    experience_state.get("last_experience_type") == "stable_growth"
    and experience_state.get("confidence") == "high"
    and int(experience_state.get("run_count", 0)) >= 3
)

if has_internal_enables and stable_cycles:
    context_type = "sustainable_internal_growth_context"
    confidence = "high"
    relationship = {
        "source": "stable_internal_metabolism",
        "relationship_type": "enables",
        "target": "healthy_internal_growth"
    }
    condition = "repeated_successful_cognition_cycles"
    meaning = "healthy internal growth remains sustainable while cognitive coherence persists"
    scope = "internal_cognition"
else:
    context_type = "insufficient_context_evidence"
    confidence = "low"
    relationship = {
        "source": "relationship",
        "relationship_type": "unknown",
        "target": "context"
    }
    condition = "insufficient_validated_cycles"
    meaning = "not enough validated relationship and experience evidence exists to derive context"
    scope = "internal_cognition"

record = {
    "timestamp": datetime.now().astimezone().isoformat(),
    "organ": "context",
    "lifecycle": "OBSERVE",
    "context_type": context_type,
    "confidence": confidence,
    "relationship": relationship,
    "condition": condition,
    "meaning": meaning,
    "scope": scope,
    "derived_from": {
        "relationship": "stable_internal_metabolism enables healthy_internal_growth",
        "experience": "stable_growth"
    },
    "forbidden_outcome": [
        "decision",
        "execution",
        "habitat_modification"
    ]
}

(ROOT / f"context/records/context-record-{ts}.json").write_text(json.dumps(record, indent=2) + "\\n")

journal = {
    "timestamp": datetime.now().astimezone().isoformat(),
    "event": "context_metabolism_completed",
    "run_id": ts,
    "context_type": context_type,
    "confidence": confidence
}
(ROOT / f"context/journal/run-{ts}.json").write_text(json.dumps(journal, indent=2) + "\\n")

state = load_json(state_file)
state["last_run"] = datetime.now().astimezone().isoformat()
state["run_count"] = int(state.get("run_count", 0)) + 1
state["context_records_count"] = int(state.get("context_records_count", 0)) + 1
state["last_context_type"] = context_type
state["confidence"] = confidence
state_file.write_text(json.dumps(state, indent=2) + "\\n")
PY
