#!/usr/bin/env bash
TS=$(date +%Y%m%d-%H%M%S)

mkdir -p /opt/phytcoi/evidence/observer /opt/phytcoi/hypothesis /opt/phytcoi/observer/runs /opt/phytcoi/observer/journal

GATEWAY=$(ip route | awk '/default/ {print $3; exit}')
DNS_SERVERS=$(awk '/^nameserver/ {print $2}' /etc/resolv.conf | paste -sd "," -)

GW_REACHABLE=false
ping -c 1 -W 2 "$GATEWAY" >/dev/null 2>&1 && GW_REACHABLE=true

DNS_HEALTHY=true
IFS=',' read -ra DNS_ARRAY <<< "$DNS_SERVERS"
for DNS in "${DNS_ARRAY[@]}"; do
  timeout 2 bash -c "</dev/tcp/$DNS/53" >/dev/null 2>&1 || DNS_HEALTHY=false
done

cat > /opt/phytcoi/evidence/observer/observer-evidence-$TS.json << JSON
{
  "timestamp": "$(date -Iseconds)",
  "observer": "PHYT-001",
  "organ": "observer",
  "run_id": "$TS",
  "gateway": "$GATEWAY",
  "gateway_reachable": $GW_REACHABLE,
  "dns_servers": "$DNS_SERVERS",
  "dns_healthy": $DNS_HEALTHY
}
JSON

cat > /opt/phytcoi/hypothesis/observer-hypothesis-$TS.json << JSON
{
  "timestamp": "$(date -Iseconds)",
  "run_id": "$TS",
  "organ": "observer",
  "hypotheses": [
    {
      "function": "network_gateway",
      "status": "$([ "$GW_REACHABLE" = true ] && echo healthy || echo degraded)"
    },
    {
      "function": "name_resolution",
      "status": "$([ "$DNS_HEALTHY" = true ] && echo healthy || echo degraded)"
    }
  ]
}
JSON

cat > /opt/phytcoi/observer/runs/observer-run-$TS.json << JSON
{
  "timestamp": "$(date -Iseconds)",
  "run_id": "$TS",
  "status": "completed",
  "lifecycle": "OBSERVE"
}
JSON

cat > /opt/phytcoi/observer/journal/run-$TS.json << JSON
{
  "timestamp": "$(date -Iseconds)",
  "event": "observer_metabolism_completed",
  "run_id": "$TS"
}
JSON

python3 - << PY
import json
from pathlib import Path
from datetime import datetime
p = Path("/opt/phytcoi/observer/state/observer-state.json")
s = json.loads(p.read_text())
s["run_count"] = s.get("run_count", 0) + 1
s["evidence_count"] = s.get("evidence_count", 0) + 1
s["hypothesis_count"] = s.get("hypothesis_count", 0) + 1
s["last_run"] = datetime.now().astimezone().isoformat()
p.write_text(json.dumps(s, indent=2) + "\n")
PY
