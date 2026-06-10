#!/usr/bin/env bash
TS=$(date +%Y%m%d-%H%M%S)

mkdir -p \
  /opt/phytcoi/discovery/candidates \
  /opt/phytcoi/discovery/capabilities \
  /opt/phytcoi/discovery/graph \
  /opt/phytcoi/discovery/runs \
  /opt/phytcoi/discovery/journal

GATEWAY=$(ip route | awk '/default/ {print $3; exit}')
DNS1=$(awk '/^nameserver/ {print $2}' /etc/resolv.conf | sed -n '1p')
DNS2=$(awk '/^nameserver/ {print $2}' /etc/resolv.conf | sed -n '2p')

cat > /opt/phytcoi/discovery/candidates/function-candidates-$TS.json <<JSON
{
  "timestamp": "$(date -Iseconds)",
  "organ": "discovery",
  "lifecycle": "OBSERVE",
  "function_candidates": [
    {
      "object": "$GATEWAY",
      "candidate_function": "network_gateway",
      "confidence": "high",
      "classification_basis": "default_route"
    },
    {
      "object": "$DNS1",
      "candidate_function": "name_resolution",
      "confidence": "high",
      "classification_basis": "resolver_present_in_resolv_conf"
    },
    {
      "object": "$DNS2",
      "candidate_function": "name_resolution",
      "confidence": "high",
      "classification_basis": "resolver_present_in_resolv_conf"
    }
  ]
}
JSON

python3 - <<PY
import json
from pathlib import Path
from datetime import datetime

ts = "$TS"

capabilities = []

gateway = "$GATEWAY"
dns1 = "$DNS1"
dns2 = "$DNS2"

capabilities.append({
    "object": gateway,
    "candidate_capability": "network_gateway_provider",
    "confidence": "high",
    "evidence": ["default_route_present"],
    "classification_basis": "observed_default_route_provider",
    "forbidden_assumptions": [
        "vendor_identity",
        "product_identity",
        "hostname_identity"
    ]
})

for dns in [dns1, dns2]:
    if dns:
        capabilities.append({
            "object": dns,
            "candidate_capability": "recursive_resolution_provider",
            "confidence": "medium",
            "evidence": [
                "resolver_present_in_resolv_conf"
            ],
            "classification_basis": "configured_recursive_resolver",
            "forbidden_assumptions": [
                "authoritative_name_provider",
                "vendor_identity",
                "product_identity",
                "hostname_identity"
            ]
        })

evidence_dir = Path("/opt/phytcoi/observer/evidence/authoritative_name_provider")

if evidence_dir.exists():
    for evidence_file in sorted(evidence_dir.glob("*.json")):
        try:
            data = json.loads(evidence_file.read_text())
            target = data.get("target")
            ev = data.get("evidence", {})

            if (
                target and
                ev.get("soa_record_present") is True and
                ev.get("ns_record_present") is True and
                ev.get("authoritative_response_observed") is True
            ):
                candidate = {
                    "object": target,
                    "candidate_capability": "authoritative_name_provider",
                    "confidence": "high",
                    "evidence": [
                        "soa_record_present",
                        "ns_record_present",
                        "authoritative_response_observed"
                    ],
                    "classification_basis": "observed_authoritative_dns_behavior",
                    "forbidden_assumptions": [
                        "vendor_identity",
                        "product_identity",
                        "hostname_identity"
                    ]
                }
                if candidate not in capabilities:
                    capabilities.append(candidate)
        except Exception:
            pass

cap_file = Path(f"/opt/phytcoi/discovery/capabilities/capability-candidates-{ts}.json")

cap_payload = {
    "timestamp": datetime.now().astimezone().isoformat(),
    "organ": "discovery",
    "lifecycle": "OBSERVE",
    "capability_candidates": capabilities,
    "principles": [
        "capability_observation",
        "function_first",
        "evidence_first",
        "no_vendor_truth",
        "no_local_logic",
        "observe_only"
    ]
}

