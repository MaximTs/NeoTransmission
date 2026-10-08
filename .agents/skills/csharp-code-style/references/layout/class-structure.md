# Class structure

## Modifier order

Use this order when declaring modifiers:

1. `public`, `internal`, `protected`, `private`
2. `static`, `new`, `abstract`, `virtual`, `override`, `sealed`
3. `readonly`, `extern`, `unsafe`, `volatile`, `async`

## Usings

Declare `using` directives alphabetically, with `System` namespaces first.

## Members

Group members in this order:

1. Enums, delegates, and events
2. Static, constant, and readonly fields
3. Other fields and properties
4. Constructors
5. Methods

Keep interface implementations together where possible. For readability, private methods may follow the public method that calls them, in call order.
