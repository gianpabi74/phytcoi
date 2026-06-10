#!/usr/bin/env bash
TS=$(date +%Y%m%d-%H%M%S)

python3 - <<PY
import json
from pathlib import Path
from datetime import datetime

ROOT = Path("/opt/phytcoi")
ts = "$TS"

graph_file = ROOT / "discovery" / "graph" / "capability-graph-latest.json"
relationship_dir = ROOT / "relationship" / "records"
context_dir = ROOT / "context" / "records"
state_file = ROOT / "truth" / "state" / "truth-state.json"

def load_json(path, default=None):
    try:
        return json.loads(Path(path).read_text())
    except Exception:
        return default if default is not None else {}

graph = load_json(graph_file, {})
relationship_records = []
context_records = []

for f in sorted(relationship_dir.glob("relationship-record-*.json")):
    data = load_json(f)
    if data:
        relationship_records.append(data)

for f in sorted(context_dir.glob("context-record-*.json")):
    data = load_json(f)
    if data:
        context_records.append(data)

has_capabilities = (
    graph.get("capabilities", {}).get("recursive_resolution_provider", {}).get("provider_count", 0) >= 1
    and graph.get("capabilities", {}).get("authoritative_name_provider", {}).get("provider_count", 0) >= 1
)

has_relationship = any(
    r.get("relationship_type") == "depends_on"
    and r.get("source") == "recursive_resolution_provider"
    and r.get("target") == "authoritative_name_provider"
    and r.get("confidence") == "high"
    and r.get("scope") == "habitat_cognition"
    for r in relationship_records
)

has_context = any(
    c.get("context_type") == "name_resolution_truth_context"
    and c.get("confidence") == "high"
    and c.get("scope") == "habitat_cognition"
    for c in context_records
)

records = []

if has_capabilities and has_relationship and has_context:
    records.append({
        "timestamp": datetime.now().astimezone().isoformat(),
        "organ": "truth",
        "lifecycle": "OBSERVE",
        "truth_type": "validated_habitat_truth",
        "truth_id": "name_resolution_requires_authoritative_namespace_truth",
        "confidence": "high",
        "statement": "recursive resolution depends on authoritative namespace truth",
        "portable_statement": "a recursive resolution capability cannot guarantee namespace truth without an authoritative name capability",
        "scope": "habitat_cognition",
        "derived_from": {
            "capability_graph": graph_file.name,
            "relationship": "recursive_resolution_provider depends_on authoritative_name_provider",
            "context": "name_resolution_truth_context"
        },
        "evidence": [
            "recursive_resolution_provider_present",
            "authoritative_name_provider_present",
            "depends_on_relationship_validated",
            "name_resolution_truth_context_validated"
        ],
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
        "organ": "truth",
        "lifecycle": "OBSERVE",
        "truth_type": "insufficient_truth_evidence",
        "truth_id": "insufficient_truth_evidence",
        "confidence": "low",
        "statement": "not enough validated evidence exists to persist a portable truth",
        "scope": "truth_cognition",
        "forbidden_outcome": [
            "decision",
            "execution",
            "habitat_modification"
        ]
    })

for idx, record in enumerate(records, start=1):
    out = ROOT / f"truth/records/truth-record-{ts}-{idx:02d}.json"
    out.write_text(json.dumps(record, indent=2) + "\\n")

journal = {
    "timestamp": datetime.now().astimezone().isoformat(),
    "event": "truth_metabolism_completed",
    "run_id": ts,
    "truth_records_created": len(records),
    "last_truth_type": records[-1].get("truth_type"),
    "confidence": records[-1].get("confidence")
}
(ROOT / f"truth/journal/run-{ts}.json").write_text(json.dumps(journal, indent=2) + "\\n")

state = load_json(state_file, {})
state["last_run"] = datetime.now().astimezone().isoformat()
state["run_count"] = int(state.get("run_count", 0)) + 1
state["truth_records_count"] = int(state.get("truth_records_count", 0)) + len(records)
state["last_truth_type"] = records[-1].get("truth_type")
state["confidence"] = records[-1].get("confidence")
state_file.write_text(json.dumps(state, indent=2) + "\\n")
PY
