[CmdletBinding()]
param(
    [ValidateSet('Debug', 'Release')]
    [string]$Configuration = 'Release'
)
$ErrorActionPreference = 'Stop'
$msbuild = $env:MSBUILD_EXE_PATH
if (!$msbuild) {
    $command = Get-Command MSBuild.exe -ErrorAction SilentlyContinue
    if ($command) { $msbuild = $command.Source }
}
if (!$msbuild) {
    $vswhere = Join-Path ${env:ProgramFiles(x86)} 'Microsoft Visual Studio\Installer\vswhere.exe'
    if (Test-Path -LiteralPath $vswhere) {
        $msbuild = & $vswhere -latest -products '*' -requires Microsoft.Component.MSBuild -find 'MSBuild\**\Bin\MSBuild.exe' | Select-Object -First 1
    }
}
if (!$msbuild -or !(Test-Path -LiteralPath $msbuild)) {
    throw 'Install Visual Studio / Build Tools with desktop .NET support, or set MSBUILD_EXE_PATH.'
}
& $msbuild (Join-Path $PSScriptRoot 'Build.proj') /nologo /m /v:minimal "/p:Configuration=$Configuration"
exit $LASTEXITCODE
