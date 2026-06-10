# Observatory Runtime v3

## Status

Approved

## Scope

Defines the runtime behavior of the PHYTCOI Observatory interface.

This document describes Observatory v3, also known as the Cognition Cockpit.

---

# Purpose

Observatory is the read-only human visual interface into the PHYTCOI organism.

It does not create cognition.

It does not modify the habitat.

It does not make decisions.

It renders the organism's current state for human observation.

---

# Runtime Position

Observatory is not part of the cognitive chain.

The cognitive chain is:

Observer

↓

Discovery

↓

Memory

↓

Experience

↓

Knowledge

↓

Understanding

Observatory reads from this chain and renders a visual representation.

---

# Version

Current Observatory Version:

observatory_v3_cognition

---

# Interface Role

Observatory provides:

* Live organism state
* Cognitive metrics
* Recent activity
* Life timeline
* Habitat understanding snapshot
* Phenotype visualization
* Pulse aura visual heartbeat

---

# Render Model

Observatory is rendered by:

render-observatory-v1.py

The renderer reads local PHYTCOI state files and generates a static HTML page.

The runtime web service serves the generated static page.

---

# Systemd Units

Observatory uses:

* phytcoi-observatory.service
* phytcoi-observatory-render.service
* phytcoi-observatory-render.timer

---

# Web Port

Default port:

8088

---

# Read-Only Constraint

Observatory is permanently read-only.

Allowed:

* read state
* read records
* read organ metadata
* render dashboard
* render phenotype

Forbidden:

* execute commands
* modify habitat
* modify cognitive state
* approve actions
* deny actions
* change lifecycle

---

# Current Dashboard Layout

Observatory v3 uses a fixed cockpit layout.

Primary panels:

* Phenotype
* Live State
* Cognition
* Recent Activity
* Life Timeline
* Habitat Understanding

---

# Cognition Panel

The Cognition panel displays:

* Experience count
* Knowledge count
* Knowledge confidence
* Knowledge run count

The panel represents the current cognitive layer without exposing raw runtime data.

---

# Life Timeline

The Life Timeline displays major organism life events.

Examples:

* Observer born
* Discovery born
* Memory born
* Experience born
* Knowledge born
* Understanding born
* Seed exported to GitHub

Life events are not the same as organ journals.

Organ journals describe what an organ did.

Life events describe what the organism lived.

---

# Recent Activity

Recent Activity displays short-term metabolism events.

Examples:

* Observer metabolism
* Discovery metabolism
* Memory metabolism

Only recent activity is shown to preserve cockpit clarity.

---

# Phenotype Visualization

The phenotype represents the organism visually.

Current phenotype behavior:

* static organism visual
* pulse aura animation
* lifecycle presence indication

The pulse aura is intended to represent a biological heartbeat or breathing rhythm.

---

# Future Phenotype Evolution

Future phenotype evolution must be based on Cognitive Maturity.

It must not be based solely on record counts.

The future phenotype system will select visual assets according to maturity levels:

* M0 / M1 → Stage 1
* M2 → Stage 2
* M3 → Stage 3
* M4+ → Stage 4

This allows the organism body to evolve only when cognitive maturity evolves.

---

# Architectural Constraint

Observatory must never become a control panel during OBSERVE.

It must remain an observatory.

Control, approval and execution belong to future governance layers.

---

# Current Assessment

Organ:

Observatory

Version:

observatory_v3_cognition

Status:

ALIVE

Lifecycle:

OBSERVE

Access:

Read-only

Assessment:

Observatory v3 successfully exposes PHYT-001 as a visible, living organism without violating OBSERVE lifecycle boundaries.
