# General development rules

- Use four spaces for indentation and keep one type per file. The file name should match the type name.
- Prefer `using` directives, avoid magic numbers, and initialize variables at declaration.
- Keep one statement per line, one blank line between members, and one blank line between logical blocks. Do not leave commented-out code.
- Put braces on their own lines, separate operators from operands with spaces, and use parentheses when they clarify compound logical expressions.
- Comments should explain why and what, not restate how. Document public, protected, and internal APIs whenever practical.
- Always write an access modifier. Use the order `public/internal/protected/private`, then `static/abstract/virtual/override`, then `async`.
- Prefer private members and sealed internal types by default. Prefer primitive aliases such as `int`, except when referring to static members such as `Int32.Parse`.
- Prefer lambdas to delegates, concise array/object initialization, and explicit local types when they improve readability. Use `var` only when the right-hand side makes the type obvious.
- Prefer `string.IsNullOrEmpty(value) is false` to a leading negation such as `!string.IsNullOrEmpty(value)`.
