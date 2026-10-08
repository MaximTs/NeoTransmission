# Developer utilities

`GetVersion` builds `NeoTransmission.GetVersion.exe` and prints the major/minor
assembly version of the executable passed as its argument. The NSIS installer
uses the built utility from `artifacts/bin/Release/GetVersion`.

`Localization` contains the inherited `resxsync.exe` and Perl scripts. Run
`sh utils/Localization/syncresx.sh` from Git Bash with Perl installed. It updates
translated resources in `src/NeoTransmission/Forms` and `Localization`.
On other platforms the legacy resxsync executable requires Mono.
These scripts modify resource files, so review the resulting diff before committing.
