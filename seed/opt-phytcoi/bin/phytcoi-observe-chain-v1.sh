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
/opt/phytcoi/bin/experience-metabolism-v1.sh
/opt/phytcoi/bin/knowledge-metabolism-v1.sh
/opt/phytcoi/bin/understanding-metabolism-v1.sh
/opt/phytcoi/bin/relationship-metabolism-v1.sh
/opt/phytcoi/bin/context-metabolism-v1.sh

cat > /opt/phytcoi/runtime/runs/observe-chain-run-$TS.json << JSON
{
  "timestamp": "$(date -Iseconds)",
  "individual": "PHYT-001",
  "run_id": "$TS",
  "status": "completed",
  "modules": [
    "observer",
    "discovery",
    "memory",
    "experience",
    "knowledge",
    "understanding",
    "relationship",
    "context"
  ],
  "lifecycle": "OBSERVE"
}
JSON

chown -R aiadmin:aiadmin \
  /opt/phytcoi/evidence \
  /opt/phytcoi/hypothesis \
  /opt/phytcoi/observer \
  /opt/phytcoi/discovery \
  /opt/phytcoi/memory \
  /opt/phytcoi/experience \
  /opt/phytcoi/knowledge \
  /opt/phytcoi/understanding \
  /opt/phytcoi/relationship \
  /opt/phytcoi/context \
  /opt/phytcoi/runtime/boot \
  /opt/phytcoi/runtime/runs
