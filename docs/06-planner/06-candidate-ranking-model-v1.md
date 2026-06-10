# PHYTCOI Candidate Ranking Model v1

## Status

Approved Architecture

Version: 1

Lifecycle Scope:

Global

Planned Implementation Scope:

M45+

---

# Purpose

This document defines how PHYTCOI ranks plan candidates.

Ranking is the process through which the organism orders evaluated plans according to cognitive quality, governance alignment and habitat safety.

Evaluation determines:

```text
How good is a candidate?
```

Ranking determines:

```text
Which candidate should be considered first?
```

Ranking exists to transform evaluation results into ordered recommendations.

Ranking does not authorize actions.

Ranking does not approve actions.

Ranking does not execute actions.

---

# Why Ranking Exists

A Planner may generate multiple valid plans.

Example:

```text
Objective:
Maintain identity continuity
```

Possible plans:

```text
Plan A
Plan B
Plan C
Plan D
```

All may be valid.

All may be explainable.

All may be supported by evidence.

The organism still requires a method to determine:

```text
Recommended order of consideration.
```

Ranking exists to provide that order.

---

# Position Inside PHYTCOI

Ranking occurs after evaluation.

The planning flow becomes:

```text
Need Detection
    ↓
Objective Formation
    ↓
Candidate Generation
    ↓
Plan Evaluation
    ↓
Candidate Ranking
    ↓
Recommendation
```

Ranking consumes evaluations.

Ranking produces ordered candidates.

---

# Core Principle

Ranking is prioritization.

Ranking is not approval.

Ranking is not decision.

Ranking is not execution.

A highly ranked plan may still be rejected by governance.

A low ranked plan may still become useful later.

Ranking represents current preference only.

---

# Ranking Inputs

Ranking may consume:

```text
Evaluation Results

Objectives

Truth Records

Risk Records

Policy Context

Lifecycle Context

Experience Records

Habitat Constraints
```

Ranking should never depend on hostname identity.

Ranking should never depend on vendor identity.

Ranking should never depend on product identity.

---

# Ranking Dimensions

Candidate ordering may consider:

```text
Expected Benefit

Expected Risk

Confidence

Reversibility

Complexity

Dependency Impact

Habitat Impact

Evidence Strength

Truth Support

Experience Alignment
```

No single dimension should dominate universally.

---

# Benefit Preference

Higher expected benefit may improve ranking.

However:

```text
Benefit alone is insufficient.
```

A highly beneficial plan may still rank poorly if it creates excessive risk.

---

# Risk Preference

Lower risk generally improves ranking.

Risk evaluation should consider:

```text
Failure consequences

Uncertainty

Dependency propagation

Habitat exposure
```

Risk-aware ranking is mandatory.

---

# Confidence Preference

Plans supported by stronger cognition should rank higher.

Potential factors:

```text
Truth confidence

Evidence confidence

Temporal stability

Relationship stability
```

Confidence improves ranking reliability.

---

# Reversibility Preference

Plans with safer rollback strategies should generally rank higher.

Example:

```text
Candidate A
Fully reversible

Candidate B
Difficult to reverse
```

Candidate A should usually rank above Candidate B.

---

# Complexity Preference

Lower complexity is generally preferred.

Complexity indicators may include:

```text
Dependency count

Operational scope

Verification effort

Unknown variables
```

Simple plans are easier to understand and audit.

---

# Habitat Impact Preference

Habitat impact is a dominant ranking dimension.

Example:

Candidate A

```text
Higher optimization
Higher habitat impact
```

Candidate B

```text
Lower optimization
Lower habitat impact
```

The Planner should generally prefer Candidate B.

---

# Truth Preference

Plans supported by validated truths should rank higher than plans supported only by assumptions.

Truth-supported ranking improves stability.

---

# Experience Preference

Future implementations may consider:

```text
Historical success

Historical failure

Observed outcomes

Repeated effectiveness
```

Experience provides adaptive ranking behavior.

---

# Habitat First Ranking Rule

When ranking conflicts occur:

Example:

```text
Higher efficiency
```

vs

```text
Higher habitat safety
```

PHYTCOI must prefer:

```text
Higher habitat safety
```

This rule is absolute.

---

# Ranking Strategies

Future ranking approaches may include:

```text
Weighted Ranking

Rule-Based Ranking

Confidence-Aware Ranking

Risk-Aware Ranking

Hybrid Ranking
```

Implementation may evolve.

Principles must remain stable.

---

# Ranking Stability

Ranking should not fluctuate excessively.

Frequent ranking oscillation may indicate:

```text
Weak evidence

Weak truths

Insufficient stability

Insufficient observation
```

Stable cognition should produce relatively stable rankings.

---

# Ranking Revision

Ranking may change when:

```text
New evidence appears

Truths change

Risks change

Objectives change

Policies change
```

Ranking is dynamic.

---

# Ranking Explainability

Every ranking should answer:

```text
Why is Candidate A above Candidate B?

Which truths influenced ranking?

Which risks influenced ranking?

Which habitat considerations influenced ranking?
```

Unexplainable ranking is invalid.

---

# Ranking Records

Future ranking records may contain:

```text
ranking_id

objective_id

candidate_order

ranking_rationale

supporting_truths

supporting_risks

timestamp
```

Ranking records should be persisted.

---

# Ranking Awareness

Future Planner awareness may include:

```text
Top-ranked candidate

Lowest-ranked candidate

Ranking confidence

Ranking stability
```

Awareness improves transparency.

---

# Ranking Failure Modes

Potential failures include:

```text
Risk blindness

Benefit obsession

Optimization bias

Habitat neglect

Complexity neglect

Truth neglect

Experience neglect
```

The Planner must defend against these failures.

---

# Relationship With Recommendation

Ranking does not create recommendations.

Ranking orders candidates.

Recommendation selects candidates for presentation.

These are distinct processes.

---

# Relationship With Governance

Ranking does not grant authority.

Ranking does not grant approval.

Ranking remains subordinate to governance.

---

# Relationship With Execution

Ranking never performs execution.

Ranking only influences recommendation ordering.

---

# Architectural Constraints

Candidate Ranking must obey:

```text
Habitat First

Evidence First

Truth Aware

Risk Aware

Explainable

Auditable

Reversible Preference

No Vendor Truth

No Product Truth

No Hostname Truth
```

Forbidden outcomes:

```text
Execution

Approval

Authority Escalation

Lifecycle Modification

Habitat Modification
```

---

# Current Status

Current lifecycle:

```text
OBSERVE
```

Candidate Ranking:

```text
Not Implemented
```

Ranking Records:

```text
Not Implemented
```

Ranking Awareness:

```text
Not Implemented
```

---

# Summary

Candidate Ranking is the process through which PHYTCOI orders evaluated plans according to benefit, risk, confidence, reversibility and habitat safety.

Ranking transforms evaluation into prioritization.

Ranking does not authorize action.

Ranking exists to improve recommendation quality while preserving Habitat First governance and cognitive explainability.
