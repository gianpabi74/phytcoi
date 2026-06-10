# PHYTCOI Plan Candidate Model v1

## Status

Approved Architecture

Version: 1

Planned Implementation Scope:

M41+

---

# Purpose

This document defines the structure of a Plan Candidate inside PHYTCOI.

A Plan Candidate is the fundamental planning artifact produced by the Planner.

A Plan Candidate is not an action.

A Plan Candidate is not an approval.

A Plan Candidate is not execution.

A Plan Candidate is a structured proposal describing a possible future intervention.

---

# Core Principle

Plans are hypotheses about the future.

Plans do not modify reality.

Plans exist to support decision making.

Every plan must remain:

explainable

auditable

reversible

evidence-based

---

# Plan Lifecycle

A plan may move through the following states:

DRAFT

CANDIDATE

UNDER_REVIEW

APPROVED

DENIED

EXPIRED

EXECUTED

ROLLED_BACK

A plan may move backwards.

A plan may terminate at any stage.

---

# Plan Candidate Structure

Every plan candidate should contain:

plan_id

objective

scope

reason

supporting_evidence

supporting_truths

supporting_risks

confidence

policy_classification

rollback_strategy

expected_outcome

creation_timestamp

status

---

# Objective

The objective defines what the plan is attempting to achieve.

Examples:

maintain availability

maintain continuity

maintain identity

maintain recovery

maintain observability

maintain habitat stability

Objectives must be function-oriented.

---

# Scope

The scope defines what domains, capabilities or habitat objects may be affected.

Scope must remain explicit.

Undefined scope is forbidden.

---

# Reason

Every plan must answer:

Why does this plan exist?

The reason must reference evidence, truths or risks.

Assumptions are not sufficient.

---

# Supporting Evidence

A plan must reference supporting evidence.

Examples:

observations

state records

temporal stability records

relationship records

truth records

Evidence provides justification.

---

# Supporting Truths

A plan should reference validated truths whenever available.

Truths increase plan reliability.

Plans unsupported by truths should be marked accordingly.

---

# Supporting Risks

A plan must identify known risks.

Risk awareness is mandatory.

Unknown risks should be explicitly acknowledged.

---

# Confidence

Every plan must include confidence.

Confidence should be derived from:

evidence quality

truth quality

risk quality

temporal stability

relationship consistency

Confidence is not certainty.

---

# Policy Classification

Every plan must include policy context.

Possible classifications:

SAFE

CONDITIONAL

PROTECTED

CRITICAL

Policy classification is informational.

It does not grant execution authority.

---

# Rollback Strategy

Every plan should contain a rollback strategy whenever possible.

Rollback should answer:

How can the habitat return to the previous state?

Rollback increases habitat resilience.

---

# Expected Outcome

Every plan must describe:

expected benefit

expected impact

expected side effects

expected verification criteria

Success must be measurable.

---

# Plan Expiration

Plans should not remain valid forever.

Future implementations may define:

expiration timestamps

staleness thresholds

revalidation requirements

Expired plans should not be executed.

---

# Plan Review

Plans may be reviewed by:

humans

future governance systems

future approval systems

Review is separate from planning.

---

# Relationship With Authority

Plans possess no authority.

A plan may exist without any execution capability.

Authority remains external to planning.

---

# Relationship With Approval

Plans do not imply approval.

Approval remains a separate governance process.

---

# Relationship With Execution

Execution consumes approved plans.

Planning never performs execution.

---

# Habitat First Rule

Planner must always prefer:

habitat preservation

over

habitat optimization

This rule is absolute.

---

# Architectural Constraints

Plan candidates must obey:

habitat_first

evidence_first

truth_aware

risk_aware

fully_auditable

rollback_preferred

Forbidden outcomes:

hidden_scope

unbounded_execution

implicit_approval

implicit_authority

unsafe_autonomy

---

# Current Status

Current lifecycle:

OBSERVE

Planner:

Not implemented

Plan candidates:

Not implemented

Execution dependency:

Not active

---

# Summary

Plan Candidates are structured future-action proposals produced by the Planner.

They exist to support governance and future execution systems.

Plans do not authorize action.

Plans remain evidence-based, explainable and constrained by Habitat First principles.
