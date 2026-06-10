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
capability_dir = ROOT / "discovery" / "capabilities"
state_file = ROOT / "relationship" / "state" / "relationship-state.json"

def load_json(path, default=None):
    try:
        return json.loads(Path(path).read_text())
    except Exception:
        return default if default is not None else {}

records = []

knowledge_records = []
understanding_records = []

for f in sorted(knowledge_dir.glob("knowledge-record-*.json")):
    data = load_json(f)
    if data:
        knowledge_records.append(data)

for f in sorted(understanding_dir.glob("understanding-record-*.json")):
    data = load_json(f)
    if data:
        understanding_records.append(data)

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
    records.append({
        "timestamp": datetime.now().astimezone().isoformat(),
        "organ": "relationship",
        "lifecycle": "OBSERVE",
        "relationship_type": "enables",
        "source": "stable_internal_metabolism",
        "target": "healthy_internal_growth",
        "confidence": "high",
        "meaning": "stable internal metabolism enables healthy internal growth",
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
    })

latest_capability_file = None
if capability_dir.exists():
    files = sorted(capability_dir.glob("capability-candidates-*.json"), key=lambda p: p.stat().st_mtime, reverse=True)
    latest_capability_file = files[0] if files else None

if latest_capability_file:
    cap_data = load_json(latest_capability_file, {})
    caps = cap_data.get("capability_candidates", [])

    by_object = {}
    for c in caps:
        obj = c.get("object")
        cap = c.get("candidate_capability")
        conf = c.get("confidence")
        if obj and cap:
            by_object.setdefault(obj, {})[cap] = conf

    relationship_objects = []
    for obj, objcaps in by_object.items():
        if (
            objcaps.get("recursive_resolution_provider") in ["medium", "high"]
            and objcaps.get("authoritative_name_provider") == "high"
        ):
            relationship_objects.append(obj)

    if relationship_objects:
        records.append({
            "timestamp": datetime.now().astimezone().isoformat(),
            "organ": "relationship",
            "lifecycle": "OBSERVE",
            "relationship_type": "depends_on",
            "source": "recursive_resolution_provider",
            "target": "authoritative_name_provider",
            "confidence": "high",
            "meaning": "recursive resolution depends on authoritative name capability for namespace truth",
            "scope": "habitat_cognition",
            "evidence_objects": sorted(relationship_objects),
            "derived_from": {
                "capability_file": latest_capability_file.name,
                "source_capability": "recursive_resolution_provider",
                "target_capability": "authoritative_name_provider"
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
        "organ": "relationship",
        "lifecycle": "OBSERVE",
        "relationship_type": "insufficient_relationship_evidence",
        "source": "capability",
        "target": "relationship",
        "confidence": "low",
        "meaning": "not enough validated evidence exists to derive a stable relationship",
        "scope": "relationship_cognition",
        "forbidden_outcome": [
            "decision",
            "execution",
            "habitat_modification"
        ]
    })

for idx, record in enumerate(records, start=1):
    record_file = ROOT / f"relationship/records/relationship-record-{ts}-{idx:02d}.json"
    record_file.write_text(json.dumps(record, indent=2) + "\\n")

journal = {
    "timestamp": datetime.now().astimezone().isoformat(),
    "event": "relationship_metabolism_completed",
    "run_id": ts,
    "relationship_records_created": len(records),
    "last_relationship_type": records[-1].get("relationship_type"),
    "confidence": records[-1].get("confidence")
}

(ROOT / f"relationship/journal/run-{ts}.json").write_text(json.dumps(journal, indent=2) + "\\n")

state = load_json(state_file, {})
state["last_run"] = datetime.now().astimezone().isoformat()
state["run_count"] = int(state.get("run_count", 0)) + 1
state["relationship_records_count"] = int(state.get("relationship_records_count", 0)) + len(records)
state["last_relationship_type"] = records[-1].get("relationship_type")
state["confidence"] = records[-1].get("confidence")
state["last_scope"] = records[-1].get("scope")
state_file.write_text(json.dumps(state, indent=2) + "\\n")
PY
