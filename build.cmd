@echo off
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0build\Build.ps1" %*
exit /b %ERRORLEVEL%
