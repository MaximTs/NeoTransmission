# Static classes

Static classes are sealed and abstract and cannot be instantiated. Use them for focused helper operations, environment access, or extension methods.

- Use a static class only when an object-oriented type would add no useful state or behavior.
- Do not use a static class as a container for unrelated functionality.
- Remember that static classes are difficult to unit test; keep core behavior in testable instance types.
