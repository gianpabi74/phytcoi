#!/usr/bin/env python3
import json
from pathlib import Path
from datetime import datetime

ROOT = Path("/opt/phytcoi")
PUB = ROOT / "observatory" / "public"
STATE = ROOT / "observatory" / "state" / "observatory-state.json"

def load(path, default=None):
    try:
        return json.loads(Path(path).read_text())
    except Exception:
        return default if default is not None else {}

identity = load(ROOT / "identity" / "phyt-001.json", {})
observer = load(ROOT / "observer" / "state" / "observer-state.json", {})
discovery = load(ROOT / "discovery" / "state" / "discovery-state.json", {})
memory = load(ROOT / "memory" / "state" / "memory-state.json", {})

evidence_count = len(list((ROOT / "evidence").rglob("*.json")))
hypothesis_count = len(list((ROOT / "hypothesis").rglob("*.json")))
dna_count = len(list((ROOT / "dna").rglob("*.json")))
memory_count = len(list((ROOT / "memory" / "records").glob("*.json")))
germ_count = len(list((ROOT / "runtime" / "germ").glob("*.json")))

phenotype_src = ROOT / "runtime" / "phenotype" / "phyt-001-current.svg"
phenotype_dst = PUB / "phyt-001-current.svg"
if phenotype_src.exists():
    phenotype_dst.write_text(phenotype_src.read_text())

now = datetime.now().astimezone().isoformat()

def status_dot(status):
    return "🟢" if status == "ALIVE" else "🟡"

html = f"""<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PHYT-001 Observatory</title>
<style>
:root {{
  --bg:#050b08;
  --panel:#0a1811;
  --panel2:#0d2117;
  --green:#39d98a;
  --cyan:#55f0c2;
  --text:#e8fff4;
  --muted:#8bb89e;
  --warn:#ffcc66;
}}
* {{ box-sizing:border-box; }}
body {{
  margin:0;
  min-height:100vh;
  background:
    radial-gradient(circle at 50% 10%, rgba(57,217,138,.20), transparent 30%),
    radial-gradient(circle at 80% 80%, rgba(85,240,194,.08), transparent 30%),
    var(--bg);
  color:var(--text);
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
}}
.header {{
  padding:28px 32px 12px;
  display:flex;
  justify-content:space-between;
  align-items:center;
}}
.brand h1 {{
  margin:0;
  font-size:42px;
  letter-spacing:.04em;
}}
.brand p {{ margin:6px 0 0; color:var(--muted); }}
.badge {{
  border:1px solid rgba(57,217,138,.45);
  color:var(--green);
  padding:10px 14px;
  border-radius:999px;
  background:rgba(57,217,138,.08);
  box-shadow:0 0 24px rgba(57,217,138,.18);
}}
.grid {{
  display:grid;
  grid-template-columns: 1.1fr .9fr;
  gap:22px;
  padding:22px 32px 32px;
}}
.card {{
  background:linear-gradient(180deg, rgba(13,33,23,.95), rgba(5,11,8,.9));
  border:1px solid rgba(85,240,194,.18);
  border-radius:26px;
  padding:22px;
  box-shadow:0 20px 60px rgba(0,0,0,.35), inset 0 0 28px rgba(57,217,138,.04);
}}
.phenotype {{
  display:flex;
  align-items:center;
  justify-content:center;
  min-height:520px;
}}
.phenotype img {{
  width:min(430px, 90%);
  filter: drop-shadow(0 0 30px rgba(57,217,138,.35));
  animation:pulse 5s ease-in-out infinite;
}}
@keyframes pulse {{
  0%,100% {{ transform:scale(1); opacity:.95; }}
  50% {{ transform:scale(1.025); opacity:1; }}
}}
.kv {{
  display:grid;
  grid-template-columns: 150px 1fr;
  gap:10px 16px;
  font-size:16px;
}}
.kv div:nth-child(odd) {{ color:var(--muted); }}
.organs {{
  display:grid;
  gap:12px;
}}
.organ {{
  display:flex;
  justify-content:space-between;
  padding:14px 16px;
  border-radius:16px;
  background:rgba(255,255,255,.035);
  border:1px solid rgba(255,255,255,.06);
}}
.metrics {{
  display:grid;
  grid-template-columns:repeat(2,1fr);
  gap:12px;
}}
.metric {{
  padding:18px;
  border-radius:18px;
  background:rgba(57,217,138,.06);
  border:1px solid rgba(57,217,138,.15);
}}
.metric strong {{
  display:block;
  font-size:34px;
  color:var(--cyan);
}}
.metric span {{ color:var(--muted); }}
.footer {{
  padding:0 32px 28px;
  color:var(--muted);
  font-size:13px;
}}
h2 {{ margin-top:0; color:var(--green); }}
@media(max-width:900px) {{
  .grid {{ grid-template-columns:1fr; }}
}}
</style>
</head>
<body>
  <div class="header">
    <div class="brand">
      <h1>🌱 PHYT-001</h1>
      <p>PHYTCOI Observatory · read-only organism window</p>
    </div>
    <div class="badge">ALIVE · OBSERVE</div>
  </div>

  <div class="grid">
    <div class="card phenotype">
      <img src="phyt-001-current.svg" alt="PHYT-001 phenotype">
    </div>

    <div class="card">
      <h2>Live State</h2>
      <div class="kv">
        <div>Species</div><div>{identity.get("species","PHYTCOI")}</div>
        <div>Individual</div><div>{identity.get("individual","PHYT-001")}</div>
        <div>Nest</div><div>{identity.get("nest","NEST-ALPHA")}</div>
        <div>Lifecycle</div><div>{identity.get("lifecycle","OBSERVE")}</div>
        <div>Status</div><div>{identity.get("status","ALIVE")}</div>
        <div>Last render</div><div>{now}</div>
      </div>

      <h2 style="margin-top:26px">Organs</h2>
      <div class="organs">
        <div class="organ"><span>{status_dot(observer.get("status"))} Observer</span><span>runs {observer.get("run_count",0)}</span></div>
        <div class="organ"><span>{status_dot(discovery.get("status"))} Discovery</span><span>runs {discovery.get("run_count",0)}</span></div>
        <div class="organ"><span>{status_dot(memory.get("status"))} Memory</span><span>runs {memory.get("run_count",0)}</span></div>
      </div>
    </div>

    <div class="card">
      <h2>Knowledge</h2>
      <div class="metrics">
        <div class="metric"><strong>{evidence_count}</strong><span>Evidence</span></div>
        <div class="metric"><strong>{hypothesis_count}</strong><span>Hypotheses</span></div>
        <div class="metric"><strong>{dna_count}</strong><span>DNA Records</span></div>
        <div class="metric"><strong>{memory_count}</strong><span>Memory Records</span></div>
      </div>
    </div>

    <div class="card">
      <h2>Habitat Understanding</h2>
      <div class="kv">
        <div>Network Provider</div><div>1 candidate</div>
        <div>Resolution Providers</div><div>2 candidates</div>
        <div>Germ Structures</div><div>{germ_count}</div>
        <div>Execution</div><div>disabled</div>
        <div>Habitat Modification</div><div>forbidden</div>
      </div>
    </div>
  </div>

  <div class="footer">
    Generated by PHYTCOI Observatory v1 · source of truth: /opt/phytcoi JSON state · no decisions · no execution
  </div>
</body>
</html>
"""

(PUB / "index.html").write_text(html)

state = load(STATE, {})
state["last_render"] = now
state["render_count"] = state.get("render_count", 0) + 1
STATE.write_text(json.dumps(state, indent=2) + "\n")
