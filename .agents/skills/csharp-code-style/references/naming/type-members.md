# Type member naming

## Methods

Name methods with verbs or verb phrases because methods perform actions:

```csharp
public int CompareTo(object value);
public string[] Split(params char[] separator);
public string Trim();
```

## Properties

- Name properties with nouns, adjectives, or noun/adjective phrases.
- Do not create a property whose name duplicates a `Get...` method; that usually indicates a method is more appropriate.
- Name collection properties with plural descriptions, not a singular name plus `List` or `Collection`.
- Avoid negative Boolean names; prefer `Is`, `Can`, or `Has` prefixes.
- A property may share its type name when that improves the API.

## Events

- Name events after actions. Present tense describes an action in progress; past tense describes an action that has completed.
- Use names such as `Clicked`, `Painting`, `Closing`, and `Closed`; do not add `Before` or `After`.
- Add the `EventHandler` suffix to event delegates and `EventArgs` to event argument classes.
- Event handlers take `sender` and `e` parameters.

## Fields

- Do not expose fields outside a type; that breaks encapsulation.
- Prefer properties. Keep fields private, name them with nouns or adjectives, and prefix them with `_` in camel case.