cap_file.write_text(json.dumps(cap_payload, indent=2) + "\\n")

capability_graph = {}
object_graph = {}

confidence_rank = {"low": 1, "medium": 2, "high": 3}

for item in capabilities:
    obj = item.get("object")
    cap = item.get("candidate_capability")
    conf = item.get("confidence", "low")
    evidence = item.get("evidence", [])

    if not obj or not cap:
        continue

    capability_graph.setdefault(cap, {
        "providers": [],
        "provider_count": 0,
        "max_confidence": "low",
        "evidence": []
    })

    if obj not in capability_graph[cap]["providers"]:
        capability_graph[cap]["providers"].append(obj)

    for ev in evidence:
        if ev not in capability_graph[cap]["evidence"]:
            capability_graph[cap]["evidence"].append(ev)

    if confidence_rank.get(conf, 0) > confidence_rank.get(capability_graph[cap]["max_confidence"], 0):
        capability_graph[cap]["max_confidence"] = conf

    object_graph.setdefault(obj, {
        "capabilities": []
    })

    object_graph[obj]["capabilities"].append({
        "capability": cap,
        "confidence": conf,
        "evidence": evidence
    })

for cap, data in capability_graph.items():
    data["providers"] = sorted(data["providers"])
    data["provider_count"] = len(data["providers"])
    data["evidence"] = sorted(data["evidence"])

graph = {
    "timestamp": datetime.now().astimezone().isoformat(),
    "organ": "discovery",
    "lifecycle": "OBSERVE",
    "graph_type": "capability_graph",
    "source": cap_file.name,
    "capability_count": len(capability_graph),
    "object_count": len(object_graph),
    "capabilities": dict(sorted(capability_graph.items())),
    "objects": dict(sorted(object_graph.items())),
    "principles": [
        "capability_first",
        "object_second",
        "function_first",
        "evidence_first",
        "no_vendor_truth",
        "no_local_logic",
        "observe_only"
    ]
}

graph_file = Path(f"/opt/phytcoi/discovery/graph/capability-graph-{ts}.json")
graph_latest = Path("/opt/phytcoi/discovery/graph/capability-graph-latest.json")

graph_file.write_text(json.dumps(graph, indent=2) + "\\n")
graph_latest.write_text(json.dumps(graph, indent=2) + "\\n")

state = Path("/opt/phytcoi/discovery/state/discovery-state.json")
s = json.loads(state.read_text())

principles = s.get("principles", [])
for principle in ["capability_observation", "capability_graph"]:
    if principle not in principles:
        principles.append(principle)

s["principles"] = principles
s["run_count"] = s.get("run_count", 0) + 1
s["function_candidates_count"] = s.get("function_candidates_count", 0) + 3
s["capability_candidates_count"] = len(capabilities)
s["last_run"] = datetime.now().astimezone().isoformat()
s["last_capability_run"] = datetime.now().astimezone().isoformat()
s["last_capability_output"] = cap_file.name
s["capability_graph_count"] = len(capability_graph)
s["last_capability_graph"] = graph_file.name
s["last_capability_graph_run"] = datetime.now().astimezone().isoformat()

state.write_text(json.dumps(s, indent=2) + "\\n")
PY

cat > /opt/phytcoi/discovery/runs/discovery-run-$TS.json <<JSON
{
  "timestamp": "$(date -Iseconds)",
  "run_id": "$TS",
  "status": "completed",
  "lifecycle": "OBSERVE",
  "output": [
    "function_candidates",
    "capability_candidates",
    "capability_graph"
  ]
}
JSON

cat > /opt/phytcoi/discovery/journal/run-$TS.json <<JSON
{
  "timestamp": "$(date -Iseconds)",
  "event": "discovery_metabolism_completed",
  "run_id": "$TS",
  "capability_promotion": true,
  "capability_graph": true
}
JSON
