# PHYTCOI Organ Runtime Mapping v1

## Purpose

This document defines how biological organs are realized within the PHYTCOI Runtime Architecture.

The purpose of this document is to establish a canonical relationship between:

* biological organs
* runtime components
* services
* workers
* registries
* queues
* interfaces

This mapping connects species architecture to executable architecture.

---

# Fundamental Principle

An organ is not a process.

An organ is not a service.

An organ is not a container.

An organ is a responsibility domain.

A runtime implementation may realize an organ through multiple runtime components.

Biology defines responsibilities.

Runtime defines implementation.

---

# Core Question

This document answers:

How is each biological organ physically realized?

---

# Runtime Realization Model

Every organ may be implemented through:

* services
* workers
* registries
* queues
* interfaces

The exact implementation may evolve.

The responsibility remains constant.

---

# Root System

## Biological Purpose

The Root System connects the individual to the habitat.

It gathers observations and evidence.

It is the primary sensory system.

---

## Runtime Components

Services:

* Discovery Service

Workers:

* Discovery Worker
* Classification Worker

Registries:

* Object Registry
* Observation Registry

Queues:

* Discovery Queue

Interfaces:

* Habitat Adapters

---

# Evidence System

## Biological Purpose

Transforms observations into evidence.

Validates observation quality.

Preserves traceability.

---

## Runtime Components

Services:

* Evidence Service

Workers:

* Evidence Validation Worker

Registries:

* Evidence Registry

Queues:

* Evidence Processing Queue

---

# Hypothesis System

## Biological Purpose

Generates candidate explanations.

Manages uncertainty.

Produces knowledge proposals.

---

## Runtime Components

Services:

* Hypothesis Service

Workers:

* Hypothesis Generation Worker

Registries:

* Hypothesis Registry

Queues:

* Hypothesis Evaluation Queue

---

# DNA System

## Biological Purpose

Stores validated habitat truth.

Acts as the authoritative habitat knowledge source.

---

## Runtime Components

Services:

* DNA Service

Workers:

* DNA Validation Worker

Registries:

* DNA Registry

Queues:

* DNA Update Queue

---

# World Model System

## Biological Purpose

Produces understanding.

Creates causal interpretation.

Maintains habitat understanding.

---

## Runtime Components

Services:

* World Model Service

Workers:

* Relationship Analysis Worker
* Dependency Analysis Worker

Registries:

* World Model Registry

Queues:

* Understanding Queue

---

# Experience Cortex

## Biological Purpose

Stores operational wisdom.

Preserves lessons.

Tracks outcomes.

---

## Runtime Components

Services:

* Experience Service

Workers:

* Lesson Extraction Worker

Registries:

* Experience Registry

Queues:

* Experience Processing Queue

---

# Decision Cortex

## Biological Purpose

Produces decisions.

Evaluates options.

Selects actions.

---

## Runtime Components

Services:

* Decision Service

Workers:

* Decision Evaluation Worker

Registries:

* Decision Registry

Queues:

* Decision Queue

---

# Risk System

## Biological Purpose

Evaluates uncertainty and danger.

Protects the habitat.

---

## Runtime Components

Services:

* Risk Service

Workers:

* Risk Evaluation Worker

Registries:

* Risk Registry

Queues:

* Risk Queue

---

# Governance System

## Biological Purpose

Controls authority.

Enforces policy.

Manages approvals.

---

## Runtime Components

Services:

* Governance Service

Workers:

* Approval Worker
* Policy Evaluation Worker

Registries:

* Governance Registry

Queues:

* Approval Queue

Interfaces:

* Human Approval Interface

---

# Security System

## Biological Purpose

Protects species integrity.

Protects habitat continuity.

Enforces trust boundaries.

---

## Runtime Components

Services:

* Security Service

Workers:

* Security Validation Worker

Registries:

* Security Registry
* Trust Registry

Queues:

* Security Queue

---

# Cambium

## Biological Purpose

Generates growth.

Produces adaptation blueprints.

Transforms understanding into capability.

---

## Runtime Components

Services:

* Cambium Service

Workers:

* Opportunity Analysis Worker
* Blueprint Generation Worker

Registries:

* Growth Registry
* Blueprint Registry

Queues:

* Growth Queue

---

# Adaptation System

## Biological Purpose

Realizes growth.

Activates habitat-specific structures.

---

## Runtime Components

Services:

* Adaptation Service

Workers:

* Adaptation Deployment Worker

Registries:

* Adaptation Registry

Queues:

* Adaptation Queue

---

# Memory System

## Biological Purpose

Provides persistent continuity.

Preserves identity and state.

---

## Runtime Components

Services:

* Memory Service

Registries:

* Self Registry
* Runtime State Registry

---

# Kernel

## Biological Purpose

Maintains species law.

Controls lifecycle.

Coordinates organs.

Acts as the central governing structure.

---

## Runtime Components

Services:

* Kernel Service

Workers:

* Lifecycle Worker

Registries:

* Lifecycle Registry
* Organ Registry

Queues:

* Lifecycle Queue

---

# Communication Fabric

## Biological Purpose

Connects all organs.

Enables coordination.

Maintains organism coherence.

---

## Runtime Components

Services:

* Communication Service

Workers:

* Event Router
* Message Router

Registries:

* Communication Registry

Queues:

* Event Queue
* Request Queue
* Response Queue

---

# Interface Layer

## Biological Purpose

Allows interaction with humans and external systems.

---

## Runtime Components

Interfaces:

* CLI
* API
* Telegram Interface
* Future Web Interface

Services:

* Interface Service

---

# Runtime Mapping Rules

Every runtime component must:

* belong to exactly one organ
* have a declared responsibility
* expose traceability
* define recoverability

No orphan component is permitted.

---

# Anti-Patterns

Forbidden designs include:

---

## Service-Centric Architecture

Incorrect:

Create services first.

Find organ ownership later.

---

## Shared Undefined Ownership

Incorrect:

Multiple organs own the same component.

---

## Hidden Registries

Incorrect:

Persistent state without declared ownership.

---

## Direct Organ Coupling

Incorrect:

Organs depend on internal implementation details.

Communication must use contracts.

---

# Long-Term Principle

Species architecture is authoritative.

Runtime architecture realizes species architecture.

Implementation realizes runtime architecture.

The flow must always remain:

Species

↓

Runtime

↓

Implementation

Never the reverse.

---

# Final Rule

An organ defines responsibility.

A runtime component defines realization.

The purpose of Organ Runtime Mapping is to ensure that implementation remains faithful to biology.

PHYTCOI must always be implemented according to its architecture.

Architecture is the source of truth.

Implementation is only one possible realization.
