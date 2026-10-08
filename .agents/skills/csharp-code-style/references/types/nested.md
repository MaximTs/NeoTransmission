# Nested types

Nested types can access the containing type's members and are useful for private implementation details such as a collection enumerator.

- Do not use public nested classes as logical grouping; use namespaces instead.
- Do not nest a type that callers must reference outside the containing type.
- Do not nest a type that callers must instantiate explicitly. A type with a public constructor should generally not be nested.
