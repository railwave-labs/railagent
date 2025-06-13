# frozen_string_literal: true

# Tool for executing a workflow
class ExecutionTool < TinyMCP::Tool
  name 'execute_task_prompt'
  desc 'Prompt to execute a Railagent task requested by the user'

  def call
    File.read('prompts/workflow/execution.md')
  end
end
