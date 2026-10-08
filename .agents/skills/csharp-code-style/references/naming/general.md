# General naming rules

## Choosing names

- Prefer readable names such as `HorizontalAlignment` over `AlignmentHorizontal` and `CanScrollHorizontally` over `ScrollableX`.
- Do not use underscores, hyphens, or other non-alphanumeric separators in public identifiers.
- Do not use Hungarian notation, language keywords, or names beginning with two underscores.

## Abbreviations and acronyms

- Do not abbreviate identifiers (`GetWindow`, not `GetWin`). Avoid acronyms unless they are broadly established.

## Class, struct, and interface names

- Name classes and structs with nouns. Name interfaces with `I` plus a focused behavior or concept (`IPersistable`, `IComponent`).
- Do not prefix class names with `C`.
- When a derived type name is a phrase, end it with the same domain word as its base type, for example `LogicOperation : BaseOperation`.
- If an interface has a standard implementation, the implementation name should differ only by the leading `I`.

## Generic type parameters

- Use descriptive names unless a one-letter name is self-explanatory. Use `T` for a single generic type parameter.
- Prefix descriptive generic type parameters with `T` and name them after their constraint, such as `TSession` for `ISession`.

## Common framework type names

Use established suffixes when implementing common .NET abstractions: `Attribute`, `EventHandler`, `Callback`, `EventArgs`, `Exception`, `Dictionary`, `Collection`, `Stream`, and `Permission`. Use `enum` rather than deriving from `System.Enum`.

## Enums and routes

- Use a singular enum name unless its values are bit flags; use a plural name for flags. Do not add `Enum`, `Flag`, or `Flags` suffixes or technology prefixes.
- Use kebab-case for multiword routes, for example `/api/user-management/{user-id}`. Name endpoints after resources and use HTTP methods to distinguish operations.
