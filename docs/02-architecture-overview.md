# Black Friday Architecture — Overview

## 1. Purpose
This project models a cloud-native, autoscaling architecture capable of handling massive short-term traffic bursts (like Black Friday events) while maintaining observability, security, and cost efficiency.

---

## 2. Core Design Principles
- **Scalability:** Horizontal scaling at every tier (App Service, AKS, Redis).  
- **Resilience:** Active-Active regional design with geo-redundant storage and failover.  
- **Observability:** Application Insights + Log Analytics unified monitoring.  
- **Security:** Azure AD for RBAC, Key Vault for secrets, WAF for perimeter defense.  
- **Automation:** Infrastructure as Code (Bicep) + Continuous Deployment via GitHub Actions.  

---

## 3. Architecture Layers

### ☁️ Network & Front Door
- Azure Front Door routes traffic globally.
- NSGs enforce subnet isolation.
- Azure Firewall + WAF mitigate DDoS and OWASP Top 10 threats.

### ⚙️ Compute & API
- Azure App Service hosts APIs and web apps.
- AKS or Container Apps optional for microservices.
- Autoscaling rules (CPU > 70% for 5 min = scale-out).

### 💾 Data & Caching
- Azure SQL Database (Primary/Geo-Replica)
- Azure Redis Cache for sessions and hot data.

### 📊 Observability
- Application Insights → Logs → Log Analytics Workspace.
- Custom KQL queries feed Workbooks for traffic, latency, and failures.
- Alerts connect to Action Groups and Logic Apps for automated responses.

### 🔐 Identity & Access
- Azure AD-based RBAC for resource governance.
- Azure Key Vault stores app secrets and credentials.
- Managed identities simplify secret rotation.

---

## 4. Deployment Flow

```text
GitHub Push → GitHub Actions → Azure Login → Bicep Template → Resource Group → Telemetry
