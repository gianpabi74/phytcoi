# PHYTCOI Action Model v1

## Status

Approved Architecture

Version: 1

Lifecycle Scope:

Global

Planned Implementation Scope:

M53+

---

# Purpose

This document defines the Action Model of PHYTCOI.

Actions are the fundamental operational units of the Executor.

The Planner reasons about objectives.

The Executor performs actions.

Every interaction between PHYTCOI and the habitat is ultimately expressed as one or more actions.

The purpose of the Action Model is to define the structure, behavior and constraints of executable actions.

---

# Why Actions Exist

Objectives are abstract.

Plans are abstract.

Recommendations are abstract.

The habitat can only be influenced through actions.

Examples:

restart service

verify backup

collect evidence

update configuration

Actions therefore represent the smallest meaningful operational unit.

---

# Position Inside PHYTCOI

The Action Model exists within the Executor.

The relationship may be represented as:

Objective
↓
Plan
↓
Recommendation
↓
Approval
↓
Action
↓
Execution

Actions transform approved intent into operational behavior.

---

# Core Principle

An action is an executable unit of intent.

An action should:

have a purpose

have constraints

have expected outcomes

have verification criteria

Actions are operational, not cognitive.

---

# Action Ontology

An action represents a bounded interaction with reality.

An action must have:

identity

scope

constraints

verification

Actions should be self-describing.

---

# Action Identity

Every action should possess:

action_id

action_type

action_name

creation_timestamp

Identity allows traceability.

---

# Action Purpose

Every action must answer:

Why does this action exist?

Actions without purpose are invalid.

Examples:

Preserve continuity

Collect evidence

Verify capability

Recover service

Purpose provides meaning.

---

# Action Scope

Actions should define operational scope.

Examples:

identity layer

backup layer

resolution layer

hosting layer

service layer

Scope prevents ambiguity.

---

# Action Categories

Future actions may belong to categories such as:

Observation Actions

Verification Actions

Recovery Actions

Protection Actions

Optimization Actions

Maintenance Actions

Classification improves governance and auditing.

---

# Observation Actions

Purpose:

Acquire information.

Examples:

inventory collection

service inspection

state discovery

Observation actions are common in OBSERVE lifecycle.

---

# Verification Actions

Purpose:

Confirm reality.

Examples:

backup verification

service validation

dependency validation

Verification actions improve confidence.

---

# Recovery Actions

Purpose:

Restore expected conditions.

Examples:

restart service

restore backup

recover capability

Recovery actions support resilience.

---

# Protection Actions

Purpose:

Preserve habitat integrity.

Examples:

prevent unsafe execution

preserve redundancy

protect critical dependencies

Protection actions prioritize survival.

---

# Optimization Actions

Purpose:

Improve efficiency.

Examples:

resource tuning

cleanup

consolidation

Optimization remains subordinate to Habitat First.

---

# Maintenance Actions

Purpose:

Preserve long-term health.

Examples:

routine validation

scheduled cleanup

health verification

Maintenance supports stability.

---

# Action Lifecycle

Actions evolve through:

Creation
↓
Validation
↓
Approval
↓
Execution
↓
Verification
↓
Completion

Every action should have a visible lifecycle.

---

# Action State Model

Potential action states:

Created

Pending Validation

Validated

Approved

Executing

Verifying

Completed

Failed

Rolled Back

State awareness improves transparency.

---

# Action Preconditions

Every action may require preconditions.

Examples:

dependency available

service reachable

backup exists

authority granted

Preconditions reduce risk.

---

# Action Postconditions

Every action should define expected outcomes.

Examples:

service running

backup verified

configuration updated

Postconditions support verification.

---

# Action Verification

Execution alone is insufficient.

The Executor must verify:

Did the action occur?

Did the expected outcome occur?

Did unexpected effects occur?

Verification is mandatory.

---

# Action Reversibility

Actions should define reversibility.

Possible classes:

Fully Reversible

Partially Reversible

Non Reversible

Reversibility improves safety.

---

# Action Risk Profile

Every action should expose risk.

Potential fields:

risk_level

risk_confidence

dependency_impact

habitat_impact

Risk visibility supports governance.

---

# Action Authority Profile

Actions should specify required authority.

Examples:

observe

recommend

approve

execute

Authority remains governed externally.

---

# Action Trust Profile

Actions may depend on lifecycle trust state.

Examples:

OBSERVE

NOTOUCH

PROGRESSIVE_TRUST

FIXANDAPPLY

Trust awareness improves safety.

---

# Action Dependency Awareness

Actions should identify dependencies.

Examples:

required services

required capabilities

required relationships

Dependency awareness improves reliability.

---

# Action Failure Handling

Every action should define failure behavior.

Possible outcomes:

retry

rollback

escalate

defer

observe

Failure handling should be explicit.

---

# Action Memory Integration

Actions should generate memory candidates.

Examples:

successful action

failed action

rollback action

Memory preserves operational history.

---

# Action Experience Integration

Actions may generate experience candidates.

Repeated outcomes may become lessons.

Experience improves future execution quality.

---

# Action Ledger Integration

Every action should be auditable.

Potential fields:

action_id

execution_id

result

verification_result

timestamp

Ledger integration supports traceability.

---

# Action Explainability

Every action should answer:

What happened?

Why did it happen?

What was expected?

What occurred?

Explainability is mandatory.

---

# Action Auditability

Every action should be reconstructable.

Future audits should be able to determine:

who authorized

what executed

what changed

what outcome occurred

Auditability supports trust.

---

# Habitat First Integration

Actions must preserve habitat survival.

When optimization conflicts with survival:

survival wins

This rule is absolute.

---

# Governance Integration

Actions remain subordinate to governance.

Actions may not bypass:

authority

policy

approval

trust constraints

Governance remains supreme.

---

# Future Evolution

Future versions may introduce:

action confidence

action scoring

action composition

action chaining

adaptive actions

distributed actions

All evolution must remain governed.

---

# Architectural Constraints

Action Model must obey:

Habitat First

Evidence First

Truth Aware

Risk Aware

Explainable

Auditable

Governed

No Vendor Truth

No Product Truth

No Hostname Truth

Actions may not authorize.

Actions may not redefine policy.

Actions may not redefine governance.

Forbidden outcomes:

Authority Escalation

Policy Escalation

Lifecycle Modification

Unapproved Habitat Modification

---

# Current Status

Current Lifecycle:

OBSERVE

Action Model:

Not Implemented

Action Registry:

Not Implemented

Action Awareness:

Not Implemented

---

# Summary

The Action Model defines the fundamental operational unit of PHYTCOI.

Actions transform approved intent into observable interaction with the habitat.

All execution behavior ultimately emerges from actions, making the Action Model the foundation of the Executor architecture.
