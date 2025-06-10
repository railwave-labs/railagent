# frozen_string_literal: true

require 'bundler/setup'
require 'tiny_mcp'
require_relative 'lib/docs'
require_relative 'lib/workflow'

TinyMCP.serve(
  ArchitectureTool,
  FunctionalRequirementsTool,
  PrdTool,
  FrdTool,
  TddTool,
  InitializationTool,
  ExecutionTool
)
