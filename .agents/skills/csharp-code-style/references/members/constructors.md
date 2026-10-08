# Constructors

- Keep constructors simple; prefer primitive or enum parameters and use a factory method when construction semantics are not direct.
- Use constructor parameters for required state and use the same names as the properties they initialize, differing only by casing.
- A constructor should initialize the instance and do little else. Throw from an instance constructor when necessary, but avoid throwing from a static constructor.
- Declare an instance constructor explicitly when the API requires it; adding a parameterized constructor removes the compiler-generated default constructor.
- Avoid calling virtual members from constructors because the derived object may not yet be initialized.
