#!/usr/bin/env sh
set -eu
tools=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
root=$(CDPATH= cd -- "$tools/../.." && pwd)
sync_resource() {
    case "$(uname -s)" in
      MINGW*|MSYS*|CYGWIN*) "$tools/resxsync.exe" "$1" "$2" ;;
      *) mono "$tools/resxsync.exe" "$1" "$2" ;;
    esac
}
for directory in "$root/src/NeoTransmission/Forms" "$root/src/NeoTransmission/Localization"; do
    for translated in "$directory"/*.??-??.resx; do
        [ -f "$translated" ] || continue
        base=${translated%.*.resx}.resx
        [ -f "$base" ] || continue
        sync_resource "$base" "$translated"
        perl "$tools/prune_resx.pl" "$translated"
    done
done
