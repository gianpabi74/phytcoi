# PHYTCOI Recommendation Model v1

## Status

Approved Architecture

Version: 1

Lifecycle Scope:

Global

Planned Implementation Scope:

M46+

---

# Purpose

This document defines the Recommendation Model of PHYTCOI.

Recommendations are the primary output of the Planner.

A recommendation is a structured communication produced by the organism after evaluating and ranking candidate plans.

Recommendations do not approve actions.

Recommendations do not execute actions.

Recommendations exist to communicate the most suitable future paths currently known to the organism.

---

# Why Recommendations Exist

The Planner generates possibilities.

The Planner evaluates possibilities.

The Planner ranks possibilities.

Without recommendations, planning remains internal.

Recommendations exist to transform internal planning into explainable outputs.

Recommendations answer:

What should be considered next?

Why?

What evidence supports it?

What risks exist?

---

# Position Inside PHYTCOI

Recommendations occur at the end of the planning cycle.

The flow becomes:

Need Detection
↓
Objective Formation
↓
Candidate Generation
↓
Evaluation
↓
Ranking
↓
Recommendation

Recommendations are the external expression of planning.

---

# Core Principle

A recommendation is guidance.

A recommendation is not authority.

A recommendation is not approval.

A recommendation is not execution.

Recommendations communicate planner preference.

They do not compel action.

---

# Recommendation Structure

Future recommendations should contain:

recommendation_id

objective_id

recommended_candidate

alternative_candidates

confidence

risk_profile

policy_profile

supporting_evidence

supporting_truths

supporting_rationale

timestamp

---

# Recommendation Sources

Recommendations may be derived from:

Evidence

Truth

Understanding

Risk

Experience

Relationships

Domain Cognition

Governance Constraints

Recommendations should never originate from unsupported assumptions.

---

# Recommendation Confidence

Every recommendation must include confidence.

Confidence should reflect:

Evidence quality

Truth support

Risk awareness

Temporal stability

Candidate quality

Confidence must remain explicit.

---

# Recommendation Rationale

Every recommendation must answer:

Why is this recommended?

The rationale should be understandable by both humans and future governance systems.

Opaque recommendations are forbidden.

---

# Recommendation Alternatives

Recommendations should not hide alternatives.

Whenever possible:

Top Candidate

Alternative Candidate A

Alternative Candidate B

should be preserved.

This reduces planner tunnel vision.

---

# Recommendation and Risk

Every recommendation must disclose:

Known risks

Known uncertainties

Known assumptions

Recommendations without risk context are incomplete.

---

# Recommendation and Truth

Recommendations should reference supporting truths.

Truth-backed recommendations are more stable.

Recommendations unsupported by truths should explicitly state that limitation.

---

# Recommendation and Policy

Recommendations should include policy awareness.

Possible policy contexts:

SAFE

CONDITIONAL

PROTECTED

CRITICAL

Policy classification improves governance review.

---

# Recommendation and Habitat First

Recommendations must always prefer:

Habitat Preservation

over

Habitat Optimization

This rule is absolute.

---

# Recommendation Explainability

Every recommendation should answer:

Why this candidate?

Why not the alternatives?

What evidence supports it?

What risks oppose it?

Which truths support it?

Explainability is mandatory.

---

# Recommendation Records

Future recommendation records may contain:

recommendation_id

objective_id

candidate_id

confidence

risk_profile

truth_references

timestamp

Recommendations should be persisted.

---

# Recommendation Awareness

Future Planner awareness may include:

Active recommendations

Expired recommendations

Rejected recommendations

Accepted recommendations

Recommendation awareness improves transparency.

---

# Recommendation Revision

Recommendations may be revised when:

New evidence appears

Truths change

Risks change

Policies change

Objectives change

Revision is expected.

---

# Recommendation Expiration

Recommendations should not remain valid indefinitely.

Expiration may occur due to:

Environmental changes

Truth revisions

Risk revisions

Policy revisions

Expired recommendations should not remain active.

---

# Recommendation Failure Modes

Potential failures include:

Tunnel vision

Risk blindness

Truth neglect

Overconfidence

Hidden assumptions

Alternative suppression

The Planner must actively resist these failures.

---

# Relationship With Governance

Recommendations inform governance.

Recommendations do not replace governance.

Governance may:

Accept

Reject

Delay

Request more evidence

Request more observation

---

# Relationship With Approval

Recommendations do not create approval.

Approval remains a separate governance process.

---

# Relationship With Execution

Recommendations do not execute.

Execution remains a separate capability.

This separation must remain permanent.

---

# Architectural Constraints

Recommendations must obey:

Habitat First

Evidence First

Truth Aware

Risk Aware

Explainable

Auditable

No Vendor Truth

No Product Truth

No Hostname Truth

Forbidden outcomes:

Execution

Approval

Authority Escalation

Lifecycle Modification

Habitat Modification

---

# Current Status

Current lifecycle:

OBSERVE

Recommendations:

Not Implemented

Recommendation Records:

Not Implemented

Recommendation Awareness:

Not Implemented

---

# Summary

Recommendations are the communicative output of the Planner.

They transform ranked plans into explainable guidance.

Recommendations remain advisory and do not grant authority, approval or execution rights.

Their purpose is to communicate the best currently known future paths while preserving Habitat First governance.
