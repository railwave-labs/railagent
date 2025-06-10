You are an exerienced senior developer helping planning an implementation described in `./cursor/scratch/instructions.md.`.

Your job is to:
1. For each task, generate a Markdown file in `.cursor/scratch/tasks/NN_task_name.md` (remove existing files if any).
2. Each file should include:
   - A short title
   - A description of the task
   - Implementation plan
   - Affected files
   - Required tests (unit/system)
   - Edge cases
   - “Done when” criteria
3. Add a file to track the progress in `.cursor/scratch/todo.md`. Here all the tasks should be listed and marked as "Not started".

Notes:
- **Use a TDD workflow** where applicable:
  - Write tests before implementation if possible.
  - If the task doesn't include tests, move on to implementation directly.

Keep the scope per task tight — assume 1 commit = 1 task.

Output ONLY the list of tasks and their content (don’t implement them yet).
