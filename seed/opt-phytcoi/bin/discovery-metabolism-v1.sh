#!/usr/bin/env bash
TS=$(date +%Y%m%d-%H%M%S)

mkdir -p /opt/phytcoi/discovery/candidates /opt/phytcoi/discovery/runs /opt/phytcoi/discovery/journal

GATEWAY=$(ip route | awk '/default/ {print $3; exit}')
DNS1=$(awk '/^nameserver/ {print $2}' /etc/resolv.conf | sed -n '1p')
DNS2=$(awk '/^nameserver/ {print $2}' /etc/resolv.conf | sed -n '2p')

cat > /opt/phytcoi/discovery/candidates/function-candidates-$TS.json << JSON
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

cat > /opt/phytcoi/discovery/runs/discovery-run-$TS.json << JSON
{
  "timestamp": "$(date -Iseconds)",
  "run_id": "$TS",
  "status": "completed",
  "lifecycle": "OBSERVE",
  "output": "function_candidates"
}
JSON

cat > /opt/phytcoi/discovery/journal/run-$TS.json << JSON
{
  "timestamp": "$(date -Iseconds)",
  "event": "discovery_metabolism_completed",
  "run_id": "$TS"
}
JSON

python3 - << PY
import json
from pathlib import Path
from datetime import datetime
p = Path("/opt/phytcoi/discovery/state/discovery-state.json")
s = json.loads(p.read_text())
s["run_count"] = s.get("run_count", 0) + 1
s["function_candidates_count"] = s.get("function_candidates_count", 0) + 3
s["last_run"] = datetime.now().astimezone().isoformat()
p.write_text(json.dumps(s, indent=2) + "\n")
PY
