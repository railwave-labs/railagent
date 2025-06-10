# frozen_string_literal: true

# Tool for building Task Design Document (TDD) for a project
class TddTool < TinyMCP::Tool
  name 'build_tdd'
  desc 'Build TDD (Task Design Document) for a project'
  arg :frd, :string, 'FRD (Feature Requirements Document)'
  arg :codebase_context, :string, 'Codebase context. Architecture, files, folders, etc.'
  opt :constraints, :string, 'Developer constraints and preferences'

  def call
    text = File.read('prompts/docs/tdd.md')
    text.gsub('{{FRD}}', frd)
    text.gsub('{{CODEBASE_CONTEXT}}', codebase_context)
    text.gsub('{{CONSTRAINTS}}', constraints)
  end
end
