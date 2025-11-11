\# Load Test Plan — Black Friday Architecture Lab



\## Objectives

\- Emulate peak Black Friday traffic patterns.

\- Validate scaling behavior and resilience.

\- Exercise observability and runbooks.



\## Scenarios

\- Browse: high RPS to catalog/product APIs.

\- Checkout spike: 10x checkout for a short window.

\- Mixed: 80% browse, 15% cart, 5% checkout.



\## Metrics

\- P95 / P99 latency.

\- Error rate.

\- Dependency failures (DB, cache, queues).

\- Resource utilization.



\## Tools

\- Azure Load Testing.

\- Application Insights + Log Analytics queries.



\## Pass Criteria

\- Within SLOs for latency and errors.

\- No uncontrolled cascading failures.



