---
allowed-tools: Bash(cat:*), Bash(ls:*), Bash(grep:*), Bash(rg:*), Edit(write_file:*)
description: Audit AGENTS.md against source code for accuracy and update outdated info
---

## Context

- AGENTS.md Content: !`cat AGENTS.md`
- Project Structure: !`ls -R`
- List of relevant source files: !`find . -maxdepth 2 -not -path '*/.*'`

## Your task

1. **Extract Expectations:** Identify all code snippets, API signatures, CLI commands, and environment variables documented in the `AGENTS.md`.
2. **Verify Against Source:** For each documented item, locate the corresponding implementation in the source code using `grep` or `rg`. 
3. **Detect Mismatches:** Identify discrepancies such as:
    * Renamed functions or classes.
    * Changed parameter orders or types.
    * Outdated code file location pointers.
    * Outdated installation steps or dependencies.
4. **Update Documentation:** Rewrite the necessary sections of `AGENTS.md` to reflect the current state of the code accurately.
5. **Preserve Integrity:** Maintain the existing Markdown style, headers, and overall tone of the document.

Present a summary of what was corrected before applying the changes.
