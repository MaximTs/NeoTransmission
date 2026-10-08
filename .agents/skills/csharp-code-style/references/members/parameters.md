# Parameters

- Avoid members with more than five parameters. Use a class, struct, or options object when more data is required.
- Accept the least-specific type that provides the required behavior, such as `IEnumerable<T>` when the member only iterates.
- Avoid public pointer and multidimensional-array parameters; redesign the API when possible.
- Prefer named tuples over `out` parameters when returning multiple values.
- Validate arguments to public, protected, and explicitly implemented members. Throw `ArgumentException` or a derived exception; use `ArgumentNullException` for null values.
- Avoid methods or constructors with one Boolean parameter; split distinct actions or use a named options type.
