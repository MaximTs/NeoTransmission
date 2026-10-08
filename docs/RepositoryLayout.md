# Repository layout and naming

The solution follows the `src`, `tests`, and `utils` grouping used by Nuta.Back.
Folders that hold build scripts are versioned; build output belongs in `artifacts`.
There are no CI pipelines or Docker files.

```text
NeoTransmission.slnx
src/NeoTransmission/NeoTransmission.csproj
tests/
utils/GetVersion/GetVersion.csproj
utils/Localization/
lib/Raccoom.Xml/Raccoom.Xml.csproj
lib/Jayrock/
lib/WindowsAPICodePack/
build/Build.proj
build/Build.ps1
build/Installer/
docs/
```

Product project folders and project files share a name. Product namespaces start
with `NeoTransmission`; the desktop assembly is `NeoTransmission.exe`.
Utilities may have short project names, with assemblies prefixed by the product
name, such as `NeoTransmission.GetVersion`. Future test projects should use
`<ProjectName>.Tests` (for example `NeoTransmission.Tests`). Third-party code keeps
its original names and namespaces, including `Raccoom.Xml` and bundled MonoTorrent.

No target-framework migration is included in this layout change. Existing
settings keys, protocol handlers and UI translations retain their legacy names.
`samples` is optional and will be added when real examples exist. `global.json`
is not introduced. NuGet caches and build output are created locally and ignored.

The old `Backup` tree, generated `obj` files, upgrade log, prebuilt GetVersion
binary and per-user project file were moved to ignored `artifacts/legacy` during
the migration. They are not needed to build the current solution. Their previous
versions remain available in Git history and in the pre-migration working-copy backup.
