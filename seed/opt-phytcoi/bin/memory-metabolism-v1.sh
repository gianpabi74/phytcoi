#!/usr/bin/env bash
TS=$(date +%Y%m%d-%H%M%S)

mkdir -p /opt/phytcoi/memory/records /opt/phytcoi/memory/journal

EVIDENCE_COUNT=$(find /opt/phytcoi/evidence -name "*.json" | wc -l)
HYPOTHESIS_COUNT=$(find /opt/phytcoi/hypothesis -name "*.json" | wc -l)
DNA_COUNT=$(find /opt/phytcoi/dna -name "*.json" | wc -l)
ORGAN_COUNT=$(find /opt/phytcoi -name "*organ*.json" | wc -l)
GERM_COUNT=$(find /opt/phytcoi/runtime/germ -name "*.json" 2>/dev/null | wc -l)

cat > /opt/phytcoi/memory/records/memory-record-$TS.json << JSON
{
  "timestamp": "$(date -Iseconds)",
  "organ": "memory",
  "lifecycle": "OBSERVE",
  "summary": {
    "evidence_records": $EVIDENCE_COUNT,
    "hypothesis_records": $HYPOTHESIS_COUNT,
    "dna_records": $DNA_COUNT,
    "organs": $ORGAN_COUNT,
    "germ_structures": $GERM_COUNT
  },
  "meaning": "PHYT-001 remembers current organism state without deciding or executing"
}
JSON

cat > /opt/phytcoi/memory/journal/run-$TS.json << JSON
{
  "timestamp": "$(date -Iseconds)",
  "event": "memory_metabolism_completed",
  "run_id": "$TS"
}
JSON

python3 - << PY
import json
from pathlib import Path
from datetime import datetime
p = Path("/opt/phytcoi/memory/state/memory-state.json")
s = json.loads(p.read_text())
s["run_count"] = s.get("run_count", 0) + 1
s["memory_records_count"] = s.get("memory_records_count", 0) + 1
s["last_run"] = datetime.now().astimezone().isoformat()
p.write_text(json.dumps(s, indent=2) + "\n")
PY
