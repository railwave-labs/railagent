# frozen_string_literal: true

# Tool for building Feature Requirements Document (FRD) for a project
class FrdTool < TinyMCP::Tool
  name 'build_frd_prompt'
  desc 'Prompt to build a FRD (Feature Requirements Document) for a project'
  arg :prd, :string, 'PRD (Product Requirements Document)'
  arg :feature, :string, 'Feature'

  def call(prd:, feature:)
    text = File.read('prompts/docs/frd.md')
    text.gsub('{{PRD}}', prd)
    text.gsub('{{FEATURE}}', feature)
  end
end
