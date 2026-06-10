# PHYTCOI Planner Architecture v1

## Status

Approved Architecture

Version: 1

Planned Implementation Scope:

M40+

---

# Purpose

This document defines the Planner architecture of PHYTCOI.

The Planner is responsible for generating possible future actions.

The Planner does not execute.

The Planner does not approve.

The Planner does not modify the habitat.

The Planner exists to answer:

What could be done?

---

# Core Principle

Planning is not execution.

A plan is a candidate future action.

Plans may be:

accepted

rejected

delayed

revised

expired

A plan has no authority by itself.

---

# Planner Position

Planner operates after cognition and governance.

The planning chain is:

Evidence
↓
Truth
↓
Understanding
↓
Causality
↓
Risk
↓
Governance
↓
Planner

The planner consumes cognition.

The planner does not create cognition.

---

# Planner Inputs

Planner may consume:

Evidence

Truth

Understanding

Causality

Risk

Policy

Authority

Trust

Lifecycle State

Planner must never consume assumptions as facts.

---

# Planner Outputs

Planner produces:

plan candidates

recommendations

impact estimates

rollback estimates

confidence estimates

Planner outputs are informational.

---

# Plan Candidate

A plan candidate contains:

objective

reason

expected outcome

confidence

risk profile

policy profile

rollback strategy

supporting truths

supporting risks

timestamp

---

# Planner Objectives

Possible objectives:

maintain availability

maintain identity

maintain recovery

maintain resolution

maintain continuity

maintain habitat stability

Objectives must remain function-based.

---

# Planner Restrictions

Planner may not:

approve

execute

modify habitat

change lifecycle

alter authority

alter policy

Planner remains recommendation-only.

---

# Planner Explainability

Every plan must answer:

Why?

Based on what evidence?

Based on which truths?

Which risks exist?

What rollback exists?

What policy applies?

---

# Planner and Habitat First

Planner must always prefer:

protect habitat

over

optimize habitat

Survival comes before optimization.

---

# Planner and Progressive Trust

Planner becomes active before Executor.

Planner may exist in:

NOTOUCH

PROGTRUSTASSESS

FIXANDAPPLY

Planner may generate plans before execution exists.

---

# Planner Auditability

Future planner records should contain:

plan_id

timestamp

objective

confidence

risk profile

policy profile

status

No plan may be opaque.

---

# Current Status

Current lifecycle:

OBSERVE

Planner:

Not implemented

Planner authority:

None

Planner execution capability:

None

---

# Summary

The Planner generates candidate future actions.

The Planner does not execute.

The Planner does not approve.

The Planner exists to help PHYTCOI reason about possible futures while preserving Habitat First governance.
