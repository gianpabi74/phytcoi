# PHYTCOI Runtime Architecture v1

## Purpose

The Runtime Architecture defines how the PHYTCOI species architecture is physically realized as a running system.

The Species Architecture defines what PHYTCOI is.

The Runtime Architecture defines how a PHYTCOI individual exists in execution.

This document is the bridge between biological architecture and engineering implementation.

---

# Fundamental Principle

An Organ is not a process.

An Organ is not a container.

An Organ is not a service.

An Organ is a biological responsibility domain.

A runtime implementation may realize an Organ through:

* one process
* multiple processes
* one service
* multiple services
* one registry
* multiple registries
* one database
* multiple storage objects
* one worker
* multiple workers

Runtime must follow biology.

Biology must not be distorted to fit runtime convenience.

---

# Core Question

The Runtime Architecture answers:

How does a PHYTCOI individual physically exist?

---

# Runtime Objectives

The runtime must provide:

* identity
* persistence
* coordination
* observability
* recoverability
* governance
* controlled execution
* safe growth
* seed portability

The runtime exists to make species architecture executable.

---

# Runtime Scope

This document defines:

* runtime layers
* runtime components
* runtime boundaries
* runtime storage domains
* runtime communication
* runtime governance
* runtime lifecycle

This document does not define implementation code.

This document does not define vendor-specific deployment.

---

# Runtime Layers

The runtime is organized into layers.

---

## Layer 1 — Host Environment

The Host Environment is the operating environment where the individual runs.

Examples:

* virtual machine
* container
* physical host
* future runtime substrate

The Host Environment is the physical body of the individual.

---

## Layer 2 — Runtime Foundation

The Runtime Foundation provides the minimum execution environment.

Responsibilities:

* process management
* filesystem layout
* local permissions
* runtime directories
* service supervision
* basic logging

This layer supports life but does not define intelligence.

---

## Layer 3 — Kernel Runtime

The Kernel Runtime instantiates the Kernel Blueprint.

Responsibilities:

* identity loading
* mission loading
* lifecycle loading
* stage control
* trust control
* policy control
* boundary control
* event loop activation

Without Kernel Runtime, the individual is not alive.

---

## Layer 4 — Organ Runtime

The Organ Runtime hosts biological systems.

Examples:

* Root System
* DNA System
* Brain System
* Cambium
* Metabolism
* Immune System
* Regeneration System
* Canopy

An Organ Runtime may contain multiple services or workers.

---

## Layer 5 — Registry Runtime

The Registry Runtime stores authoritative structured state.

Examples:

* Self Registry
* Organ Registry
* Capability Registry
* Evidence Registry
* Hypothesis Registry
* DNA Registry
* Adaptation Registry
* Experience Registry

Registries provide persistent identity and memory.

---

## Layer 6 — Communication Runtime

The Communication Runtime coordinates organ communication.

Responsibilities:

* events
* requests
* responses
* signals
* broadcasts
* contract validation

Communication preserves organism coherence.

---

## Layer 7 — Governance Runtime

The Governance Runtime enforces safety.

Responsibilities:

* policy evaluation
* trust evaluation
* risk evaluation
* approval routing
* security validation
* execution authorization

No action may bypass Governance Runtime.

---

## Layer 8 — Execution Runtime

The Execution Runtime performs approved operations.

Responsibilities:

* action dispatch
* adapter invocation
* rollback execution
* outcome capture
* verification

Execution receives approved intent.

Execution does not decide.

---

## Layer 9 — Interface Runtime

The Interface Runtime exposes interaction surfaces.

Examples:

* CLI
* API
* human interface
* notification interface
* future web interface

Interfaces communicate with humans and systems.

They do not own cognition.

---

# Runtime Component Types

The runtime may contain several component types.

---

## Services

Long-running processes.

Examples:

* kernel service
* communication service
* governance service
* interface service

---

## Workers

Task-specific executors.

Examples:

* discovery worker
* validation worker
* adaptation worker
* verification worker

---

## Registries

Persistent structured storage.

Examples:

* DNA Registry
* Evidence Registry
* Experience Registry

---

## Queues

Communication buffers.

Examples:

* event queue
* request queue
* execution queue

---

## Interfaces

Human or machine interaction points.

Examples:

* command line interface
* HTTP API
* notification channel

---

## Adapters

Habitat-specific connectors.

