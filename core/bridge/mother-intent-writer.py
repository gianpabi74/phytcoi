#!/usr/bin/env python3
import json
import pathlib
import sys
from datetime import datetime, timezone

ROOT = pathlib.Path(__file__).resolve().parents[2]
INTENTS = ROOT / "events" / "intents"

def main():
    if len(sys.argv) < 2:
        print("USAGE: mother-intent-writer.py '<human command>'", file=sys.stderr)
        sys.exit(2)

    command = " ".join(sys.argv[1:]).strip()
    ts = datetime.now(timezone.utc).strftime("%Y%m%dT%H%M%SZ")
    intent_id = f"intent_{ts}"

    payload = {
        "intent_id": intent_id,
        "created_at": datetime.now(timezone.utc).isoformat(),
        "source": "mother",
        "human_command": command,
        "mode": "audit_then_patch",
        "mutation_allowed": False,
        "requires_backup": True,
        "requires_verification": True,
        "status": "new"
    }

    INTENTS.mkdir(parents=True, exist_ok=True)
    out = INTENTS / f"{intent_id}.json"
    out.write_text(json.dumps(payload, indent=2) + "\n", encoding="utf-8")
    print(str(out))

if __name__ == "__main__":
    main()
