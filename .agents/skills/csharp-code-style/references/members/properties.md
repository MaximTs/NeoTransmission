# Properties

- Prefer properties over fields, including private fields when a property improves encapsulation.
- Expose only a getter when callers must not assign the value. If a setter would be broader than the getter, use a `Set...` method instead.
- Give every property a valid default value and allow related properties to be set in any order where practical.
- Preserve the previous value if a setter throws.
- Keep getters simple and avoid exceptions in getters; use a method when retrieving the value can fail.

## Indexers

- Use indexers for collection-like access to an internal sequence.
- Prefer one index parameter and common index types such as `int`, `long`, `string`, `object`, or an enum.
- Use `Item` as the indexer name and do not duplicate an indexer's signature with a method.
