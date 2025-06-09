# Railagent - MCP Server for AI Agent Workflows

A Model Context Protocol (MCP) server that provides structured workflows and tools for AI agents working with Ruby on Rails applications.

## What This Does

Railagent is an MCP server designed to provide AI agents with a comprehensive workflow for Rails development tasks. It offers specialized tools and prompts that guide agents through various development processes, ensuring consistent and high-quality outcomes.

### Current Tools

- **build_architecture**: Generates comprehensive architecture documentation for Rails applications using a detailed prompt template that covers system overview, tech stack, domains, patterns, data flow, and more.

## Prerequisites

- Docker
- A compatible MCP client (like Claude Desktop or Cursor)

## Setup Instructions

### 1. Build the Docker Image

First, clone this repository and build the Docker image:

```bash
git clone <your-repo-url>
cd railagent
docker build -t railagent .
```

### 2. Configure MCP Client

Add the following configuration to your MCP client's configuration file:

#### For Cursor and Claude Desktop
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
        "railagent"
      ]
    }
  }
}
```

### 3. Restart Your MCP Client

After updating the configuration, restart your MCP client to load the new server.

## Usage

Once configured, you can access the available workflow tools in your MCP client. Each tool provides structured prompts and guidance for specific Rails development tasks.

### Workflow Philosophy

Railagent is built around the idea of providing AI agents with:
- **Structured workflows** for common Rails development tasks
- **Detailed prompts** that ensure comprehensive coverage of requirements
- **Best practice guidance** embedded in each tool
- **Consistent outputs** across different development scenarios

As more tools are added, they will follow this same pattern of providing clear, actionable workflows that help agents deliver high-quality Rails development work.

## Available Tools

- **build_architecture**: Returns a detailed prompt template for creating comprehensive Rails architecture documentation

*More workflow tools will be added to cover other aspects of Rails development such as feature planning, code review, testing strategies, and deployment workflows.*

## Development

### Local Development

If you want to run the server locally without Docker:

```bash
# Install dependencies
bundle install

# Run the server
ruby app.rb
```

### Project Structure

```
railagent/
├── app.rb                      # Main application entry point
├── lib/                        # Tool implementations organized by category
│   └── docs/                   # Documentation-related tools
├── prompts/                    # Workflow prompts and templates
│   ├── docs/                   # Documentation workflow prompts
│   └── workflow/               # General workflow templates
├── Dockerfile                  # Docker configuration
├── Gemfile                     # Ruby dependencies
└── README.md                   # This file
```

### Adding New Tools

To add new workflow tools:

1. Create a new tool class in the appropriate `lib/` subdirectory
2. Add corresponding prompt templates in `prompts/`
3. Register the tool in `app.rb`
4. Follow the established pattern of providing comprehensive, structured workflows

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the terms specified in the LICENSE file. 