# Context Architecture V1

## Status

Proposed

---

# Purpose

The Context Organ is the first organ that allows PHYTCOI to move beyond passive cognition.

Before Context, PHYTCOI can:

* observe
* discover
* remember
* accumulate experience
* formulate hypotheses
* assimilate knowledge
* derive relationships
* validate truths
* construct understanding
* build a world model
* understand itself

However, PHYTCOI still lacks an answer to a fundamental question:

> What currently matters?

The Context Organ exists to answer that question.

---

# Architectural Position

The Context Organ is positioned immediately after the World Model.

The cognitive chain becomes:

```text
Observer
    ↓
Discovery
    ↓
Memory
    ↓
Experience
    ↓
Hypothesis
    ↓
Knowledge
    ↓
Relationship
    ↓
Truth
    ↓
Understanding
    ↓
World Model
    ↓
Context
```

Context consumes cognition.

Context does not create cognition.

---

# Core Responsibility

The responsibility of Context is:

```text
convert understanding into relevance
```

The organ determines which observed realities deserve future attention.

It does not decide actions.

It does not decide plans.

It only determines relevance.

---

# What Context Is Not

Context is not:

```text
planner
decision engine
governance engine
executor
approval engine
```

Context never:

```text
changes habitat
changes configuration
approves actions
executes actions
```

---

# Inputs

The Context Organ consumes:

```text
world_model/state/world-model-latest.json
understanding/state/understanding-latest.json
knowledge/state/knowledge-latest.json
self/state/self-model.json
audit/cognitive/cognitive-audit.json
```

---

# Context Questions

The organ attempts to answer:

```text
What do I know?

What do I not know?

What is stable?

What is incomplete?

What appears important?

What limits my future cognition?
```

---

# Context Categories

Context information is classified into categories.

---

## Known Domains

Domains already supported by evidence.

Example:

```text
name_resolution
network_access
```

---

## Emerging Domains

Domains partially observed but not assimilated.

Example:

```text
identity
authentication
storage
backup
```

---

## Cognitive Strengths

Areas where cognition is stable.

Example:

```text
truth derivation
relationship formation
world model generation
```

---

## Cognitive Gaps

Areas where cognition is incomplete.

Example:

```text
identity understanding
storage understanding
backup understanding
```

---

# Context Output

Primary output:

```text
context/state/context-latest.json
```

Secondary output:

```text
context/state/context-awareness-latest.json
```

Historical outputs:

```text
context/records/
```

---

# Context Awareness

Context must produce a self-readable awareness statement.

Example:

```text
I currently understand 3 domains.

I observe 8 unknown domains.

My strongest understanding is name resolution.

My largest cognitive gap is identity and authentication.

These observations are context only.

They do not authorize planning, decision making or execution.
```

---

# Relationship With Self Model

The Self Model answers:

```text
Who am I?
```

The Context Organ answers:

```text
What currently matters?
```

The two organs complement each other.

---

# Relationship With Future Objectives

Context does not create objectives.

Context identifies relevance.

Future Objective Formation consumes Context.

Relationship:

```text
Context
    ↓
Objective Formation
```

---

# Lifecycle

Current lifecycle:

```text
OBSERVE
```

Context remains an observing organ.

No authority is granted.

No execution authority is created.

---

# Success Criteria

Context V1 is considered successful when PHYTCOI can:

* identify known domains
* identify unknown domains
* identify strongest cognitive areas
* identify largest cognitive gaps
* produce context awareness

without creating plans or actions.

---

# Architectural Principles

```text
context_before_objectives

relevance_before_planning

observe_only

no_execution

no_authority

audit_first

world_model_driven

evidence_driven
```

---

# Expected Outcome

After Context V1, PHYTCOI gains the ability to understand not only what it knows, but also what currently deserves attention.

This capability becomes the foundation for future Objective Formation and Planner development.
