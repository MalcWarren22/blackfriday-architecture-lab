\# ADR-001: Use Bicep + GitHub Actions for IaC and CD



\## Context

We need a repeatable, reviewable and automated way to deploy Azure infrastructure

for a high-traffic Black Friday-style workload.



\## Decision

Use:

\- Bicep for all infrastructure definitions.

\- GitHub Actions for CI/CD pipelines targeting Azure.



\## Consequences

\- ✅ Infrastructure is version-controlled and peer-reviewed.

\- ✅ Easy to replicate across environments (staging, prod).

\- ⚠️ Requires secure management of Azure credentials or federated identity.