Adapters are generated or activated after germination.

Adapters belong to germ_*.

---

# Runtime Storage Domains

Runtime storage must follow the Memory Model.

---

## Genome Storage

Contains species inheritance.

Read-only during normal operation.

---

## Self Storage

Contains individual state.

Examples:

* identity
* current stage
* active organs
* active capabilities

---

## DNA Storage

Contains validated habitat truth.

Must remain evidence-backed.

---

## Hypothesis Storage

Contains unvalidated candidate knowledge.

Must remain separate from DNA.

---

## World Model Storage

Contains habitat understanding.

Derived from DNA and Experience.

---

## Experience Storage

Contains operational wisdom.

Append-oriented.

---

## Adaptation Storage

Contains germ_* structures and growth blueprints.

Governed by Cambium and Security.

---

## Runtime State Storage

Contains temporary state.

Must not be confused with persistent memory.

---

## Secret Storage

Contains sensitive credentials.

Must remain isolated.

Never exported in Seeds.

---

# Runtime Identity

Every runtime instance must know:

* species identifier
* individual identifier
* nest identifier
* generation identifier
* current lifecycle stage

Runtime identity is mandatory.

A runtime without identity is invalid.

---

# Runtime Lifecycle

Runtime lifecycle follows:

Install

↓

Initialize

↓

Kernel Birth

↓

Observe

↓

Build Knowledge

↓

Build Understanding

↓

Enable Growth

↓

Enable Governance

↓

Operate

↓

Shutdown or Reproduce

Each phase must be observable.

---

# Runtime Startup Sequence

A valid startup sequence is:

1. Load Genome Storage
2. Load Mission
3. Load Constitution
4. Initialize Kernel Runtime
5. Load Self Storage
6. Start Communication Runtime
7. Register Organs
8. Load Capabilities
9. Start Observation Systems
10. Enter Lifecycle Stage

No startup step may bypass Kernel Runtime.

---

# Runtime Shutdown Sequence

A valid shutdown sequence is:

1. Stop accepting new actions
2. Flush communication queues
3. Persist runtime state
4. Persist memory updates
5. Stop workers
6. Stop services
7. Verify clean shutdown

Shutdown must preserve recoverability.

---

# Runtime Communication

All runtime communication must follow the Organ Communication Model.

Communication must be:

* structured
* traceable
* recoverable
* secure

Hidden communication paths are prohibited.

---

# Runtime Governance

Runtime governance enforces:

* Constitution
* Mission
* Lifecycle
* Security
* Trust
* Risk
* Policy

The Governance Runtime must exist before Execution Runtime may operate.

---

# Runtime Execution

Execution is always downstream of decision.

Execution may not create intent.

Execution may not authorize itself.

Execution may only perform approved operations.

---

# Runtime Growth

Runtime growth is governed by Cambium.

Growth may produce:

* adaptation blueprints
* germ_* adapters
* capability bindings
* observation extensions

Growth must pass security validation.

---

# Runtime Recoverability

Every runtime component must define:

* failure detection
* recovery strategy
* rollback strategy
* persistence requirements

A component without recoverability is incomplete.

---

# Runtime Portability

Runtime must remain portable.

The first implementation may run on a Linux virtual machine.

Future implementations may run elsewhere.

Runtime architecture must not assume a specific vendor.

---

# Runtime Minimal Viable Individual

The minimum viable runtime must include:

* Genome Storage
* Kernel Runtime
* Self Storage
* Communication Runtime
* Basic Observation Runtime
* Memory Runtime

Without these, no individual exists.

---

# Runtime Anti-Patterns

The following are prohibited.

---

## Organ Equals Container

Incorrect.

Organs are biological responsibility domains.

---

## Service Sprawl

Creating services without anatomical ownership is prohibited.

---

## Hidden State

State without declared memory domain is prohibited.

---

## Direct Execution

Execution without governance is prohibited.

---

## Vendor-Locked Runtime

Runtime must not depend on a specific habitat vendor.

---

# Runtime Success Criteria

The runtime is successful when it can:

* instantiate identity
* load species inheritance
* enter OBSERVE stage
* collect evidence
* persist memory
* communicate internally
* recover from controlled failure
* remain portable

---

# Final Rule

The Runtime Architecture exists to make PHYTCOI executable without corrupting PHYTCOI biology.

Implementation must serve the species.

The species must not be distorted to serve implementation.
