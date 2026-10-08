# Casing

- Use Latin characters and meaningful names that express one purpose.
- Use `PascalCase` for namespaces, types, members, and constants. Use `camelCase` for parameters, locals, and lambda parameters.
- Prefix private fields with `_` and then use camel case, for example `_connection`.
- Use singular names for one object and plural names for collections.
- Treat common compound words as one word: `Callback`, `Endpoint`, and `Hashtable`, not `CallBack`, `EndPoint`, or `HashTable`.

| Identifier | Casing | Example |
| --- | --- | --- |
| Namespace | Pascal | `namespace System.Security` |
| Class | Pascal | `public class StreamReader` |
| Interface | Pascal | `public interface IEnumerable` |
| Method | Pascal | `string Trim()` |
| Property | Pascal | `int Length { get; }` |
| Event | Pascal | `event EventHandler Exited` |
| Enum value | Pascal | `Append` |
| Constant | Pascal | `const int MaxOptionShift = 10` |
| Parameter | camel | `int ToInt32(string value)` |
| Local variable | camel | `int num = -1` |
| Private field | `_camel` | `int _textPosition` |
