# PHYTCOI Authority Model v1

## Status

Approved Architecture

Version: 1

Lifecycle Scope:

Global

Planned Implementation Scope:

M33+

---

# Purpose

This document defines authority within PHYTCOI.

Authority determines what an organism component is allowed to do.

Authority is separate from cognition.

Authority is separate from trust.

Authority is separate from implementation.

Progressive Trust determines:

```text
when authority may be earned
```

Authority determines:

```text
what may be done
```

Both are required.

---

# Core Principle

Cognition does not imply authority.

Understanding something does not grant permission to act upon it.

Truth does not grant permission to act upon it.

Risk awareness does not grant permission to act upon it.

Authority must be explicitly defined.

---

# Authority Hierarchy

PHYTCOI authority is divided into layers.

```text
READ
    ↓
ANALYZE
    ↓
RECOMMEND
    ↓
APPROVE
    ↓
EXECUTE
```

Each layer includes the permissions of all lower layers.

---

# READ Authority

Purpose:

```text
Observe reality.
```

Allowed:

```text
read files

read state

read records

read evidence

read cognition
```

Forbidden:

```text
modify

decide

approve

execute
```

Examples:

```text
Observer

Discovery

Memory
```

---

# ANALYZE Authority

Purpose:

```text
Interpret reality.
```

Allowed:

```text
derive capabilities

derive domains

derive relationships

derive understanding

derive truth candidates

derive risk candidates
```

Forbidden:

```text
approve

execute
```

Examples:

```text
Knowledge

Truth

Relationship

Understanding

Risk
```

---

# RECOMMEND Authority

Purpose:

```text
Generate possible actions.
```

Allowed:

```text
propose actions

estimate impact

estimate risk

suggest remediation

generate plans
```

Forbidden:

```text
approve

execute
```

Recommendations are informational.

Recommendations are not actions.

Examples:

```text
Future Planner
```

---

# APPROVE Authority

Purpose:

```text
Authorize actions.
```

Allowed:

```text
approve plans

deny plans

authorize execution
```

Forbidden:

```text
direct habitat modification
```

Approval only grants permission.

Approval does not perform execution.

Examples:

```text
Human operator

Future governance authority
```

---

# EXECUTE Authority

Purpose:

```text
Perform authorized actions.
```

Allowed:

```text
execute approved actions

verify results

collect outcome evidence

record execution history
```

Forbidden:

```text
self-authorize

bypass approval

change authority model
```

Examples:

```text
Future Executor
```

---

# Authority Separation Principle

Authority must remain separated.

The following roles must not collapse into a single uncontrolled entity.

```text
Observer

Analyzer

Planner

Approver

Executor
```

PHYTCOI may contain all of these functions.

However:

```text
authority boundaries
must remain explicit
```

---

# Planner Authority

Planner is a recommendation organ.

Planner authority level:

```text
RECOMMEND
```

Planner may:

```text
analyze

simulate

propose
```

Planner may not:

```text
approve

execute
```

---

# Executor Authority

Executor is an execution organ.

Executor authority level:

```text
EXECUTE
```

Executor may:

```text
perform approved actions
```

Executor may not:

```text
create approval
```

Executor must always operate within approved boundaries.

---

# Human Authority

Human operators remain the highest authority.

Humans may:

```text
approve

deny

change policy

change lifecycle

override recommendations
```

PHYTCOI may never remove human authority.

---

# Habitat First Authority Constraint

Habitat safety overrides authority.

Even an authorized action may be blocked if:

```text
habitat survival risk exists
```

This rule is absolute.

---

# Authority and Progressive Trust

Progressive Trust controls authority exposure.

Example:

OBSERVE

```text
READ
ANALYZE
```

NOTOUCH

```text
READ
ANALYZE
RECOMMEND
```

PROGTRUSTASSESS

```text
limited EXECUTE
under policy constraints
```

FIXANDAPPLY

```text
full policy-controlled EXECUTE
```

Authority grows gradually.

---

# Authority Auditability

Every authority use must be explainable.

Future authority records should contain:

```text
actor

authority level

reason

evidence

timestamp

outcome
```

No authority use should be opaque.

---

# Forbidden Authority Patterns

Forbidden:

```text
analyze → execute
```

without approval.

Forbidden:

```text
recommend → execute
```

without approval.

Forbidden:

```text
self-approval
```

without governance authorization.

Forbidden:

```text
authority escalation without trust progression
```

---

# Relationship With Governance

Governance defines:

```text
authority boundaries
```

Progressive Trust defines:

```text
authority progression
```

Authority Model defines:

```text
authority meaning
```

All three layers are required.

---

# Current Status

Current PHYTCOI status:

```text
Lifecycle:
OBSERVE
```

Current effective authority:

```text
READ
ANALYZE
```

Planner:

```text
not active
```

Executor:

```text
not active
```

Approval authority:

```text
human only
```

---

# Summary

The Authority Model defines what actions are permitted inside PHYTCOI.

Authority is independent from cognition and independent from trust.

Understanding reality does not grant permission to change reality.

Authority must remain explicit, auditable and constrained by governance.

Habitat safety always takes precedence over authority.
