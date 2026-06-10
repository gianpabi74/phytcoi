# PHYTCOI Plan Evaluation Model v1

## Status

Approved Architecture

Version: 1

Lifecycle Scope:

Global

Planned Implementation Scope:

M44+

---

# Purpose

This document defines how PHYTCOI evaluates plan candidates.

Plan Evaluation is the process through which the Planner determines the relative quality, safety, usefulness and suitability of candidate plans.

Evaluation occurs after candidate generation and before recommendation.

Evaluation does not approve plans.

Evaluation does not execute plans.

Evaluation exists to determine which candidate appears most appropriate according to organism objectives, governance constraints and habitat safety requirements.

---

# Why Evaluation Exists

Generating plans is insufficient.

Multiple plans may exist for the same objective.

Example:

Objective:

```text
Maintain identity continuity
```

Possible candidates:

```text
Candidate A

Candidate B

Candidate C
```

The Planner must determine:

```text
Which candidate appears most appropriate?
```

Evaluation exists to answer that question.

---

# Position Inside PHYTCOI

Evaluation occurs within the planning lifecycle.

The flow becomes:

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

Evaluation precedes recommendation.

---

# Core Principle

Evaluation is comparative reasoning.

The Planner does not seek perfect plans.

The Planner seeks the most appropriate candidate currently supported by cognition.

The best available plan may still be rejected later by governance.

Evaluation is advisory.

---

# Evaluation Inputs

Plan Evaluation may consume:

```text
Plan Candidates

Objectives

Evidence

Truths

Understanding Records

Risk Records

Relationship Records

Policy Context

Lifecycle State

Experience Records
```

Evaluation should prefer validated cognition whenever available.

---

# Evaluation Dimensions

A plan should be evaluated across multiple dimensions.

No single dimension is sufficient.

Possible dimensions include:

```text
Benefit

Risk

Confidence

Complexity

Reversibility

Dependency Impact

Habitat Impact

Evidence Quality

Truth Support

Experience Alignment
```

---

# Benefit Evaluation

Benefit measures expected positive outcome.

Questions:

```text
What problem is addressed?

What objective is supported?

What value is created?
```

Higher benefit increases candidate quality.

Benefit alone is insufficient.

---

# Risk Evaluation

Risk measures potential negative consequences.

Questions:

```text
What could go wrong?

How severe could failure be?

How uncertain are outcomes?
```

Risk must always be considered.

Ignoring risk is forbidden.

---

# Confidence Evaluation

Confidence measures Planner certainty.

Confidence may be influenced by:

```text
Evidence quality

Truth support

Temporal stability

Relationship consistency

Historical observations
```

Confidence is never certainty.

---

# Complexity Evaluation

Complexity measures how difficult a plan may be.

Potential indicators:

```text
Number of dependencies

Number of assumptions

Scope size

Verification difficulty
```

Lower complexity is generally preferred.

---

# Reversibility Evaluation

Reversibility measures rollback capability.

Questions:

```text
Can the previous state be restored?

Can unintended effects be undone?
```

Higher reversibility increases candidate desirability.

---

# Dependency Impact Evaluation

Plans may affect dependencies.

Questions:

```text
How many dependent domains exist?

How many capabilities rely on affected functions?

How much uncertainty exists?
```

Broad dependency impact increases caution.

---

# Habitat Impact Evaluation

Habitat impact is a primary evaluation dimension.

Questions:

```text
Could habitat stability be reduced?

Could resilience decrease?

Could survivability be affected?
```

Habitat impact dominates optimization concerns.

---

# Evidence Quality Evaluation

Evidence quality measures observational support.

Possible indicators:

```text
Observation count

Observation diversity

Temporal stability

Independent confirmation
```

Weak evidence should reduce candidate quality.

---

# Truth Support Evaluation

Plans should be anchored to truths whenever possible.

Questions:

```text
Which truths support this plan?

How stable are those truths?

Have those truths been revised recently?
```

Truth-supported plans should generally rank higher.

---

# Experience Alignment Evaluation

Future implementations may evaluate:

```text
Past successes

Past failures

Observed outcomes

Repeated patterns
```

Experience provides historical context.

---

# Evaluation Scores

Future implementations may derive scores.

Potential score families:

```text
Benefit Score

Risk Score

Confidence Score

Reversibility Score

Habitat Score
```

Scores are decision aids.

Scores are not decisions.

---

# Habitat First Evaluation Rule

When two candidates conflict:

Candidate A

```text
Higher optimization
```

Candidate B

```text
Higher habitat safety
```

The Planner must prefer Candidate B.

This rule is absolute.

---

# Evaluation Explainability

Every evaluation should answer:

```text
Why was this candidate ranked higher?

Which risks were considered?

Which truths supported it?

Which constraints influenced it?
```

Unexplainable evaluation is invalid.

---

# Evaluation Records

Future evaluation records may contain:

```text
evaluation_id

plan_id

objective_id

scores

supporting_truths

supporting_risks

timestamp
```

Evaluation records should be persisted.

---

# Evaluation Revision

Evaluations may change.

Triggers include:

```text
New evidence

New truths

Risk revision

Objective revision

Policy revision
```

Evaluation is not permanent.

---

# Evaluation Failure Modes

Potential failures include:

```text
Risk blindness

Optimization obsession

Dependency blindness

Truth neglect

Evidence neglect

Overconfidence

Score fixation
```

The Planner must actively resist these failures.

---

# Relationship With Candidate Ranking

Evaluation produces information.

Ranking consumes evaluation.

Evaluation and ranking are distinct processes.

---

# Relationship With Governance

Evaluation does not approve.

Evaluation does not authorize.

Evaluation remains subordinate to governance.

---

# Relationship With Execution

Evaluation never performs execution.

Evaluation only informs future recommendations.

---

# Architectural Constraints

Plan Evaluation must obey:

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

Plan Evaluation:

```text
Not Implemented
```

Evaluation Records:

```text
Not Implemented
```

Evaluation Awareness:

```text
Not Implemented
```

---

# Summary

Plan Evaluation is the process through which PHYTCOI compares candidate plans.

Evaluation measures benefit, risk, confidence, complexity, reversibility and habitat impact.

The purpose of evaluation is not to choose actions but to improve recommendations.

Evaluation therefore acts as the cognitive filter between plan generation and plan recommendation while remaining fully constrained by Habitat First governance.
