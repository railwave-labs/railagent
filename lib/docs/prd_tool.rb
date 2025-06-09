# frozen_string_literal: true

# Tool for building Product Requirements Document (PRD) for a project
class PrdTool < TinyMCP::Tool
  name 'build_prd'
  desc 'Build PRD for a project'
  arg :functional_requirements, :string, 'The content of .cursor/scratch/functional_requirements.md, or input from the user.'

  def call
    text = File.read('prompts/docs/prd.md')

    text.gsub('{{FUNCTIONAL_REQUIREMENTS}}', functional_requirements)
  end
end
