# PHYTCOI Approval Model v1

## Status

Approved Architecture

Version: 1

Lifecycle Scope:

Global

Planned Implementation Scope:

M36+

---

# Purpose

This document defines how approval operates within PHYTCOI.

Approval is the bridge between governance and execution.

Approval does not create authority.

Approval does not create trust.

Approval authorizes a specific action under defined conditions.

---

# Core Principle

Approval answers:

Who permits this action?

Approval does not answer:

Can it be executed safely?

Safety remains governed by:

- Policy
- Authority
- Progressive Trust
- Habitat First

---

# Approval Hierarchy

PHYTCOI recognizes multiple approval sources.

Possible approval origins:

Human Approval

Governance Approval

Policy Approval

Future Autonomous Approval

Approval origin must always be recorded.

---

# Human Approval

Human approval is the highest approval authority.

Humans may:

approve

deny

revoke

delay

override

Human approval must remain available at all lifecycle stages.

---

# Governance Approval

Governance approval may exist in future stages.

Governance approval evaluates:

policy compliance

risk profile

authority requirements

trust requirements

Governance approval remains constrained by Habitat First.

---

# Approval Candidate

An approval candidate contains:

requested action

supporting evidence

supporting truths

risk profile

policy classification

required authority

approval source

confidence

timestamp

---

# Approval Outcomes

Possible outcomes:

APPROVED

DENIED

DEFERRED

REQUIRES_MORE_EVIDENCE

REQUIRES_REVIEW

Approval outcomes must be explicit.

---

# Approval Expiration

Approvals must not be permanent.

Future approval records may contain:

approval timestamp

expiration timestamp

approval rationale

scope

Expired approvals become invalid.

---

# Approval Scope

Approvals must be narrowly scoped.

Correct:

Restart service X once.

Incorrect:

Modify infrastructure indefinitely.

Approvals should minimize authority exposure.

---

# Approval Revocation

Approvals may be revoked.

Revocation may occur when:

new evidence appears

risk increases

policy changes

trust decreases

Revocation must be recorded.

---

# Relationship With Authority

Approval cannot exceed authority.

Example:

Approval granted

but

Authority unavailable

Result:

Execution denied

Authority remains the controlling boundary.

---

# Relationship With Policy

Approval cannot bypass policy.

Example:

Human approval exists

but

Policy blocks execution

Result:

Execution denied

Policy remains active.

---

# Relationship With Habitat First

Habitat First overrides approval.

Even approved actions may be blocked when habitat survival is threatened.

This rule is absolute.

---

# Approval Auditability

Every approval must be explainable.

Future approval records should contain:

approval id

approver

timestamp

scope

supporting rationale

supporting evidence

outcome

No approval may be opaque.

---

# Architectural Constraints

Approval must obey:

habitat_first

policy_first

authority_first

trust_aware

fully_auditable

Forbidden outcomes:

approval_bypass

hidden_approval

unbounded_approval

permanent_approval

unsafe_execution

---

# Current Status

Current lifecycle:

OBSERVE

Approval capability:

Human only

Execution capability:

Not active

---

# Summary

The Approval Model defines how actions become authorized.

Approval does not replace policy, authority or trust.

Approval exists to provide explicit authorization while preserving safety, auditability and Habitat First governance.
