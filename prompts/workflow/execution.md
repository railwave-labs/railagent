## 🧭 Where to Start

- Begin by opening `.cursor/scratch/todo.md`.
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
  - Use the corresponding file in `.cursor/scratch/tasks/NN_task_name.md` as the **source of truth**.
  - Do not skip ahead unless explicitly instructed. After a task is done, ask for permission to continue.
  - Each task = one commit.

- **Before each commit**:
  - Review all changed files carefully.
  - Check for security vulnerabilities (see [security.mdc](mdc:.cursor/rules/security.mdc))
  - Run tests for the test files where tests have been added only.
  - Address any regressions immediately.
  - Ask the developer to confirm before executing the commit.

- **Commit after each step**:
  - Follow the commit message conventions in [commits.mdc](mdc:.cursor/rules/commits.mdc).
  - Use the task description and ID to craft the message.

- **After each commit**:
  - Revisit `.cursor/scratch/tasks/NN_task_name.md`:
    - Add notes if implementation deviated from the plan.
    - Mark anything that was more complex or needs follow-up.
  - Update `.cursor/scratch/instructions.md` if there were anything learned or changes in direction during the task. 
  - Update `.cursor/scratch/todo.md` to reflect progress and any changes in direction during the implementation.

- **Always aim for simplicity**:
  - If things feel overly complex, step back and reassess.
  - Simpler is better, even if it takes more time to arrive there.

- **Keep implementation tightly scoped**:
  - Do not introduce unrelated changes.
  - Leave refactoring for a separate commit unless it directly supports the task.

- **Coordinate with `./cursor/scratch/instructions.md.`**:
  - This defines the full task breakdown and scope.

