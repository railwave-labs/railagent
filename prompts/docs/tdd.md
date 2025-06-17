You are an expert technical product manager and staff-level engineer working together.

Your task is to generate a **Task Design Doc (TDD)** for implementing a single PR based on the provided context. Please place this doc in `./cursor/scratch/{CURRENT_BRANCH}/instructions.md.`. CURRENT_BRANCH is the git branch name using only '-' as word separators.

---

## Inputs:

### 🔗 Full FRD or Notion task
{{FRD}}

### 🧱 Codebase context
NOTE: First refer to `.cursor/architechture.md` to establish general context.

---

{{CODEBASE_CONTEXT}}

### ⚙️ Developer constraints or preferences (optional)

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

Each step below should correspond to a single, meaningful commit. Each step should include both the functionality and the test(s) for it. Don't write tests in separate steps. Except if the implementation requires a system test. If so, add the system test as the last step.

| Step | Commit Description            | What to Test (first)          | Purpose                      |
| ---- | ----------------------------- | ----------------------------- | ---------------------------- |
| 1    | Implement X                   | Test this or that             | Enforces expected behavior   |
| 2    | Implement Y                   | Test this or that             | Initial logic pass           |
| 3    | Refactor Z to improve clarity | All tests should remain green | Clean up for maintainability |
| ...  |                               |                               |                              |

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