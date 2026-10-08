---
name: csharp-code-style
description: Apply the NeoTransmission C# and repository style when creating, reviewing, or restructuring C# code, types, members, namespaces, projects, or solution files. Use the references for the relevant design topic; do not apply these conventions to unrelated languages or external code without checking scope.
metadata:
  short-description: NeoTransmission C# and solution conventions
---

# NeoTransmission C# style

Use this skill when changing C# code or the repository layout in NeoTransmission. The rules are the project's C# conventions, based on Microsoft's .NET Design Guidelines. Prefer the narrowest relevant reference rather than loading every document.

## Before editing

- Identify whether the change concerns naming, a type, a member, class layout, or solution layout.
- Inspect nearby code and preserve the established `NeoTransmission` namespace and legacy target framework unless the task explicitly changes them.
- Treat the references as project conventions. Where an inherited rule conflicts with compiler requirements, API compatibility, or an explicit user request, explain the conflict and choose the smallest compatible change.

## Route to the references

- Naming and casing: read [references/naming/casing.md](references/naming/casing.md), then the focused naming reference for namespaces, type members, parameters, or general naming.
- General implementation decisions: read [references/types/general-development.md](references/types/general-development.md).
- Type design: read the relevant file under `references/types/` for classes versus structs, abstract or static classes, interfaces, structs, enums, or nested types.
- Member design: read the relevant file under `references/members/` for overloads, properties, constructors, events, fields, extension methods, or parameters.
- Ordering and layout inside a type: read [references/layout/class-structure.md](references/layout/class-structure.md).
- Solution and repository organization: read [references/layout/solution-structure.md](references/layout/solution-structure.md), together with the repository's current `NeoTransmission.slnx` and build documentation.

## Working rules

- Use PascalCase for types, namespaces, public members, and methods; use camelCase for parameters and local variables, following the casing reference for acronyms.
- Choose names that describe intent and behavior rather than implementation type.
- Prefer properties over fields; keep fields private unless a documented compatibility requirement says otherwise.
- Keep public APIs small and explicit. Design interfaces and abstract types around a focused behavior and provide a usable implementation when the design calls for one.
- Use structs only for small value-like immutable entities with valid default values; use classes for reference semantics or larger mutable state.
- Keep constructors simple and predictable. Use events with the standard .NET event pattern and extension methods only when they improve discoverability for the extended type.
- Keep solution structure aligned with `src/`, `tests/`, `utils/`, `lib/`, `build/`, `docs/`, `packages/`, and `artifacts/`; do not add CI or Docker files unless explicitly requested.

## Source and scope

The reference set is listed in [references/index.md](references/index.md). The source guidance is based on Microsoft's [.NET Design Guidelines](https://docs.microsoft.com/en-us/dotnet/standard/design-guidelines/). The references are project-local documentation, not a request to copy these conventions into unrelated repositories.
