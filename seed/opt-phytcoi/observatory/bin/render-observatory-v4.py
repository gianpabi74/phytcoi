#!/usr/bin/env python3
import html
import json
import shutil
from datetime import datetime, timezone
from pathlib import Path

ROOT = Path("/opt/phytcoi")
OBS = ROOT / "observatory"
PUBLIC = OBS / "public"
STATE = OBS / "state"
JOURNAL = OBS / "journal"
ASSETS = OBS / "assets" / "phenotype"

def read_json(path, default=None):
    try:
        if path.exists():
            return json.loads(path.read_text())
    except Exception:
        pass
    return default if default is not None else {}

def esc(value):
    return html.escape(str(value)) if value is not None else ""

def copy_asset(name):
    src = ASSETS / name
    dst = PUBLIC / name
    if src.exists():
        shutil.copy2(src, dst)
        return name
    return None

def metric(value, label):
    return f"<div class='metric'><div class='metric-value'>{esc(value)}</div><div class='metric-label'>{esc(label)}</div></div>"

def badge(text, cls=""):
    return f"<span class='badge {cls}'>{esc(text)}</span>"

def short_identity_text(cognitive):
    text = cognitive.get("identity_text", "")
    lines = [x.strip() for x in text.splitlines() if x.strip()]
    keep = []
    for line in lines:
        if line.startswith("I am PHYT-001"):
            keep.append(line)
        elif line.startswith("I am a PHYTCOI"):
            keep.append(line)
        elif "possess" in line:
            keep.append(line)
        elif "unique" in line:
            keep.append(line)
        elif "do not know" in line:
            keep.append(line)
        elif "cognitive maturity" in line:
            keep.append(line)
        elif line == "EARLY_COGNITION":
            keep.append(line)
    return "\n".join(keep)

