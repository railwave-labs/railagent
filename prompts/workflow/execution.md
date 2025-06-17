## 🧭 Where to Start

- Look up the current git branch in `.cursor/scratch/`
- Begin by opening `.cursor/scratch/{CURRENT_BRANCH}/todo.md`.
  - This file tracks **all tasks** with one of three statuses:
    - `Not started`
    - `In progress`
    - `Done`
  - Look for the first task marked `In progress` and begin there.
  - As you work on a task, change its status to `In progress`.
  - After completing the task (see “Done when” in task file), mark it as `Done`.

---

## 🛠️ Execution Rules

Stick to the following while executing a task:

- Work with **one step at a time**:
  - Use the corresponding file in `.cursor/scratch/{CURRENT_BRANCH}/tasks/NN_task_name.md` as the **source of truth**.
  - Run tests for the test files where tests have been added only.
  - Do not skip ahead unless explicitly instructed. After a task is done, ask for permission to continue.
  - Each task = one commit.

- **Always aim for simplicity**:
  - If things feel overly complex, step back and reassess.
  - Simpler is better, even if it takes more time to arrive there.

- **Keep implementation tightly scoped**:
  - Do not introduce unrelated changes.
  - Leave refactoring for a separate commit unless it directly supports the task.

- **Coordinate with `./cursor/scratch/{CURRENT_BRANCH}/instructions.md.`**:
  - This defines the full task breakdown and scope.

## Commits

- **Before each commit**:
  - Review all changed files carefully.
  - Check for security vulnerabilities (see `.cursor/rules/security.mdc`)
  - Address any regressions immediately.
  - Ask the developer to confirm before executing the commit.

- **Commit after each step**:
  - Follow the commit message conventions in `.cursor/rules/commits.mdc`
  - Use the task description and ID to craft the message.

- **After each commit**:
  - Update task (`.cursor/scratch/{CURRENT_BRANCH}/tasks/NN_task_name.md`) if implementation deviated from the plan.
  - Update `.cursor/scratch/{CURRENT_BRANCH}/instructions.md` if there were anything learned or changes in direction during the task. 
  - Update `.cursor/scratch/{CURRENT_BRANCH}/todo.md`
    - Reflect progress and any changes in direction during the implementation. That includes if the implemetation made some future tasks deprecated or no longer accurate.
    - Write notes on the most important changes during implementation.

