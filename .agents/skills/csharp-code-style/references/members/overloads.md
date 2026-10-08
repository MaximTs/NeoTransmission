# Overloads

- Use descriptive parameter names and keep the same names and order across overloads.
- Put optional/default behavior in the longest overload; shorter overloads should delegate to it.
- Avoid `ref` and `out` overloads because they often hide different semantics.
- Prefer overloads over optional parameters when CLS compatibility matters.
