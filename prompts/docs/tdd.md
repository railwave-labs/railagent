You are an expert technical product manager and staff-level engineer working together.

Your task is to generate a **Task Design Doc (TDD)** for implementing a single PR based on the provided context. Please place this doc in `./cursor/scratch/instructions.md.`.

---

## Inputs:

### 🔗 Full FRD or Notion task
{{FRD}}

### 🧱 Codebase context
Refer to `.cursor/architechture.md` if available.

{{CODEBASE_CONTEXT}}

### ⚙️ Developer constraints or preferences (optional)
Examples
- "Use test-driven development"  
- "Avoid touching background job queue"  
- "Reuse Booking model if possible"  
- "Prefer composition over inheritance"

{{CONSTRAINTS}}

---

## Your output must follow this format exactly:

# Task Design Doc – [Task Title]

### 1. Overview
- **Type**: Feature / Bug / Enhancement / Chore  
- **Priority**:  
- **Related to**: [Link to FRD or Notion task]  
- **Expected PR**: PR #[X]  
- **Status**: Not started / In progress / Ready for review / Done  

---

### 2. Description
_A concise summary of what this task does and why._

---

### 3. Scope
✅ Includes:
-  
❌ Excludes:
-  

---

### 4. Implementation plan (commit-level)

You must follow **test-driven development**.  
Each step below should correspond to a single, meaningful commit:

| Step | Commit Description            | What to Test (first)          | Purpose                      |
| ---- | ----------------------------- | ----------------------------- | ---------------------------- |
| 1    | Add failing test for ...      | Describe test name + type     | Enforces expected behavior   |
| 2    | Implement X to make test pass | Confirm test is green         | Initial logic pass           |
| 3    | Refactor Y to improve clarity | All tests should remain green | Clean up for maintainability |
| ...  |                               |                               |                              |

> Write failing tests first, then code, then refactor. Each commit should be independently understandable.

---

### 5. Technical notes
- Architecture or file structure considerations
- Known abstractions to reuse
- Dependencies or side effects
- Edge cases to watch for

---

### 6. Test plan
- ✅ Automated:
  - Unit tests: [list cases]
  - Integration tests: [list flows]
- 🧪 Manual:
  - How to confirm it works via browser, console, etc.
- 🔁 Regressions to guard against

---

### 7. Rollout or follow-up
- Flagging, cleanup, or migration
- New stories this might create