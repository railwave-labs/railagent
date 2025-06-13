# frozen_string_literal: true

# Tool for building functional requirements documents using template substitution
class FunctionalRequirementsTool < TinyMCP::Tool
  name 'build_functional_requirements_prompt'
  desc 'Prompt to build functional requirements for a project'
  arg :name, :string, 'The name of the product?'
  arg :purpose, :string, 'The purpose and value of the product. What problem does it solve?'
  arg :interactors, :string, 'The users or systems that will interact with it.'
  arg :capabilities, :string, 'What the system must enable or support'
  arg :workflows, :string, 'Core workflows or usage scenarios.'
  arg :context, :string, 'The environment, architecture, integrations, or performance that matters.'
  arg :edge_cases, :string, 'Edge cases, offline usage, legal/regulatory needs, data storage, accessibility, etc.'

  def call(name:, purpose:, interactors:, capabilities:, workflows:, context:, edge_cases:)
    prompt = File.read('prompts/docs/functional_requirements.md')
    prompt.gsub('{{NAME}}', name)
          .gsub('{{PURPOSE}}', purpose)
          .gsub('{{INTERACTORS}}', interactors)
          .gsub('{{CAPABILITIES}}', capabilities)
          .gsub('{{WORKFLOWS}}', workflows)
          .gsub('{{CONTEXT}}', context)
          .gsub('{{EDGE_CASES}}', edge_cases)
  end
end
