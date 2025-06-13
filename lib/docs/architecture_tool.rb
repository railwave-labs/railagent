# frozen_string_literal: true

# Tool for building project architecture documentation
class ArchitectureTool < TinyMCP::Tool
  name 'build_architecture_prompt'
  desc 'Prompt to build architecture for a project'

  def call(functional_requirements:)
    text = File.read('prompts/docs/architecture.md')
    text.gsub('{{FUNCTIONAL_REQUIREMENTS}}', functional_requirements)
    text
  end
end
