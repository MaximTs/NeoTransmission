# Abstract classes

- Do not expose a public constructor on an abstract type because the type cannot be instantiated directly.
- Use a `protected` constructor for extensibility or an `internal` constructor when implementations should stay within the assembly.
- Provide at least one concrete implementation for every abstract class so its design can be exercised.
