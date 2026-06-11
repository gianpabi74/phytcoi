# Cognitive Audit V2 Model

## Status

Proposed

---

# Purpose

Cognitive Audit V2 replaces Cognitive Audit V1 as the canonical audit implementation for PHYTCOI.

The objective of V2 is to align audit behavior with organism reality.

Audit V1 introduced architecture drift because it maintained its own anatomical inventory and vitality rules.

Audit V2 eliminates those inconsistencies.

---

# Architectural Principle

The audit is not an authority.

The audit is not an anatomy source.

The audit is an observer.

Therefore:

Self Model defines anatomy.

Audit consumes anatomy.

---

# Canonical Anatomy Source

Audit V2 derives organ inventory exclusively from:

```text
self/state/self-model.json
```

Specifically:

```text
known_organs
```

No organ inventory may be hardcoded.

Forbidden:

```python
ORGANS = [...]
```

---

# Descriptor-Based Anatomy

Inventory generation process:

```text
Self Model
    ↓
known_organs
    ↓
Audit Inventory
```

Future organs automatically become auditable.

No audit code modification is required when new organs appear.

---

# Canonical Vitality Model

Audit V2 adopts the PHYTCOI vitality definition.

An organ is ALIVE when:

```text
descriptor_present
AND
state_present
AND
(
    records_present
    OR
    journal_present
)
```

---

# Organ States

ALIVE

Descriptor exists.

State exists.

Produces records or journals.

---

IMMATURE

Descriptor exists.

State exists.

No records.

No journals.

---

MISSING

Descriptor missing.

State missing.

---

# Assimilation Authority

Assimilation is derived from:

```text
self/state/self-model.json
```

The audit never determines assimilation independently.

---

# Flow Evaluation

Flow integrity is evaluated only across organs that exist within the discovered anatomy.

The audit must never assume a fixed organism structure.

---

# Maturity Evaluation

Maturity derives from:

* discovered organs
* assimilation
* flow integrity
* world model coherence

The audit must never downgrade maturity because of hardcoded anatomy assumptions.

---

# Integrity Evaluation

Integrity is computed from:

* structural integrity
* metabolic integrity
* assimilation integrity
* flow integrity
* coherence integrity

All values derive from discovered anatomy.

---

# Expected Outcome

For the current PHYTCOI organism, Audit V2 is expected to report:

```text
organ_count = 13

alive_count = 13

assimilated_count = 13

flow_status = COHERENT

integrity_status = HEALTHY

maturity_stage = COGNITIVE_ORGANISM
```

provided no genuine organism inconsistency exists.

---

# Architectural Principles

```text
descriptor_first

self_model_authority

audit_observes

no_hardcoded_anatomy

no_duplicate_truth_sources

audit_reconciliation
```
