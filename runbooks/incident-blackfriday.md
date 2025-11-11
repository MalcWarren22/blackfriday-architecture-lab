\# Incident Runbook — Black Friday Scenario



\## Triggers

\- 5xx error rate > 2% (5 min).

\- P95 latency > 1s.

\- Checkout failures spike.

\- Queue backlog or inventory delay.



\## Roles

\- Incident Commander

\- On-call App/API

\- On-call Data/Infra

\- Comms Lead



\## Procedure

1\. Detect — confirm alert from App Insights / Azure Monitor.

2\. Triage — identify impacted endpoints and dependencies.

3\. Isolate — scale out, disable heavy features, protect core checkout.

4\. Mitigate — cache-first reads, queue writes, use fallbacks.

5\. Rollback — revert recent deploy if correlated.

6\. Communicate — update internal channel; external if prod.

7\. Postmortem — timeline, root cause, actions.



