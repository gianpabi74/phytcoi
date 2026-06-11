# PHYTCOI Planner Governance Interface Model v1

## Status

Approved Architecture

Version: 1

Lifecycle Scope:

Global

Planned Implementation Scope:

M51+

---

# Purpose

This document defines the interface between the Planner and Governance inside PHYTCOI.

The Planner generates possible futures.

Governance determines which futures are acceptable.

The Planner and Governance must remain separate.

The Planner proposes.

Governance constrains.

Governance authorizes.

Governance protects.

The purpose of this interface is to ensure planning remains creative while governance remains protective.

---

# Why This Interface Exists

Without Governance:

the Planner may become unsafe.

Without Planning:

Governance has nothing to evaluate.

Both systems are required.

The interface exists to enable cooperation without merging responsibilities.

---

# Core Principle

Planner:

"What could be done?"

Governance:

"What may be done?"

This distinction is fundamental.

It must remain permanent.

---

# Position Inside PHYTCOI

The relationship may be represented as:

Observation
↓
Understanding
↓
Planning
↓
Governance
↓
Approval
↓
Execution

Planning always precedes Governance.

Governance always precedes Approval.

Approval always precedes Execution.

---

# Planner Responsibilities

The Planner is responsible for:

objective formation

candidate generation

evaluation

ranking

recommendation

planning awareness

planning memory

planning experience

The Planner is not responsible for authorization.

---

# Governance Responsibilities

Governance is responsible for:

authority interpretation

policy interpretation

trust interpretation

constraint enforcement

approval determination

risk containment

Governance is not responsible for generating plans.

---

# Interface Objectives

The interface exists to:

transfer recommendations

transfer rationale

transfer confidence

transfer risk information

transfer supporting truths

transfer supporting evidence

Governance should receive sufficient context to evaluate recommendations.

---

# Planner Output Contract

Future Planner outputs should contain:

objective_id

candidate_id

recommendation_id

confidence

risk_profile

truth_references

evidence_references

rationale

timestamp

The output must be explainable.

---

# Governance Input Contract

Governance may consume:

recommendations

candidate plans

risk assessments

truth records

authority policies

trust state

Governance consumes planning outputs.

---

# Recommendation Submission

Recommendations should be submitted through a structured interface.

Potential lifecycle:

Recommendation Created
↓
Recommendation Submitted
↓
Governance Review
↓
Governance Decision

The submission process should remain auditable.

---

# Governance Responses

Governance may return:

Accepted

Rejected

Deferred

Observation Required

Evidence Required

Truth Validation Required

These responses guide future planning behavior.

---

# Accepted Recommendations

Accepted recommendations indicate:

current governance alignment

acceptable risk

acceptable authority scope

Acceptance is not execution.

Acceptance only permits progression.

---

# Rejected Recommendations

Rejected recommendations indicate:

policy conflict

authority conflict

risk conflict

constraint conflict

The Planner should learn from rejection history.

---

# Deferred Recommendations

Governance may postpone decisions.

Reasons may include:

insufficient information

uncertain risk

insufficient trust

Deferred recommendations remain unresolved.

---

# Observation Required Responses

Governance may request additional observation.

Examples:

insufficient evidence

insufficient confidence

unknown dependencies

The Planner should gather more information before resubmission.

---

# Evidence Required Responses

Governance may require stronger evidence.

Examples:

single-source observations

low-confidence observations

weak support

Evidence requirements improve safety.

---

# Truth Validation Required Responses

Governance may require truth verification.

Examples:

unvalidated assumptions

uncertain causal relationships

uncertain dependencies

Truth validation improves reliability.

---

# Risk Communication

The Planner must communicate risk.

Risk communication should include:

known risks

known uncertainties

known assumptions

risk confidence

Governance depends on accurate risk information.

---

# Confidence Communication

The Planner must communicate confidence.

Confidence should remain explicit.

Hidden confidence is forbidden.

Governance requires visibility into uncertainty.

---

# Rationale Communication

Every recommendation should include rationale.

Questions that should be answerable:

Why was this candidate selected?

Why were alternatives ranked lower?

Which truths support it?

Which risks oppose it?

Governance relies on rationale quality.

---

# Truth Communication

Truth references should accompany recommendations whenever possible.

Truth-backed recommendations improve governance confidence.

Truth references improve explainability.

---

# Evidence Communication

Recommendations should include evidence references.

Evidence allows governance verification.

Evidence improves transparency.

---

# Governance Feedback Loop

The interface should support feedback.

Planner
↓
Governance
↓
Feedback
↓
Planner Learning

Feedback supports planning improvement.

---

# Governance History Integration

The Planner may later use governance outcomes as learning material.

Examples:

accepted recommendations

rejected recommendations

deferred recommendations

Governance history improves planning maturity.

---

# Trust Integration

Governance may evaluate recommendations differently depending on trust state.

Examples:

OBSERVE

NOTOUCH

PROGRESSIVE_TRUST

FIXANDAPPLY

Trust remains a governance concern.

---

# Authority Integration

Authority remains outside the Planner.

The Planner may be aware of authority.

The Planner may not define authority.

Governance owns authority interpretation.

---

# Policy Integration

The Planner may be aware of policy.

The Planner may not redefine policy.

Governance owns policy interpretation.

---

# Habitat First Integration

Governance remains the guardian of Habitat First.

The Planner may propose optimization.

Governance must reject optimization that threatens habitat survival.

Habitat preservation remains absolute.

---

# Explainability

The interface must remain explainable.

Questions should be answerable:

Why was this recommendation accepted?

Why was it rejected?

What policy influenced the decision?

What risks influenced the decision?

Explainability is mandatory.

---

# Auditability

Every interaction should be auditable.

Potential records:

submission_id

recommendation_id

governance_response

timestamp

supporting_rationale

Auditability supports trust.

---

# Failure Modes

Potential failures include:

authority bypass

policy bypass

hidden risk

hidden uncertainty

poor rationale

poor evidence

poor truth support

The interface must actively resist these failures.

---

# Future Evolution

Future versions may introduce:

governance scoring

trust-adaptive review

automated governance review

governance awareness

cross-organ governance interfaces

All evolution should preserve separation of responsibilities.

---

# Architectural Constraints

Planner-Governance Interface must obey:

Habitat First

Evidence First

Truth Aware

Risk Aware

Explainable

Auditable

No Vendor Truth

No Product Truth

No Hostname Truth

Planner cannot authorize.

Governance cannot plan.

Separation is mandatory.

Forbidden outcomes:

Execution

Authority Escalation

Lifecycle Modification

Habitat Modification

---

# Current Status

Current Lifecycle:

OBSERVE

Planner-Governance Interface:

Not Implemented

Governance Feedback Loop:

Not Implemented

Planning Submission Pipeline:

Not Implemented

---

# Summary

The Planner-Governance Interface defines how planning outputs are transferred into governance review.

The Planner proposes possible futures.

Governance determines whether those futures are acceptable.

The separation between planning and governance is fundamental and must remain permanent to preserve safety, explainability and Habitat First principles.