def render():
    now = datetime.now(timezone.utc).astimezone().isoformat()

    identity = read_json(ROOT / "identity" / "phyt-001.json")
    self_model = read_json(ROOT / "self" / "state" / "self-model.json")
    cognitive = read_json(ROOT / "context" / "state" / "cognitive-identity-latest.json")
    knowledge = read_json(ROOT / "knowledge" / "state" / "knowledge-awareness-latest.json")
    truth = read_json(ROOT / "truth" / "state" / "truth-awareness-latest.json")
    unknown = read_json(ROOT / "knowledge" / "state" / "unknown-awareness-latest.json")
    boundary = read_json(ROOT / "self" / "state" / "self-habitat-boundary-latest.json")
    consistency = read_json(ROOT / "self" / "state" / "self-boundary-consistency-latest.json")
    graph = read_json(ROOT / "discovery" / "graph" / "capability-graph-latest.json")
    domain_awareness = read_json(ROOT / "context" / "state" / "domain-awareness-latest.json")
    overlay = read_json(ROOT / "discovery" / "graph" / "candidate-overlay-latest.json")
    old_state = read_json(STATE / "observatory-state.json")

    body_asset = copy_asset("PHYTCOI_STAGE1.png")
    brain_asset = copy_asset("PHTCOI_BRAIN_STAGE1.png")

    organs = [o.get("organ_id") for o in self_model.get("known_organs", []) if o.get("organ_id")]
    known_domains = unknown.get("known_domains", [])
    validated_domains = [d.get("domain") for d in domain_awareness.get("validated_domains", [])]
    emerging_domains = [d.get("domain") for d in domain_awareness.get("emerging_domains", [])]
    unknown_domains = unknown.get("unknown_domains", [])
    coverage = unknown.get("knowledge_coverage_percent", 0)
    capabilities = sorted(graph.get("capabilities", {}).keys())
    emerging_capabilities = sorted(overlay.get("candidate_capabilities", {}).keys())
    emerging_candidate_count = overlay.get("candidate_capability_count", 0)
    objects = graph.get("objects", {})
    truth_items = truth.get("truths", [])

    body_img = f"<img src='{esc(body_asset)}' alt='PHYTCOI body'>" if body_asset else "<div class='missing'>missing body image</div>"
    brain_img = f"<img src='{esc(brain_asset)}' alt='PHYTCOI cortex'>" if brain_asset else "<div class='missing'>missing cortex image</div>"

    recent_activity = [
        "Self reflection",
        "Boundary consistency",
        "Knowledge awareness",
        "Truth awareness",
        "Unknown awareness",
        "Cognitive identity"
    ]

    timeline_files = sorted((ROOT / "life" / "events").glob("*.json"))[-6:]
    timeline = []
    for f in reversed(timeline_files):
        d = read_json(f)
        timeline.append({
            "title": d.get("event") or d.get("title") or f.stem.replace("-", " "),
            "time": d.get("timestamp") or d.get("birth_timestamp") or ""
        })

    habitat_rows = ""
    for obj, data in sorted(objects.items()):
        caps = [c.get("capability") for c in data.get("capabilities", [])]
        habitat_rows += f"<div class='habitat-row'><div>{esc(obj)}</div><div>{esc(', '.join(caps))}</div></div>"

    html_doc = f"""<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PHYTCOI Observatory V4</title>
<link rel="icon" type="image/svg+xml" href="favicon.svg">
<style>
:root {{
  --bg:#020b07;
  --panel:#06180f;
  --panel2:#0a2014;
  --line:#096632;
  --line2:#0d7d3e;
  --text:#e9fff1;
  --muted:#9bc9a8;
  --green:#3dff88;
  --green2:#7dffad;
  --warn:#ffd36a;
}}
* {{ box-sizing:border-box; }}
html, body {{ margin:0; min-height:100%; background:radial-gradient(circle at 18% 8%, #0f3b21 0, #020b07 42%, #000 100%); color:var(--text); font-family:Inter, ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif; overflow:hidden; }}
main {{ height:100vh; width:100vw; padding:10px 12px; display:grid; grid-template-rows:78px 1fr 32px; gap:9px; }}
.header {{ border:1px solid var(--line); border-radius:18px; background:linear-gradient(135deg, rgba(13,71,34,.86), rgba(2,14,8,.94)); display:flex; align-items:center; justify-content:space-between; padding:12px 20px; box-shadow:0 0 40px rgba(0,255,120,.10); }}
.brand {{ display:flex; align-items:center; gap:16px; }}
.seed {{ width:42px; height:42px; border-radius:50%; display:grid; place-items:center; background:rgba(61,255,136,.12); box-shadow:0 0 28px rgba(61,255,136,.28); font-size:24px; animation:pulse 4.5s ease-in-out infinite; }}
h1 {{ margin:0; color:var(--green); font-size:34px; letter-spacing:.02em; line-height:1; }}
.subtitle {{ margin-top:5px; font-size:15px; font-weight:700; }}
.status {{ text-align:right; color:var(--green); font-weight:800; font-size:15px; }}
.status small {{ display:block; color:var(--muted); margin-top:8px; font-weight:600; }}
.grid {{ min-height:0; display:grid; grid-template-columns:1.05fr 1.05fr 1.05fr; grid-template-rows:1.05fr .95fr; gap:9px; }}
.card {{ min-height:0; overflow:hidden; border:1px solid var(--line); border-radius:18px; background:linear-gradient(180deg, rgba(8,33,19,.92), rgba(2,13,8,.96)); padding:14px 16px; box-shadow:inset 0 0 40px rgba(61,255,136,.035), 0 0 28px rgba(0,0,0,.25); }}
.card h2 {{ margin:0 0 10px; color:var(--green); font-size:20px; letter-spacing:-.02em; }}
.phenotype-card {{ display:grid; grid-template-rows:auto 1fr; }}
.dual-stage {{ display:grid; grid-template-columns:1fr 1fr; gap:10px; min-height:0; }}
.stage-box {{ border-radius:18px; background:rgba(0,0,0,.18); display:grid; grid-template-rows:1fr auto; place-items:center; padding:4px; box-shadow:0 0 40px rgba(61,255,136,.13); }}
.stage-breath {{ display:grid; place-items:center; animation:breathe 5.8s ease-in-out infinite; transform-origin:center; }}
.stage-breath:nth-child(2) {{ animation-delay:1.2s; }}
.stage-box img {{ max-width:100%; max-height:290px; object-fit:contain; border-radius:12px; }}
.stage-label {{ color:var(--muted); font-size:12px; font-weight:700; padding-top:4px; }}
.live-lines {{ font-size:15px; line-height:1.38; font-weight:650; }}
.organ-list {{ margin-top:16px; display:grid; gap:9px; }}
.organ-row {{ height:42px; display:flex; align-items:center; justify-content:space-between; padding:0 13px; border-radius:10px; background:rgba(255,255,255,.055); border:1px solid rgba(255,255,255,.055); font-weight:700; }}
.dot {{ width:16px; height:16px; border-radius:50%; background:var(--green); box-shadow:0 0 20px rgba(61,255,136,.8); display:inline-block; margin-right:10px; vertical-align:middle; animation:pulse 3.6s ease-in-out infinite; }}
.metrics {{ height:calc(100% - 36px); display:grid; grid-template-columns:1fr 1fr; gap:12px; }}
.metric {{ border:1px solid rgba(255,255,255,.08); border-radius:12px; background:rgba(255,255,255,.045); display:grid; place-items:center; text-align:center; padding:4px; }}
.metric-value {{ color:var(--green); font-weight:900; font-size:34px; line-height:1; }}
.metric-label {{ font-size:13px; font-weight:700; margin-top:5px; }}
.activity-list, .timeline-list {{ display:grid; gap:8px; }}
.activity-item {{ height:44px; display:flex; align-items:center; padding:0 14px; border-left:4px solid var(--green); border-radius:8px; background:rgba(255,255,255,.055); font-weight:700; }}
.timeline-item {{ display:grid; grid-template-columns:18px 1fr; gap:8px; align-items:start; font-size:13px; }}
.timeline-dot {{ width:12px; height:12px; margin-top:3px; border-radius:50%; background:var(--green); box-shadow:0 0 14px rgba(61,255,136,.8); }}
.timeline-title {{ font-weight:800; }}
.timeline-time {{ color:var(--muted); font-size:12px; }}
.badges {{ line-height:1.9; }}
.badge {{ display:inline-block; padding:4px 8px; border-radius:999px; margin:2px; font-size:12px; font-weight:800; border:1px solid rgba(61,255,136,.28); background:rgba(61,255,136,.08); }}
.badge.unknown {{ color:var(--warn); border-color:rgba(255,211,106,.32); background:rgba(255,211,106,.07); }}
.progress {{ height:11px; width:100%; background:rgba(255,255,255,.08); border-radius:999px; overflow:hidden; border:1px solid rgba(255,255,255,.08); margin:8px 0 12px; }}
.progress-fill {{ height:100%; width:{coverage}%; background:linear-gradient(90deg, var(--green), #c4ff70); }}
.identity-text {{ white-space:pre-wrap; font-size:12px; line-height:1.27; font-weight:650; color:#dfffe9; }}
.habitat-row {{ display:grid; grid-template-columns:120px 1fr; gap:8px; padding:5px 0; border-bottom:1px solid rgba(255,255,255,.06); font-size:12px; }}
.footer {{ border:1px solid var(--line); border-radius:12px; display:flex; align-items:center; justify-content:center; color:var(--muted); background:rgba(2,15,8,.75); font-size:12px; }}
@keyframes breathe {{
  0%,100% {{ transform:scale(1); filter:drop-shadow(0 0 8px rgba(61,255,136,.25)); }}
  50% {{ transform:scale(1.035); filter:drop-shadow(0 0 26px rgba(61,255,136,.62)); }}
}}
@keyframes pulse {{
  0%,100% {{ transform:scale(1); opacity:.82; }}
  50% {{ transform:scale(1.08); opacity:1; }}
}}
</style>
</head>
<body>
<main>
  <header class="header">
    <div class="brand">
      <div class="seed">🌱</div>
      <div>
        <h1>{esc(identity.get("individual", "PHYT-001"))}</h1>
        <div class="subtitle">PHYTCOI Observatory V4</div>
      </div>
    </div>
    <div class="status">ALIVE · {esc(identity.get("lifecycle", "OBSERVE"))} 🟢<small>{esc(now)}</small></div>
  </header>

  <section class="grid">
    <section class="card phenotype-card">
      <h2>Phenotype</h2>
      <div class="dual-stage">
        <div class="stage-box"><div class="stage-breath">{body_img}</div><div class="stage-label">BODY · STAGE 1</div></div>
        <div class="stage-box"><div class="stage-breath">{brain_img}</div><div class="stage-label">CORTEX · STAGE 1</div></div>
      </div>
    </section>

    <section class="card">
      <h2>Live State</h2>
      <div class="live-lines">
        Species: {esc(identity.get("species"))}<br>
        Individual: {esc(identity.get("individual"))}<br>
        Nest: {esc(identity.get("nest"))}<br>
        Maturity: {esc(cognitive.get("status"))}
      </div>
      <div class="organ-list">
        <div class="organ-row"><div><span class="dot"></span>Self</div><div>ALIVE</div></div>
        <div class="organ-row"><div><span class="dot"></span>Knowledge</div><div>AWARE</div></div>
        <div class="organ-row"><div><span class="dot"></span>Truth</div><div>AWARE</div></div>
      </div>
    </section>

    <section class="card">
      <h2>Cognition</h2>
      <div class="metrics">
        {metric(len(validated_domains), "Validated Domains")}
        {metric(len(emerging_domains), "Emerging Domains")}
        {metric(truth.get("unique_truth_count"), "Truths")}
        {metric(str(coverage) + "%", "Coverage")}
      </div>
    </section>

    <section class="card">
      <h2>Recent Activity</h2>
      <div class="activity-list">
        {''.join(f"<div class='activity-item'>🧠 {esc(x)}</div>" for x in recent_activity[:5])}
      </div>
    </section>

    <section class="card">
      <h2>Cognitive Domains</h2>
      <div class="progress"><div class="progress-fill"></div></div>
      <div class="badges">
        {''.join(badge("✓ " + x) for x in validated_domains)}
        {''.join(badge("↗ " + x, "unknown") for x in emerging_domains)}
      </div>
    </section>

    <section class="card">
      <h2>Habitat Understanding</h2>
      <div class="habitat-row"><div>Boundary</div><div>{esc(boundary.get("status"))}</div></div>
      <div class="habitat-row"><div>Consistency</div><div>{esc(consistency.get("status"))}</div></div>
      <div class="habitat-row"><div>Execution</div><div>disabled</div></div>
      <div class="habitat-row"><div>Modification</div><div>forbidden</div></div>
      {habitat_rows}
    </section>
  </section>

  <footer class="footer">
    Observatory V4 Domain Awareness · Validated Domains vs Emerging Domains · Cognitive dashboard only · No planner · No executor · No habitat modification
  </footer>
</main>
</body>
</html>"""

    PUBLIC.mkdir(parents=True, exist_ok=True)
    STATE.mkdir(parents=True, exist_ok=True)
    JOURNAL.mkdir(parents=True, exist_ok=True)

    (PUBLIC / "index.html").write_text(html_doc)
    (PUBLIC / "index-v4.html").write_text(html_doc)

    state = old_state if isinstance(old_state, dict) else {}
    state.update({
        "observatory_version": 4,
        "ui_version": "observatory_v4_compact_breathing_full_rewrite",
        "phase": "phase_2_compact_breathing_full_rewrite",
        "status": "ALIVE",
        "last_render": now,
        "render_count": state.get("render_count", 0) + 1,
        "known_domains": len(known_domains),
        "unknown_domains": len(unknown_domains),
        "coverage": coverage,
        "validated_capabilities": len(capabilities),
        "emerging_capability_classes": len(emerging_capabilities),
        "emerging_candidate_count": emerging_candidate_count,
        "validated_domains": len(validated_domains),
        "emerging_domains": len(emerging_domains)
    })
    (STATE / "observatory-state.json").write_text(json.dumps(state, indent=2) + "\n")

    stamp = datetime.now().strftime("%Y%m%d-%H%M%S")
    (JOURNAL / f"observatory-v4-compact-render-{stamp}.json").write_text(json.dumps({
        "timestamp": now,
        "version": 4,
        "phase": "phase_2_compact_breathing_full_rewrite",
        "status": "OK",
        "output": str(PUBLIC / "index.html")
    }, indent=2) + "\n")

    print("===== OBSERVATORY V4 COMPACT RENDERED =====")
    print(f"output={PUBLIC / 'index.html'}")
    print(f"known_domains={len(known_domains)}")
    print(f"unknown_domains={len(unknown_domains)}")
    print(f"coverage={coverage}%")
    print(f"organs={len(organs)}")
    print(f"capabilities={len(capabilities)}")
    print(f"truths={truth.get('unique_truth_count')}")

if __name__ == "__main__":
    render()
