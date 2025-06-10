You are an expert technical product manager working closely with an engineering team. Your task is to generate a **Feature Requirements Document (FRD)** for a single feature, based on a full Product Requirements Document (PRD), **plus technical context** provided below.

Full PRD or task context
{{PRD}}

Feature to focus on
 - Paste the **exact text or heading** for the feature this FRD should cover.

{{FEATURE}}
 
Codebase and Architectural Context  
 - Describe where this feature fits into the codebase and system architecture.  
 - List relevant domains, services, models, or UI modules.  
 - Mention preferred patterns (e.g. service objects, hooks, background jobs) and any constraints.

	Examples:
		- Lives in the `Retreats` domain
		- Models involved: `Booking`, `User`, possibly `Payment`
		- Business logic in `app/services`, persistence in `app/models`
		- Async jobs use Sidekiq with `MyWorker`
		- Frontend uses React + Tailwind, with Headless UI modals

---

## Instructions

- Read the full PRD or task given to understand the product vision and feature set.
- Focus only on the **feature named below**, but use broader context where necessary.
- Use the **standard FRD structure** exactly as outlined — do not invent new sections.
- Populate the **Technical notes** section with help from the technical context provided below.
- Where architecture or logic is uncertain, write `TODO` or leave it blank — do not remove sections.
- Break implementation into PR-sized units and identify parallelization opportunities.

---

## 📄 Feature Requirement Document – [Feature Name]

### 1. Overview
- **Feature ID**: FE-###  
- **Title**:  
- **Type**: Feature / Bug / Enhancement / Chore  
- **Priority**:  
- **Related to**: PRD §[X.X] – "[Feature Title]"

### 2. Description
_A concise explanation of what this feature does, what problem it solves, and why it's important._

### 3. Goals
- Bullet list of expected outcomes

### 4. Functional scope  
✅ Includes:
- ...  
❌ Excludes:
- ...

### 5. User stories and breakdown 

| Story ID | Title | PR Scope | Dependencies | Description |
| -------- | ----- | -------- | ------------ | ----------- |
| US-###-1 | ...   | PR #1    | —            | ...         |
| US-###-2 | ...   | PR #2    | US-###-1     | ...         |

> If this is a **Bug**, use this section as an investigation and fix plan
> For all other task types, break work into small, testable user stories that each map to a PR.
> Optimize for PRs that can be reviewed and merged independently

### 6. Technical notes
- Architecture guidance  
- Relevant services, folders, or modules  
- Reuse patterns or known abstractions  
- Frontend framework details (if applicable)  
- Performance or testing considerations

### 7. Acceptance criteria
- Clear, testable outcomes for each user story and PR

### 8. System tests
- If this feature involves flows that span across multiple user stories or PRs, outline them here.
- Break these flows down into concrete system test scenarios.
- These tests should be added in a **final dedicated PR**, once all related PRs are merged.

### 9. Manual feature test plan

- Step-by-step instructions to test the feature holistically after all PRs are merged
- Include screenshots or flows if necessary
- Include expected side effects or integrations
- Link to Figma or design specs (if applicable)