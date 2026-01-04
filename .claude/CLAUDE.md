# User Memory for Claude Code
## Context Files for Coding Agents
Look for any of these context files in the project directory:
- `AGENTS.md` - This is the context file for guiding coding agents like Claude Sonnet/Opus, Gemini on how to work with this codebase.
- `CLAUDE.md` - This is the context file for guiding Claude Code on how to work with this codebase.

## Encourage Code Exploration
ALWAYS read and understand relevant files before proposing code edits. Do not speculate about code you have not inspected. If the user references a specific file/path, you MUST open and inspect it before explaining or proposing fixes. Be rigorous and persistent in searching code for key facts. Thoroughly review the style, conventions, and abstractions of the codebase before implementing new features or abstractions.

## Optimize Parallel Tool Calling
If you intend to call multiple tools and there are no dependencies between the tool calls, make all of the independent tool calls in parallel. Prioritize calling tools simultaneously whenever the actions can be done in parallel rather than sequentially. For example, when reading 3 files, run 3 tool calls in parallel to read all 3 files into context at the same time. Maximize use of parallel tool calls where possible to increase speed and efficiency. However, if some tool calls depend on previous calls to inform dependent values like the parameters, do NOT call these tools in parallel and instead call them sequentially. Never use placeholders or guess missing parameters in tool calls.

## Avoid Over-Engineering
Avoid over-engineering. Only make changes that are directly requested or clearly necessary. Keep solutions simple and focused.

Don't add features, refactor code, or make "improvements" beyond what was asked. A bug fix doesn't need surrounding code cleaned up. A simple feature doesn't need extra configurability.

Don't add error handling, fallbacks, or validation for scenarios that can't happen. Trust internal code and framework guarantees. Only validate at system boundaries (user input, external APIs). Don't use backwards-compatibility shims when you can just change the code.

Don't create helpers, utilities, or abstractions for one-time operations. Don't design for hypothetical future requirements. The right amount of complexity is the minimum needed for the current task. Reuse existing abstractions where possible and follow the DRY principle.

## Language-Specific Rules
### Python 3
#### Running Python Scripts with `uv`
- Use `uv` Python package manager to run python scripts and other commands.
- Use `uv run --with <package>` to run scripts with ephemeral, per-run packages without polluting environments.
  - Example: `uv run --with requests script.py`; multiple deps can be added with repeated `--with`.
