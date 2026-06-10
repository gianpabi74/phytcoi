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
    data = load_json(f)
    if data:
        relationship_records.append(data)

experience_state = load_json(experience_state_file, {})
records = []

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
    records.append({
        "timestamp": datetime.now().astimezone().isoformat(),
        "organ": "context",
        "lifecycle": "OBSERVE",
        "context_type": "sustainable_internal_growth_context",
        "confidence": "high",
        "relationship": {
            "source": "stable_internal_metabolism",
            "relationship_type": "enables",
            "target": "healthy_internal_growth"
        },
        "condition": "repeated_successful_cognition_cycles",
        "meaning": "healthy internal growth remains sustainable while cognitive coherence persists",
        "scope": "internal_cognition",
        "derived_from": {
            "relationship": "stable_internal_metabolism enables healthy_internal_growth",
            "experience": "stable_growth"
        },
        "forbidden_outcome": [
            "decision",
            "execution",
            "habitat_modification"
        ]
    })

has_resolution_dependency = any(
    r.get("relationship_type") == "depends_on"
    and r.get("source") == "recursive_resolution_provider"
    and r.get("target") == "authoritative_name_provider"
    and r.get("confidence") == "high"
    and r.get("scope") == "habitat_cognition"
    for r in relationship_records
)

if has_resolution_dependency:
    records.append({
        "timestamp": datetime.now().astimezone().isoformat(),
        "organ": "context",
        "lifecycle": "OBSERVE",
        "context_type": "name_resolution_truth_context",
        "confidence": "high",
        "relationship": {
            "source": "recursive_resolution_provider",
            "relationship_type": "depends_on",
            "target": "authoritative_name_provider"
        },
        "condition": "authoritative_name_provider_unavailable",
        "meaning": "recursive resolution cannot guarantee namespace truth without authoritative name capability",
        "scope": "habitat_cognition",
        "derived_from": {
            "relationship": "recursive_resolution_provider depends_on authoritative_name_provider",
            "relationship_scope": "habitat_cognition"
        },
        "forbidden_assumptions": [
            "hostname_identity",
            "vendor_identity",
            "product_identity"
        ],
        "forbidden_outcome": [
            "decision",
            "execution",
            "habitat_modification"
        ]
    })

if not records:
    records.append({
        "timestamp": datetime.now().astimezone().isoformat(),
        "organ": "context",
        "lifecycle": "OBSERVE",
        "context_type": "insufficient_context_evidence",
        "confidence": "low",
        "relationship": {
            "source": "relationship",
            "relationship_type": "unknown",
            "target": "context"
        },
        "condition": "insufficient_validated_relationships",
        "meaning": "not enough validated relationship evidence exists to derive context",
        "scope": "context_cognition",
        "forbidden_outcome": [
            "decision",
            "execution",
            "habitat_modification"
        ]
    })

for idx, record in enumerate(records, start=1):
    out = ROOT / f"context/records/context-record-{ts}-{idx:02d}.json"
    out.write_text(json.dumps(record, indent=2) + "\\n")

journal = {
    "timestamp": datetime.now().astimezone().isoformat(),
    "event": "context_metabolism_completed",
    "run_id": ts,
    "context_records_created": len(records),
    "last_context_type": records[-1].get("context_type"),
    "confidence": records[-1].get("confidence"),
    "last_scope": records[-1].get("scope")
}
(ROOT / f"context/journal/run-{ts}.json").write_text(json.dumps(journal, indent=2) + "\\n")

state = load_json(state_file, {})
state["last_run"] = datetime.now().astimezone().isoformat()
state["run_count"] = int(state.get("run_count", 0)) + 1
state["context_records_count"] = int(state.get("context_records_count", 0)) + len(records)
state["last_context_type"] = records[-1].get("context_type")
state["confidence"] = records[-1].get("confidence")
state["last_scope"] = records[-1].get("scope")
state_file.write_text(json.dumps(state, indent=2) + "\\n")
PY
