# PHYTCOI Capability Model v1

## Purpose

The Capability Model defines what a PHYTCOI individual can do.

An Intelligence thinks.

An Organ hosts.

A Capability enables.

An Action executes.

Capabilities are the bridge between cognition and operation.

---

# Fundamental Rule

A Capability is not a driver.

A Capability is not a tool.

A Capability is not a vendor integration.

A Capability is a universal ability that may be implemented differently in each habitat.

Local implementations belong to germ_* adaptations.

---

# Capability Ownership

Capabilities may originate from:

* Genome
* DNA
* germ_* adaptations

Genome capabilities are universal.

DNA capabilities are habitat-specific.

germ_* capabilities are generated after germination.

---

# Capability Lifecycle

Every Capability follows a lifecycle:

1. Defined
2. Discovered
3. Evaluated
4. Trusted
5. Enabled
6. Used
7. Verified
8. Learned
9. Improved
10. Retired

No Capability may be used before trust evaluation.

---

# Capability Classes

## Observation Capabilities

Purpose:

Observe reality without changing it.

Examples:

* Discover Objects
* Collect Evidence
* Read State
* Inspect Relationships
* Monitor Health
* Detect Services
* Observe Resource Usage

Allowed stages:

* OBSERVE
* NOTOUCH
* TRUST_ASSIST
* FIX_AND_APPLY

---

## Knowledge Capabilities

Purpose:

Transform observations into structured knowledge.

Examples:

* Classify Objects
* Build Habitat Graph
* Build DNA
* Store Evidence
* Store Experience
* Learn Patterns
* Detect Dependencies

Allowed stages:

* OBSERVE
* NOTOUCH
* TRUST_ASSIST
* FIX_AND_APPLY

---

## Governance Capabilities

Purpose:

Generate understanding, recommendations and control logic.

Examples:

* Generate Plans
* Assess Risk
* Evaluate Trust
* Evaluate Policy
* Generate Recommendations
* Simulate Outcomes
* Detect Critical Paths

Allowed stages:

* NOTOUCH
* TRUST_ASSIST
* FIX_AND_APPLY

---

## Execution Capabilities

Purpose:

Change the external world.

Examples:

* Execute Action
* Modify Object
* Repair Object
* Restart Service
* Move Resource
* Apply Configuration
* Rollback Change
* Restore State

Allowed stages:

* TRUST_ASSIST
* FIX_AND_APPLY

Execution Capabilities must always pass:

* Trust Evaluation
* Policy Evaluation
* Survival Evaluation
* Boundary Evaluation
* Rollback Evaluation

---

## Regeneration Capabilities

Purpose:

Recover from damage.

Examples:

* Restore Backup
* Rollback Action
* Rebuild Capability
* Repair DNA
* Recover Service
* Recreate State

Allowed stages:

* TRUST_ASSIST
* FIX_AND_APPLY

Emergency use may require special policy.

---

## Metabolic Capabilities

Purpose:

Manage resources and waste.

Examples:

* Measure Resource Pressure
* Detect Waste
* Reclaim Space
* Adjust Resource Allocation
* Preserve Resource Margin
* Detect Resource Cannibalization

Allowed stages:

* NOTOUCH
* TRUST_ASSIST
* FIX_AND_APPLY

---

## Communication Capabilities

Purpose:

Interact with humans, organs or other systems.

Examples:

* Send Notification
* Request Approval
* Receive Command
* Publish Event
* Explain Decision
* Generate Report

Allowed stages:

* OBSERVE
* NOTOUCH
* TRUST_ASSIST
* FIX_AND_APPLY

---

## Reproductive Capabilities

Purpose:

Preserve species continuity.

Examples:

* Build Seed
* Export Genome
* Export Species Memory
* Validate Seed
* Plant Seed
* Verify Rebirth

Allowed stages:

* FIX_AND_APPLY

Experimental use may be allowed in controlled SeedLab environments.

---

## Social Capabilities

Purpose:

Enable cooperation between individuals.

Examples:

* Share Knowledge
* Share Experience
* Request Consensus
* Delegate Task
* Receive Delegation
* Synchronize Species Memory

Allowed stages:

* Future Capability

Not required for PHYT-001.

---

# Capability Trust

Each Capability must have a trust level.

## Trust Levels

### Unknown

The Capability exists but has not been validated.

### Observed

The Capability has been detected.

### Simulated

The Capability has been tested without real execution.

### Assisted

The Capability can operate with human approval.

### Trusted

The Capability can operate autonomously within policy boundaries.

### Deprecated

The Capability is no longer active.

### Forbidden

The Capability must never be used.

---

# Capability Risk

Each Capability must define its risk profile.

Risk factors:

* Reversibility
* Blast Radius
* Substrate Impact
* Nest Impact
* Habitat Impact
* Data Loss Potential
* Human Impact
* Recovery Availability
* Historical Reliability

High-risk capabilities require explicit policy control.

---

# Capability Binding

A Capability becomes usable only when bound to an implementation.

## Universal Capability

Example:

Name Resolution Governance

## Habitat Implementation

Example:

germ_name_resolution_driver

## Local Vendor Adapter

Example:

germ_pihole_adapter

The Genome defines the universal capability.

The habitat generates the germ_* implementation.

---

# Capability Execution Rule

No Capability may execute an Action unless all evaluations pass:

1. Boundary Evaluation
2. Trust Evaluation
3. Policy Evaluation
4. Survival Evaluation
5. Rollback Evaluation

If any evaluation fails, execution is blocked.

---

# Capability Placement

Capabilities must be placed correctly.

## Species Capability

Universal.

Stored in Genome Memory.

## Habitat Capability

Discovered locally.

Stored in DNA Memory.

## Generated Capability

Produced after germination.

Stored as germ_*.

## Temporary Capability

Used only during runtime.

Stored in Runtime Memory.

---

# Capability Failure

If a Capability fails, the individual must record:

* What failed
* When it failed
* Why it failed if known
* What was affected
* Whether rollback was possible
* Whether trust must be reduced
* Whether the Capability must be retired

Failures belong to Experience Memory.

---

# Final Rule

A PHYTCOI individual must never confuse Capability with implementation.

The species owns capabilities.

The habitat owns implementations.

The individual binds them through evidence, trust and policy.
