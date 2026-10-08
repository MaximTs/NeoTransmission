# NeoTransmission

Windows desktop client for the Transmission RPC API, based on
[transmission-remote-dotnet](https://github.com/SoftDevDn/transmission-remote-dotnet).
The original commit history and author credits are preserved.

## Build

Open `NeoTransmission.slnx` in a compatible Visual Studio or Rider version.
The application still targets .NET Framework 2.0 / Windows Forms. Use full
Visual Studio MSBuild with .NET desktop tooling and the corresponding framework
assemblies (available with the legacy .NET Framework 3.5 tooling); this is not
an SDK-style `dotnet build` project. MSBuild must support `.slnx` solutions.

From the repository root on Windows:

```bat
build.cmd
build.cmd -Configuration Debug
```

Build scripts collect the application and version utility under
`artifacts/bin/<Configuration>/`. Run
`artifacts/bin/Release/NeoTransmission/NeoTransmission.exe`.
`build.sh` provides the same entry point for Git Bash on Windows. Native Linux
and macOS builds are not supported by the current Windows desktop project.
Set `MSBUILD_EXE_PATH` if MSBuild cannot be located automatically.

## Installer

After a Release build, compile the NSIS script from the repository root:

```bat
makensis build\Installer\Installer.nsi
```

The installer is written to `artifacts/installers/`. Pass `/DPORTABLE` to NSIS
to use the existing portable packaging mode. The legacy settings and
association registry keys remain unchanged for compatibility.

## Repository

- `src/` - application projects.
- `tests/` - test projects; currently reserved, with no automated test suite.
- `utils/` - developer tools, including the GetVersion project and localization scripts.
- `lib/` - vendored dependencies retained outside NuGet.
- `build/` - build orchestration and NSIS installer sources.
- `docs/` - development notes and original documentation.
- `packages/` - ignored NuGet package cache.
- `artifacts/` - ignored build output and local migration archives.

See [repository conventions](docs/RepositoryLayout.md) and the
[original README and credits](docs/LegacyReadme.txt).
The project is distributed under the [GPLv3 license](LICENSE).
