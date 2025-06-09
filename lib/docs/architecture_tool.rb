# frozen_string_literal: true

# Tool for building project architecture documentation
class ArchitectureTool < TinyMCP::Tool
  name 'build_architecture'
  desc 'Build architecture for a project'

  def call
    File.read('prompts/docs/architecture.md')
  end
end
