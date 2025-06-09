# 🧱 Generate a High-Quality Architecture Overview

You're a senior Rails engineer documenting the **architecture** of a production-grade Ruby on Rails application.

Your job is to generate a clear, professional, and structured **Architecture Overview** that will serve as a reference for new developers, technical stakeholders, and AI agents assisting with planning, debugging, or implementation. Store it in `.cursor/architecture.md` (use as resource and overwrite if exists).

You can look for context about the application in `.cursor/application_context/`

## ✳️ Purpose

- Help humans and AI quickly understand system structure, domain responsibilities, and design decisions
- Reduce onboarding time
- Improve feature planning accuracy
- Ensure consistency across modules/domains

## 📚 What to include

Your document should follow this structure:

### 1. System Overview
- One-paragraph summary of the system’s purpose and lifecycle
- Original intent and current SaaS transition
- Architecture style (e.g. modular monolith, monolith, or SOA)

### 2. Tech Stack
- Ruby version, Rails version
- Key gems/libraries (e.g. Hotwire, Sidekiq/SolidQueue, Devise, Administrate, etc.)
- External services: CRM (HubSpot), Email (Postmark), File storage (S3), Docs (Google API)
- Mention infra choices: e.g. PostgreSQL, Fly.io, CI/CD with GitHub Actions

### 3. High-Level File Structure
- Top-level folders in `app/` and their roles
- Examples of domain namespacing (e.g. `retreats/`, `budgets/`)
- Clarify where components, services, queries, forms, and policies live
- If any custom folder conventions exist, explain briefly

### 4. Core Domains / Modules
For each major domain (e.g. Retreats, Budgets, Leads, Contracts, Partners):
- **Purpose:** Business responsibility of this domain
- **Key Models:** Core database models and relationships
- **Business Logic:** Which services or concerns handle logic?
- **Patterns:** Any use of STI, polymorphism, or inheritance
- **Dependencies:** External services or interactions with other domains
- **Constraints:** Known complexity, edge cases, or refactoring notes

### 5. Key Architectural Patterns
- Service Object conventions (base class, error handling, namespacing)
- Query objects and organization
- Form objects (e.g. use of Wicked for multi-step flows)
- STI/polymorphic usage patterns (esp. in Budgeting)
- Component system (ViewComponent usage)
- Concerns or reusable modules (e.g. integration fallbacks, dynamic flags)

### 6. Data Flow & Lifecycles
Describe key lifecycle flows end-to-end:
- Example: Lead → Estimation → Proposal → Contract → Retreat → Event Planning
- Example: Integration sync with HubSpot or Google Docs
- Show how data travels through models, services, and external systems

### 7. Integrations & External Systems
List and explain:
- What each external system does (Postmark, HubSpot, Google Docs, S3, Notion, etc.)
- How data is exchanged (e.g. sync direction, APIs, webhooks)

### 8. Testing Strategy
- Framework (Minitest)
- Test folder organization
- Use of factories, VCR, test doubles
- Coverage standards if enforced
- Notable conventions (e.g. system test naming, mocks vs. stubs)

### 9. Deployment & Environments
- Hosting provider and region (e.g. Fly.io in Singapore)
- CI/CD process (branch-based deployment, release commands, migrations)
- Environment structure: development, staging, production, QA
- Process architecture (app, workers, cable, queue DB separation)

### 10. SaaS & Multi-Tenancy Strategy
- Current tenant model (e.g. Company)
- Tenant scoping strategy (row-level scoping? `current_company`?)
- Shared resources vs. tenant-scoped resources
- Planned evolution (e.g. onboarding, role management, API exposure)

### 11. Known Constraints / Technical Debt
- Legacy patterns or outdated libraries (e.g. Heroku references)
- Complex STI or service logic that needs refactor
- Testing, VCR cassette sprawl, or brittle integrations
- SaaS transition risks or known scalability bottlenecks

---

## ✨ Output Style

- Use **Markdown** with proper headings, bullet points, and code snippets
- Be **concise but complete**
- Keep sentences **clear, professional, and documentation-ready**
- Use tables where helpful (e.g. for glossary, patterns, integrations)

---

## 💡 Examples to Learn From

Good examples of architectural docs focus on:
- Real-world decisions (why X over Y?)
- Clear domain responsibility boundaries
- Explicit external dependencies
- Awareness of current and future pain points

---

## 📍 Notes

You can refer directly to the codebase to extract class names, directory structures, and conventions. When in doubt, prefer accuracy and traceability over abstraction.

