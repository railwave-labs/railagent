# Railagent - MCP Server for AI Agent Workflows

A Model Context Protocol (MCP) server that provides structured workflows and tools for AI agents working with software development projects, with specialized focus on Rails applications.

## What This Does

Railagent provides AI agents with a comprehensive workflow system for software development. It guides agents through the entire development lifecycle from requirements gathering to implementation, ensuring consistent and high-quality outcomes.

## How It Works

### For New Projects

1. **Functional Requirements**: Use the functional requirements tool to collect necessary information about the project (purpose, users, capabilities, workflows, context, edge cases)
2. **Product Requirements Document (PRD)**: Generate a complete PRD from the functional requirements, breaking down the project into features and user stories
3. **Feature Requirements Document (FRD)**: For each feature, create a detailed FRD that breaks large features into individual PR-sized units
4. **Task Design Document (TDD)**: Transform the FRD into an implementation plan with specific subtasks, where each subtask corresponds to a commit

### For Existing/Complex Systems

- Skip directly to step 4 (TDD) above when you have a clear understanding of what needs to be built

### Implementation Workflow

1. **Initialize Tasks**: Call the initialize tool to set up subtasks based on your TDD implementation plan (stored in `.cursor/scratch/tasks/`)
2. **Execute Tasks**: Use the execute tool to work on each task individually. Each task represents exactly one commit, and the agent waits for review before committing
3. **Track Progress**: Progress is maintained in `.cursor/scratch/todo.md` with notes and status updates

All documents and tasks are automatically stored in the `.cursor/scratch/` folder for easy access and organization.

## Available Tools

### Documentation Tools
- **build_functional_requirements**: Collects comprehensive project requirements
- **build_prd**: Generates Product Requirements Documents from functional requirements
- **build_frd**: Creates Feature Requirements Documents for specific features
- **build_tdd**: Breaks down features into detailed implementation plans with commit-level subtasks
- **build_architecture**: Generates comprehensive architecture documentation

### Workflow Tools
- **initialize_task**: Sets up implementation subtasks from TDD plans
- **execute_task**: Executes individual tasks with review checkpoints

## Setup Instructions

### 1. Configure MCP Client

Add to your `mcp.json` file:

```json
{
  "mcpServers": {
    "Railagent": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "cestbalez/railagent:latest"
      ]
    }
  }
}
```

### 2. Restart Your MCP Client

Restart your MCP client to load the new server.

**Note**: The Docker image will be automatically pulled from DockerHub on first use. No manual installation or repository cloning required!

## Project Structure

```
railagent/
├── app.rb                      # Main application entry point
├── lib/                        # Tool implementations
│   ├── docs/                   # Documentation tools
│   └── workflow/               # Workflow management tools
├── prompts/                    # Workflow prompts and templates
│   ├── docs/                   # Documentation workflow prompts
│   └── workflow/               # Implementation workflow templates
├── Dockerfile                  # Docker configuration
├── Gemfile                     # Ruby dependencies
└── README.md                   # This file
```

## Development

### Using the Pre-built Image

The easiest way to use Railagent is with the pre-built Docker image:

```bash
docker run -i --rm cestbalez/railagent:latest
```

### Local Development

If you want to contribute or modify the code:

```bash
git clone <your-repo-url>
cd railagent
bundle install
ruby app.rb
```

### Building Your Own Image

```bash
git clone <your-repo-url>
cd railagent
docker build -t railagent .
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the terms specified in the LICENSE file. 