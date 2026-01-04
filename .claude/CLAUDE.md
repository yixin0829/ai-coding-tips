## Context Files for Coding Agents
Look for any of these context files in the project directory:
- `AGENTS.md` - This is the context file for guiding coding agents like Claude Sonnet/Opus, Gemini on how to work with this codebase.
- `CLAUDE.md` - This is the context file for guiding Claude Code on how to work with this codebase.

## Dependency Management and Running Python Scripts with `uv`
- Use `uv` Python package manager to run python scripts and other commands.
- Use `uv run --with <package>` to run scripts with ephemeral, per-run packages without polluting environments.
  - When running scripts without a project or lockfile, `uv run` creates an isolated temporary environment, installs specified packages, executes the command, and discards the environment afterward. Example: `uv run --with requests script.py`; multiple deps can be added with repeated `--with`, and version constraints are supported (`uv run --with 'pandas==2.2.0' --with 'scikit-learn>=1.5' script.py`). It also works for modules or a REPL (`uv run --with requests python -m http.server`), and requirements files (`uv run --with -r requirements.txt script.py`). By default, uv uses its download/build cache for speed; set `UV_NO_CACHE=1` for a fully fresh run.