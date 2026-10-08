# Class versus struct

Classes are reference types; structs are value types. Reference assignments copy a reference, while value assignments copy the entire value. Boxing a struct allocates and should be avoided in hot paths.

Prefer classes in most cases. Use a struct only when the value is small, short-lived or embedded, immutable, no larger than about 16 bytes, and is unlikely to be boxed frequently.
