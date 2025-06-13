# frozen_string_literal: true

# Tool for building Task Design Document (TDD) for a project
class TddTool < TinyMCP::Tool
  name 'build_tdd_prompt'
  desc 'Prompt for building a TDD (Task Design Document) for a project'
  arg :frd, :string, 'FRD (Feature Requirements Document) or Notion task'
  arg :codebase_context, :string, 'Codebase context. Architecture, files, folders, etc.'
  opt :constraints, :string, 'Developer constraints and preferences. Ask the user if not provided.'

  def call(frd:, codebase_context:, constraints: '')
    text = File.read('prompts/docs/tdd.md')
    text.gsub('{{FRD}}', frd)
    text.gsub('{{CODEBASE_CONTEXT}}', codebase_context)
    text.gsub('{{CONSTRAINTS}}', constraints)
    text
  end
end
