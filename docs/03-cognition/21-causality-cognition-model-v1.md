# PHYTCOI Causality Cognition Model v1

## Status

Planned Architecture

Version: 1

Lifecycle Scope:

```text
OBSERVE
```

Planned Implementation Scope:

```text
M29+
```

---

# Purpose

This document defines the future Causality Cognition layer of PHYTCOI.

Causality cognition is the layer that allows PHYTCOI to reason about possible cause and effect between habitat domains, capabilities and observed states.

Causality is not currently active.

Causality must not be confused with relationship cognition.

Relationship cognition answers:

```text
How are domains related?
```

Understanding cognition answers:

```text
What may those relationships mean?
```

Causality cognition answers:

```text
If one domain changes, what may be affected?
```

Causality is a higher-risk cognitive layer because it can influence future planning, risk evaluation and remediation.

Therefore it must be documented before implementation.

---

# Position Within Cognitive Stack

Causality follows understanding.

The cognitive progression is:

```text
Evidence
    ↓
Capability
    ↓
Domain
    ↓
Relationship
    ↓
Understanding
    ↓
Causality
```

No causal rule may exist without prior evidence, capability cognition, domain cognition, relationship cognition and understanding cognition.

---

# Definition of Causality

A causal candidate is a cautious statement that one observed condition may influence another.

Example:

```text
If identity_and_authentication degrades,
remote_access may be affected.
```

This is not a command.

This is not an action.

```
nition/21-causality-cognition-model-v1.md
```

This is not automatic truth.

It is a candidate causal interpretation.

---

# Causality Candidate

Causality must begin as candidate cognition.

A causality candidate must include:

```text
source domain
target domain
observed relationship
supporting understanding
confidence
temporal evidence
forbidden assumptions
forbidden outcomes
```

A causality candidate may not authorize decisions or execution.

---

# Difference Between Relationship and Causality

Relationship:

```text
identity_and_authentication
    supports
remote_access
```

Causality candidate:

```text
A degradation in identity_and_authentication
may reduce remote_access reliability.
```

The relationship describes structure.

The causality candidate describes possible effect.

This distinction is mandatory.

---

# Difference Between Understanding and Causality

Understanding:

```text
identity_and_authentication appears to be a foundational support domain
for remote_access and file_and_directory_services.
```

Causality:

```text
If identity_and_authentication is unavailable,
remote_access and file_and_directory_services may be impacted.
```

Understanding describes meaning.

Causality describes potential impact.

PHYTCOI must not skip from relationship directly to causality.

---

# Required Inputs

Causality cognition may depend on:

```text
validated capabilities
validated domains
domain relationship records
understanding candidates
temporal stability records
experience records
truth records
```

At minimum, a causality candidate requires:

```text
relationship evidence
understanding evidence
temporal stability evidence
```

---

# Temporal Requirement

Causality requires time.

A single observation is insufficient.

PHYTCOI must not form causal candidates from one-time observations.

Minimum requirements should include:

```text
multiple temporal observations
stable relationship signatures
repeated domain presence
consistent supporting evidence
```

The current temporal stability layer exists specifically to prevent premature causal reasoning.

---

# Forbidden Reasoning

Causality must never be derived from local identity.

Forbidden:

```text
WINSRV01 is down, therefore Active Directory is down.
```

Forbidden:

```text
This is a Windows server, therefore it causes authentication.
```

Forbidden:

```text
The host is named PVE, therefore all compute depends on it.
```

Correct:

```text
The identity_and_authentication domain shows repeated authentication and directory capability evidence.
The remote_access domain has an observed relationship supported by identity_and_authentication.
If the identity_and_authentication domain degrades, remote_access may be affected.
```

---

# Causal Confidence

Causality must have confidence.

Confidence should be derived from:

```text
relationship confidence
understanding confidence
temporal stability
supporting evidence count
cross-domain consistency
```

Causal confidence is not truth.

Even high causal confidence does not authorize execution.

---

# Causality Is Not Action

A causal candidate may inform future risk reasoning.

It may not directly trigger:

```text
planner
executor
fixandapply
habitat modification
auto-remediation
```

Causality must remain informational until governance, policy and progressive trust layers authorize its use.

---

# Relationship With Risk Cognition

Risk cognition may eventually use causality.

Example future flow:

```text
Causality Candidate
    ↓
Risk Hypothesis
    ↓
Risk Score
    ↓
Recommendation
```

This future flow must remain separate from execution.

Risk may produce recommendations.

It may not perform actions without policy approval.

---

# Relationship With Progressive Trust

Progressive Trust requires causality, but causality alone is not enough.

Before PHYTCOI can move beyond OBSERVE, it must possess:

```text
stable evidence
validated domains
validated relationships
understanding candidates
causal candidates
risk model
governance constraints
policy model
approval boundaries
rollback strategy
```

Causality is one prerequisite.

It is not authorization.

---

# Lifecycle Constraint

Causality cognition is OBSERVE-only until explicitly promoted by governance.

It may:

```text
read understanding records
read relationship records
read temporal stability records
derive causality candidates
persist causality records
persist causality awareness
```

It may not:

```text
decide
execute
authorize
modify habitat
validate operational truth automatically
activate planner
activate executor
change lifecycle
```

---

# Architectural Constraints

Causality cognition must always obey:

```text
observe_only
causality_not_action
causality_not_truth
understanding_first
relationship_first
domain_first
capability_first
evidence_first
no_vendor_truth
no_product_truth
no_hostname_truth
```

Forbidden outcomes:

```text
decision
execution
automatic_remediation
automatic_validation
habitat_modification
planner_activation
executor_activation
```

---

# Current Implementation Status

At the time of this model, PHYTCOI has implemented:

```text
Capability cognition
Domain cognition
Relationship cognition
Relationship awareness
Temporal stability observation
```

Understanding cognition is documented as the next cognitive layer.

Causality cognition is not implemented.

It must remain future work until understanding cognition exists and has stable records.

---

# Summary

Causality Cognition is the future layer that allows PHYTCOI to reason about potential effects between domains.

It must be built only after understanding cognition.

Causality must remain candidate cognition until validated by evidence, experience and governance.

It does not authorize action.

It prepares PHYTCOI for future risk reasoning, progressive trust and safe operational autonomy.
