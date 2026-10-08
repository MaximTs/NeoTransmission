#!/usr/bin/env sh
set -eu
root=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
case "$(uname -s)" in
  MINGW*|MSYS*|CYGWIN*)
    exec powershell.exe -NoProfile -ExecutionPolicy Bypass -File "$(cygpath -w "$root/build/Build.ps1")" "$@"
    ;;
  *)
    echo 'NeoTransmission currently targets Windows Forms / .NET Framework 2.0.' >&2
    echo 'Build on Windows with build.cmd (or this script in Git Bash).' >&2
    exit 1
    ;;
esac
