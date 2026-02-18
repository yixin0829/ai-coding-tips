# User Memory for Claude Code
## Context Files for Coding Agents
Look for any of these context files in the project directory:
- `CLAUDE.md` - This is the context file for guiding Claude on how to work with this repository.
- `AGENTS.md` - This is the alternative context file for guiding coding agents like Claude or Gemini if CLAUDE.md does not exist.

## Encourage Code Exploration
ALWAYS read and understand relevant files before proposing code edits. Do not speculate about code you have not inspected. If the user references a specific file/path, you MUST open and inspect it before explaining or proposing fixes. Be rigorous and persistent in searching code for key facts. Thoroughly review the style, conventions, and abstractions of the codebase before implementing new features or abstractions.

## Optimize Parallel Tool Calling
If you intend to call multiple tools and there are no dependencies between the tool calls, make all of the independent tool calls in parallel. Prioritize calling tools simultaneously whenever the actions can be done in parallel rather than sequentially. For example, when reading 3 files, run 3 tool calls in parallel to read all 3 files into context at the same time. Maximize use of parallel tool calls where possible to increase speed and efficiency. However, if some tool calls depend on previous calls to inform dependent values like the parameters, do NOT call these tools in parallel and instead call them sequentially. Never use placeholders or guess missing parameters in tool calls.

## Avoid Over-Engineering
Avoid over-engineering. Only make changes that are directly requested or clearly necessary. Keep solutions simple and focused.

Don't add features, refactor code, or make "improvements" beyond what was asked. A bug fix doesn't need surrounding code cleaned up. A simple feature doesn't need extra configurability.

Don't add error handling, fallbacks, or validation for scenarios that can't happen. Trust internal code and framework guarantees. Only validate at system boundaries (user input, external APIs). Don't use backwards-compatibility shims when you can just change the code.

Don't create helpers, utilities, or abstractions for one-time operations. Don't design for hypothetical future requirements. The right amount of complexity is the minimum needed for the current task. Reuse existing abstractions where possible and follow the DRY principle.

## Facilitate Learning and Deep Thinking
For every project, write a detailed `LEARN.md` file that explains the whole project in plain language. 

Explain the technical architecture, the structure of the codebase and how the various parts are connected, the technologies used, why we made these technical decisions, and lessons I can learn from it (this should include the bugs we ran into and how we fixed them, potential pitfalls and how to avoid them in the future, new technologies used, how good engineers think and work, best practices, etc). 

It should be very engaging to read. Use appropriate mermaid diagrams to illustrate technical architecture and flow for easier understanding. Don't make it sound like boring technical documentation/textbook. Where appropriate, use analogies and anecdotes to make it more understandable and memorable.

Keep this file up-to-date with the codebase.


## Language-Specific Rules
### Python 3
#### Package Manager: `uv`
- Use `uv add <package>` to add a package to the virtual environment.
- Use `uv run <command>` to run commands in the virtual environment.
- Use `uv run python <script.py>` to run python scripts if venv is already created.
- Use `uv run --with <dep1> <dep2> ... <depN> <script.py>` to run quick python scripts with ephemeral, per-run packages without polluting the virtual environments.
  - Example: `uv run --with requests httpx pandas script.py`.
