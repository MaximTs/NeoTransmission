# Vendored dependencies

- `Raccoom.Xml` - source project used for RSS/OPML parsing; retains its upstream identity.
- `Jayrock` - existing Debug/Release JSON assemblies referenced directly by the application.
- `WindowsAPICodePack` - existing assemblies copied beside the application for taskbar support.

These are the exact dependencies inherited from the original repository. Their
package migration and version upgrades are outside the layout change. New dependencies
should normally use NuGet; the repository package cache is configured in `NuGet.Config`.
