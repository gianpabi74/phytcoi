# Objective Formation Model V1

## Status

Proposed

---

# Purpose

The Objective Formation Organ is responsible for transforming contextual relevance into candidate objectives.

Before this stage PHYTCOI can determine:

* what exists
* what is known
* what is unknown
* what appears important

However PHYTCOI still cannot answer:

> What should I learn next?

Objective Formation exists to answer that question.

---

# Architectural Position

Objective Formation is positioned after Context.

The cognitive chain becomes:

```text
World Model
    ↓
Context
    ↓
Objective Formation
```

Context identifies relevance.

Objective Formation converts relevance into objectives.

---

# Core Responsibility

Objective Formation transforms:

```text
known domains
unknown domains
cognitive gaps
growth opportunities
```

into:

```text
objective candidates
```

The organ does not create plans.

The organ does not create actions.

The organ does not create decisions.

---

# Objective Definition

An objective is:

```text
a desired future cognitive state
```

An objective is not:

```text
a task

a command

an execution

a configuration change
```

---

# Examples

Valid objectives:

```text
learn_identity_domain

learn_authentication_domain

learn_storage_domain

learn_backup_domain

improve_world_model_accuracy

improve_context_quality
```

Invalid objectives:

```text
restart_server

modify_dns

create_vm

change_configuration

delete_file
```

These belong to future executor layers.

---

# Objective Sources

Objective Formation consumes:

```text
context/state/context-latest.json

world_model/state/world-model-latest.json

knowledge/state/knowledge-latest.json

self/state/self-model.json

audit/cognitive/cognitive-audit.json
```

---

# Objective Categories

Objectives are grouped by category.

---

## Knowledge Objectives

Goal:

Increase domain knowledge.

Example:

```text
learn_identity_domain
```

---

## Understanding Objectives

Goal:

Increase understanding quality.

Example:

```text
improve_identity_understanding
```

---

## World Model Objectives

Goal:

Improve environmental representation.

Example:

```text
improve_habitat_representation
```

---

## Self Objectives

Goal:

Improve self-awareness.

Example:

```text
improve_self_consistency
```

---

## Cognitive Quality Objectives

Goal:

Improve cognition itself.

Example:

```text
improve_context_accuracy
```

---

# Objective Candidate Structure

Canonical structure:

```json
{
  "objective_id": "learn_identity_domain",
  "objective_type": "knowledge_objective",
  "priority": "high",
  "confidence": "medium",
  "origin": "context_gap",
  "status": "candidate"
}
```

---

# Priority Model

Objectives receive a priority.

Possible values:

```text
low

medium

high

critical
```

Priority is derived from:

```text
cognitive gap size

domain importance

context relevance

audit findings
```

---

# Confidence Model

Each objective contains:

```text
low

medium

high
```

Confidence is derived from:

```text
evidence

knowledge

understanding

world model coherence
```

---

# Objective Ledger

Historical objectives are stored in:

```text
objective/records/
```

Latest objective state:

```text
objective/state/objective-latest.json
```

Awareness output:

```text
objective/state/objective-awareness-latest.json
```

---

# Objective Awareness

The organ produces a cognitive explanation.

Example:

```text
I currently observe 8 unknown domains.

Identity appears to be the largest cognitive gap.

I therefore generated the objective:

learn_identity_domain

This objective is a candidate.

It does not authorize planning, decision making or execution.
```

---

# Relationship With Planner

Objective Formation does not create plans.

Objective Formation creates objective candidates.

Future Planner Seed consumes objectives.

Relationship:

```text
Context
    ↓
Objective Formation
    ↓
Planner Seed
```

---

# Lifecycle

Current lifecycle:

```text
OBSERVE
```

Objective Formation remains inside OBSERVE.

No authority is granted.

No action authority is produced.

---

# Integrity Requirements

A valid objective requires:

```text
valid context

valid world model

valid self model
```

Without those dependencies:

```text
objective_status = DEGRADED
```

---

# Success Criteria

Objective Formation V1 succeeds when PHYTCOI can:

* identify cognitive gaps
* generate objective candidates
* prioritize objectives
* explain objective generation

without creating plans or actions.

---

# Architectural Principles

```text
objective_before_planning

candidate_not_plan

candidate_not_decision

candidate_not_execution

observe_only

context_driven

world_model_driven

audit_first
```

---

# Expected Outcome

After Objective Formation V1, PHYTCOI gains the ability to identify what cognitive growth should occur next.

The organism still cannot plan or act.

However, for the first time, it can express intentional cognitive direction.

This becomes the foundation required for Planner Seed V1.
