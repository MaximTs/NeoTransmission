# Extension methods

An extension method is a static method that can be called with instance syntax. The containing class must be static and the first parameter must be the extended type.

- Avoid extensions for types you do not own when a normal helper or wrapper is clearer.
- Never add extension methods to `System.Object`.
- Keep extension methods outside the extended type's namespace, except for interface extensions or dependency-management cases.
- Do not define extensions with identical signatures in different namespaces.
