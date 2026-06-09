#!/usr/bin/env bash
TS=$(date +%Y%m%d-%H%M%S)

mkdir -p /opt/phytcoi/runtime/boot /opt/phytcoi/runtime/runs

cat > /opt/phytcoi/runtime/boot/boot-event-$TS.json << JSON
{
  "timestamp": "$(date -Iseconds)",
  "individual": "PHYT-001",
  "event": "observe_chain_started",
  "lifecycle": "OBSERVE"
}
JSON

/opt/phytcoi/bin/observer-metabolism-v1.sh
/opt/phytcoi/bin/discovery-metabolism-v1.sh
/opt/phytcoi/bin/memory-metabolism-v1.sh

cat > /opt/phytcoi/runtime/runs/observe-chain-run-$TS.json << JSON
{
  "timestamp": "$(date -Iseconds)",
  "individual": "PHYT-001",
  "run_id": "$TS",
  "status": "completed",
  "modules": [
    "observer",
    "discovery",
    "memory"
  ],
  "lifecycle": "OBSERVE"
}
JSON
