# frozen_string_literal: true

# Tool for initializing a project
class InitializationTool < TinyMCP::Tool
  name 'initialize_task'
  desc 'Initialize a Railagent task requested by the user'

  def call
    File.read('prompts/workflow/initialize.md')
  end
end