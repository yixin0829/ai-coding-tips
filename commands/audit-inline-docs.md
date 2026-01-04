---
allowed-tools: Bash(cat:*), Bash(grep:*), Bash(rg:*), Edit(write_file:*)
description: Audit inline comments, log messages, and docstrings to accurately reflect the source code
---

## Context

- Active File Content: !`cat $ACTIVE_FILE`
- Related Files: (Use `grep` or `rg` to find related imports/dependencies if needed)

## Your Task

1. **Review Source Code:** Carefully examine the active file to understand:
   * The purpose and functionality of each module, class, function, and method.
   * The logic flow and key implementation details.
   * Dependencies and relationships with other code components.

2. **Identify Documentation Issues:** Find docstrings, inline comments, and log messages that:
   * **Are outdated:** No longer match the current implementation (e.g., parameter names changed, return types differ, logic altered).
   * **Are missing:** Functions, classes, or methods lack docstrings entirely.
   * **Are unclear:** Vague, ambiguous, or fail to explain the "why" behind the code.
   * **Are incorrect:** Contain factual errors about what the code does.

3. **Update Documentation:** For each identified issue:
   * Rewrite docstrings to accurately describe the current implementation.
   * Update or add inline comments that explain *why* decisions were made (not *what* the code does).
   * Ensure log messages are clear, informative, and use appropriate log levels.
   * Follow the documentation best practices detailed below from the [Google Python Style Guide "3.8 Comments and Docstrings"](https://google.github.io/styleguide/pyguide.html#38-comments-and-docstrings).

4. **Preserve Code Integrity:** 
   * Do NOT modify any executable code, logic, or functionality.
   * Only update documentation elements (docstrings, comments, log messages).
   * Maintain the existing code structure, formatting, and style conventions.

**Before applying changes:** Present a summary listing each documentation issue found and how you plan to fix it.

## 1. General Principles

- **Clarity before brevity**: Code should be readable; comments explain *why*, not *what* (the code itself shows *what*).

- **Keep it up‑to‑date**: Out‑of‑date comments are more harmful than missing ones.

- **One style, one place**: Stick to the conventions defined here; don't mix them with other style guides.

## 2. Inline & Block Comments

### Inline comment

- Placed on the same line as the code.

- Begin with a single space and two spaces before the `#`.

- Keep the comment brief (≤ 80 characters).

### Block comment

- Starts on a line above one or more lines of code.

- Each line begins with `#` followed by a space.

- Describe *why* something is done, not *what*.

## 3. Docstrings

Docstrings provide documentation for modules, classes, functions, and methods. They are written in triple‑quoted string literals ("""Docstring""").

Example (Function):

```python
def add(a, b):
    """Return the sum of *a* and *b*.

    The function simply returns the arithmetic sum. It does not
    modify the input arguments.

    Args:
        a (int): The first operand.
        b (int): The second operand.

    Returns:
        int: The sum of *a* and *b*.

    Raises:
        TypeError: If either *a* or *b* is not an int.

    Example:
        >>> add(2, 3)
        5
    """
    if not isinstance(a, int) or not isinstance(b, int):
        raise TypeError('Both arguments must be integers')
    return a + b
```

Example (Class):

```python
class Point:
    """Represent a point in 2‑D space.

    The :class:`Point` class stores X and Y coordinates and provides
    basic geometric operations.

    Attributes:
        x (float): The X coordinate.
        y (float): The Y coordinate.

    Example:
        >>> p = Point(3, 4)
        >>> p.distance_from_origin()
        5.0
    """

    def __init__(self, x, y):
        self.x = float(x)
        self.y = float(y)

    def distance_from_origin(self):
        """Return the Euclidean distance from the origin."""
        return (self.x ** 2 + self.y ** 2) ** 0.5
```

Example (Module):

```python
"""Utility functions for mathematical operations.

This module contains functions that perform basic arithmetic,
as well as helpers for working with complex numbers.

Modules in the project should start with a one‑line summary
followed by a blank line and a more detailed description if needed.

Examples:
    >>> from math_utils import factorial
    >>> factorial(5)
    120
"""
```