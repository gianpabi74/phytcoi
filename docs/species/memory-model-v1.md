# PHYTCOI Memory Model v1

## Purpose

The Memory Model defines where knowledge lives.

Every piece of information known by a PHYTCOI individual must belong to exactly one memory domain.

Knowledge must never exist without ownership.

Knowledge must never be stored in ambiguous locations.

---

# Fundamental Rule

Before storing information, a PHYTCOI individual must answer:

* What is this information?
* Why should it be remembered?
* How long should it exist?
* Who owns it?

Only then may the information be stored.

---

# Memory Hierarchy

PHYTCOI memory is divided into distinct domains.

## Species Memory

The memory of the species.

Shared across generations.

---

## Individual Memory

The memory of a specific individual.

Unique to a single life.

---

## Runtime Memory

Temporary state.

Exists only while the individual is alive.

---

# Species Memory Domains

## Genome Memory

### Purpose

Store universal species knowledge.

### Owner

PHYTCOI Species

### Contents

* Constitution
* Mission
* Genome
* Anatomy
* Lifecycle
* Intelligence Model
* Capability Model
* Seed Contract
* Species Rules

### Persistence

Permanent.

### Inherited

Yes.

### Exported In Seed

Yes.

---

## Species Evolution Memory

### Purpose

Store validated species improvements.

### Owner

PHYTCOI Species

### Contents

* Proven patterns
* Mature architectures
* Validated improvements
* Evolution history

### Persistence

Permanent.

### Inherited

Yes.

### Exported In Seed

Yes.

---

# Individual Memory Domains

## DNA Memory

### Purpose

Store habitat-specific knowledge.

### Owner

Individual

### Contents

* Object Registry
* Capability Registry
* Relationship Registry
* Dependency Registry
* Habitat Graph
* Risk Graph

### Persistence

Long-term.

### Inherited

No.

### Exported In Seed

No.

### Rebuilt After Germination

Yes.

---

## Experience Memory

### Purpose

Store lessons learned.

### Owner

Individual

### Contents

* Successes
* Failures
* Outcomes
* Learned behaviors
* Operational history

### Persistence

Long-term.

### Inherited

Optional.

### Exported In Seed

Optional.

### Notes

Experience must never modify Genome.

---

## Operator Memory

### Purpose

Store knowledge about the administrator.

### Owner

Individual

### Contents

* Preferences
* Risk tolerance
* Approval behavior
* Operational style
* Communication style

### Persistence

Long-term.

### Inherited

Optional.

### Exported In Seed

Optional.

---

# Runtime Memory Domains

## Runtime State

### Purpose

Store temporary state.

### Owner

Individual

### Contents

* Active events
* Active tasks
* Current stage
* Temporary context
* Cached observations

### Persistence

Temporary.

### Inherited

No.

### Exported In Seed

No.

---

## Event Memory

### Purpose

Store recent events.

### Owner

Individual

### Contents

* Signals
* Notifications
* Event history
* Internal communications

### Persistence

Short-term.

### Inherited

No.

### Exported In Seed

No.

---

# Restricted Memory Domains

## Secret Vault

### Purpose

Store sensitive information.

### Owner

Individual

### Contents

* Passwords
* Tokens
* API keys
* Certificates
* Credentials

### Persistence

Long-term.

### Inherited

No.

### Exported In Seed

Never.

### Rule

Secrets must never enter Genome Memory.

---

# Historical Memory Domains

## Fossil Archive

### Purpose

Store inactive historical knowledge.

### Owner

Individual

### Contents

* Old DNA
* Old Experience
* Retired capabilities
* Previous architectures
* Deprecated adaptations

### Persistence

Permanent.

### Active Usage

No.

### Purpose

Preserve history without polluting active cognition.

---

# Memory Ownership Rules

## Rule 1

Genome Memory cannot contain habitat knowledge.

---

## Rule 2

DNA Memory cannot contain species rules.

---

## Rule 3

Experience Memory cannot modify Genome.

---

## Rule 4

Secrets can never enter Species Memory.

---

## Rule 5

Runtime Memory must never become permanent automatically.

---

## Rule 6

Every memory object must have exactly one owner.

---

# Memory Lifecycle

Information enters the organism as:

Observation

↓

Evidence

↓

Classification

↓

Decision

↓

Memory Placement

↓

Retention

↓

Archive or Deletion

---

# Memory Intelligence Responsibility

Memory Intelligence is responsible for deciding:

* where information belongs
* how long it should live
* whether it should be archived
* whether it should be forgotten

Memory Intelligence never creates knowledge.

It only governs knowledge placement and lifecycle.

---

# Final Rule

A PHYTCOI individual must always know:

* what it knows
* why it knows it
* where the knowledge is stored
* who owns the knowledge
* whether the knowledge belongs to the species or to the individual

Knowledge without ownership is considered memory corruption.
