\# ADR-002: Separate Staging and Production Environments



\## Context

Black Friday workloads are high risk; we must validate safely.



\## Decision

Use:

\- `rg-bf-staging` for integration and experimentation.

\- A separate production resource group/subscription for real traffic.



\## Consequences

\- ✅ Safer deployments with promotion model.

\- ✅ Clear blast radius boundaries.

\- ⚠️ Slightly more environments and governance to manage.



