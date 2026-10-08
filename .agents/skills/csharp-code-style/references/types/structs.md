# Structs

- Avoid parameterized constructors in structs when default construction must remain simple.
- Use structs only for small immutable value-like entities.
- Ensure the default value of every struct member is valid.
- Implement `IEquatable<T>` and value equality without unnecessary boxing.
