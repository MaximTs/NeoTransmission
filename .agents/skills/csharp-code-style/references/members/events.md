# Events

- Use `raise` for events rather than `fire` or `trigger`.
- Prefer `EventHandler<TEventArgs>` to custom delegate declarations.
- Use `EventArgs` when no extra data is required and a derived event-args type otherwise.
- Raise public instance events through a `protected virtual On...` method so derived classes can customize notification.
- Use the instance as `sender` for instance events and `null` for static events. Use `EventArgs.Empty` rather than a null event argument.
- Consider cancellable pre-events with `CancelEventArgs` or a derived type.
