# Enums

- Use an enum for a finite set of parameter, property, or return values; use constants only when an enum is not appropriate.
- Do not use enums for open-ended sets such as application versions or user lists, and do not add placeholder values “for later”.
- Provide a valid zero/default value and avoid single-value enums.
- Use `Int32` as the underlying type unless a flags enum needs more than 32 bits.
- Apply `[Flags]` only to bit flags, use powers of two for flag values, and consider named combinations for common flag sets.
