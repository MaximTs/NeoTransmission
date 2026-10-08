# Solution structure

Use this repository layout:

```text
/
  artifacts/
  build/
  docs/
  lib/
  packages/
  samples/
  src/
  tests/
  .editorconfig
  .gitignore
  .gitattributes
  build.cmd
  build.sh
  LICENSE
  NuGet.Config
  Readme.md
  NeoTransmission.slnx
```

- `src` contains product projects.
- `tests` contains test projects.
- `docs` contains documentation and reference material.
- `samples` is optional and contains working examples.
- `lib` contains libraries that are not available as NuGet packages.
- `artifacts` contains generated build output.
- `packages` contains the local NuGet cache.
- `build` contains MSBuild and installer scripts.
- `build.cmd` is the Windows build entry point; `build.sh` is the Unix/Git Bash entry point.

Keep generated files out of source control:

```gitignore
[Oo]bj/
[Bb]in/
.nuget/
packages/
artifacts/
*.user
*.suo
*.userprefs
*DS_Store
*.sln.ide
```
