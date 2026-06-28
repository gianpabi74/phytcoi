#!/usr/bin/env python3
import json
import pathlib
from datetime import datetime, timezone

ROOT = pathlib.Path(__file__).resolve().parents[2]
INTENTS = ROOT / "events" / "intents"
RESULTS = ROOT / "events" / "results"

def main():
    RESULTS.mkdir(parents=True, exist_ok=True)

    for path in sorted(INTENTS.glob("intent_*.json")):
        data = json.loads(path.read_text(encoding="utf-8"))
        intent_id = data["intent_id"]
        result = RESULTS / f"result_{intent_id}.json"

        if result.exists():
            continue

        payload = {
            "result_id": f"result_{intent_id}",
            "intent_id": intent_id,
            "created_at": datetime.now(timezone.utc).isoformat(),
            "executor": "nest-control-poller",
            "mode": "dry_run",
            "status": "observed",
            "message": "Intent received. Runtime mutation is disabled in phase 1.",
            "human_command": data.get("human_command")
        }

        result.write_text(json.dumps(payload, indent=2) + "\n", encoding="utf-8")
        print(f"CREATED {result}")

if __name__ == "__main__":
    main()
