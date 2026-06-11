# Context Model V1

## Status

Proposed

---

# Purpose

The Context Model defines the internal structure of contextual cognition inside PHYTCOI.

The Context Architecture defines why Context exists.

The Context Model defines how Context is represented.

The purpose of the model is to create a stable cognitive representation of relevance.

Context does not determine actions.

Context does not determine plans.

Context determines significance.

---

# Definition

A Context is a cognitive snapshot describing:

* current knowledge
* current limitations
* current opportunities
* current relevance

The Context Organ transforms cognitive state into contextual state.

---

# Context Sources

The Context Organ consumes information from:

```text
World Model
Understanding
Knowledge
Truth
Self Model
Cognitive Audit
```

These sources remain authoritative.

Context never becomes an authority source.

---

# Context Structure

The canonical structure contains six sections.

---

## Identity Context

Describes the current organism.

Example:

```json
{
  "species": "PHYTCOI",
  "individual": "PHYT-001",
  "lifecycle": "OBSERVE",
  "maturity": "COGNITIVE_ORGANISM"
}
```

---

## Knowledge Context

Represents known cognitive territory.

Example:

```json
{
  "known_domains": [
    "name_resolution",
    "network_access",
    "recursive_resolution"
  ]
}
```

---

## Gap Context

Represents areas not yet assimilated.

Example:

```json
{
  "unknown_domains": [
    "identity",
    "authentication",
    "storage",
    "backup"
  ]
}
```

Gap Context is one of the most important outputs of Context V1.

---

## Strength Context

Represents cognitive strengths.

Example:

```json
{
  "strengths": [
    "truth_generation",
    "relationship_generation",
    "world_model_generation"
  ]
}
```

Strengths indicate stable cognitive capabilities.

---

## Opportunity Context

Represents future learning opportunities.

Example:

```json
{
  "opportunities": [
    "identity_domain",
    "storage_domain",
    "backup_domain"
  ]
}
```

Opportunities are not objectives.

They are candidates for future objective generation.

---

## Constraint Context

Represents current limitations.

Example:

```json
{
  "constraints": [
    "observe_only",
    "no_execution",
    "no_governance",
    "no_habitat_modification"
  ]
}
```

Context must always include current organism boundaries.

---

# Canonical Output

Primary output:

```text
context/state/context-latest.json
```

Historical output:

```text
context/records/context-record-<timestamp>.json
```

Awareness output:

```text
context/state/context-awareness-latest.json
```

---

# Context Awareness

The awareness layer translates context into cognitive language.

Example:

```text
I currently know 3 domains.

I currently do not understand 8 domains.

My strongest cognitive capability is truth generation.

My largest growth opportunity is identity understanding.

I remain in OBSERVE lifecycle.

These observations do not authorize planning or execution.
```

---

# Context Stability

Context is expected to evolve slowly.

Context should change only when:

```text
new knowledge appears

new truths appear

new domains appear

cognitive maturity changes
```

Context should not fluctuate on every metabolism cycle.

---

# Context Confidence

Each context record includes:

```json
{
  "confidence": "low|medium|high"
}
```

Confidence is derived from:

* evidence volume
* truth volume
* understanding volume
* world model coherence

---

# Context Integrity

A valid context requires:

```text
World Model available

Self Model available

Knowledge available

Understanding available
```

If one of these is unavailable:

```text
context_status = DEGRADED
```

---

# Relationship With Objectives

Context never generates actions.

Context only identifies relevance.

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

Context remains observational.

No authority is granted.

No action authority is produced.

---

# Success Criteria

Context V1 succeeds when PHYTCOI can consistently represent:

* who it is
* what it knows
* what it does not know
* where it is strong
* where it is weak
* where growth is possible

without generating plans or actions.

---

# Architectural Principles

```text
context_represents_relevance

context_not_objective

context_not_plan

context_not_decision

observe_only

world_model_driven

evidence_driven

audit_first
```

---

# Expected Outcome

After Context Model V1, PHYTCOI possesses a formal representation of cognitive relevance.

The organism can identify where future growth should occur, creating the foundation required for Objective Formation V1.
