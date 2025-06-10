require 'bundler/setup'
require 'tiny_mcp'
require_relative 'lib/docs/architecture_tool'
require_relative 'lib/docs/functional_requirements_tool'
require_relative 'lib/docs/prd_tool'
require_relative 'lib/docs/frd_tool'

TinyMCP.serve(
  ArchitectureTool,
  FunctionalRequirementsTool,
  PrdTool,
  FrdTool
)