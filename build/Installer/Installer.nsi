!include "MUI2.nsh"
!include "${__FILEDIR__}\FileAssociation.nsh"
!include "${__FILEDIR__}\ProtocolAssociation.nsh"
!include "x64.nsh"

; Compile after build.cmd. All paths are independent of the caller's directory.
!define ROOT "${__FILEDIR__}\..\.."
!define APP "${ROOT}\artifacts\bin\Release\NeoTransmission"
!define VERSION_TOOL "${ROOT}\artifacts\bin\Release\GetVersion\NeoTransmission.GetVersion.exe"
!system 'if not exist "${ROOT}\artifacts\installers" mkdir "${ROOT}\artifacts\installers"' = 0
!system '"${VERSION_TOOL}" "${APP}\NeoTransmission.exe" > "${ROOT}\artifacts\installers\version.txt"' = 0
!define /file REV "${ROOT}\artifacts\installers\version.txt"
;--------------------------------

; The name of the installer
Name "Transmission Remote"

; The file to write
!ifndef REV
OutFile "${ROOT}\artifacts\installers\NeoTransmission-installer.exe"
!else
OutFile "${ROOT}\artifacts\installers\NeoTransmission-${REV}-installer.exe"
!endif

; The default installation directory
!define ProgramFilesDir "Transmission Remote"

!ifndef PORTABLE
; Registry key to check for directory (so if you install again, it will 
; overwrite the old one automatically)
InstallDirRegKey HKLM "Software\TransmissionRemote" "Install_Dir"

; Request application privileges for Windows Vista
RequestExecutionLevel admin
!else
RequestExecutionLevel user
!endif

;--------------------------------

XPStyle on

Var StartMenuFolder

!define MUI_ICON "${ROOT}\src\NeoTransmission\transmission_large.ico"
!define MUI_UNICON "${ROOT}\src\NeoTransmission\transmission_large.ico"
!define MUI_HEADERIMAGE
;!define MUI_HEADERIMAGE_BITMAP "logo.bmp"
;!define MUI_WELCOMEFINISHPAGE_BITMAP "nsis_wizard.bmp"
;!define MUI_UNWELCOMEFINISHPAGE_BITMAP "nsis_wizard.bmp"
;!define MUI_COMPONENTSPAGE_CHECKBITMAP "${NSISDIR}\Contrib\Graphics\Checks\colorful.bmp"
!define MUI_COMPONENTSPAGE_SMALLDESC
!define MUI_ABORTWARNING

!define MUI_FINISHPAGE_SHOWREADME "$INSTDIR\Readme.md"
!define MUI_FINISHPAGE_SHOWREADME_TEXT "Show ReadMe"
!define MUI_FINISHPAGE_SHOWREADME_NOTCHECKED

; Pages
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "${ROOT}\LICENSE"
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
;!define MUI_STARTMENUPAGE_REGISTRY_ROOT "HKCU"
;!define MUI_STARTMENUPAGE_REGISTRY_KEY "Software\TransmissionRemote"
;!define MUI_STARTMENUPAGE_REGISTRY_VALUENAME "Start Menu Folder"
!insertmacro MUI_PAGE_STARTMENU Application $StartMenuFolder
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_UNPAGE_WELCOME
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH

;--------------------------------

!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_RESERVEFILE_LANGDLL

; English
LangString NAME_SecTransmissionRemote ${LANG_ENGLISH} "Transmission Remote (required)"
LangString DESC_SecTransmissionRemote ${LANG_ENGLISH} "If set, a shortcut for Transmission Remote will be created on the desktop."
LangString NAME_SecFiletypeAssociations ${LANG_ENGLISH} "Register Filetype Associations"
LangString DESC_SecFiletypeAssociations ${LANG_ENGLISH} "Register Associations to Transmission Remote"
LangString NAME_SecRegiterTorrent ${LANG_ENGLISH} "Register .torrent"
LangString DESC_SecRegiterTorrent ${LANG_ENGLISH} "Register .torrent to Transmission Remote"
LangString NAME_SecRegiterMagnet ${LANG_ENGLISH} "Register Magnet URI"
LangString DESC_SecRegiterMagnet ${LANG_ENGLISH} "Register Magnet URI to Transmission Remote"
LangString NAME_SecDesktopIcon ${LANG_ENGLISH} "Create icon on desktop"
LangString DESC_SecDesktopIcon ${LANG_ENGLISH} "If set, a shortcut for Transmission Remote will be created on the desktop."
LangString DESC_SecGeoIPDatabase ${LANG_ENGLISH} "GeoIP database"
LangString NAME_SecLanguages ${LANG_ENGLISH} "Languages"
LangString DESC_SecLanguages ${LANG_ENGLISH} "Languages for Transmission Remote"

;--------------------------------

; The stuff to install
Section $(NAME_SecTransmissionRemote) SecTransmissionRemote
  SectionIn RO
  
  ; Set output path to the installation directory.
  SetOutPath $INSTDIR
  
  ; Put file there
  File "${APP}\NeoTransmission.exe"
  File "${APP}\Jayrock.dll"
  File "${APP}\Jayrock.Json.dll"
  File "${APP}\Raccoom.Xml.dll"
  File "${APP}\Microsoft.WindowsAPICodePack.dll"
  File "${APP}\Microsoft.WindowsAPICodePack.Shell.dll"
  File "${APP}\NeoTransmission.exe.config"
  File "${APP}\Readme.md"
  File "${APP}\LICENSE"
  
!ifndef PORTABLE
  ; Write the installation path into the registry
  WriteRegStr HKLM "SOFTWARE\TransmissionRemote" "Install_Dir" "$INSTDIR"
  
  ; Write the uninstall keys for Windows
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Transmission Remote" "DisplayName" "Transmission Remote"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Transmission Remote" "Publisher" "Alan F"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Transmission Remote" "UninstallString" '"$INSTDIR\uninstall.exe"'
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Transmission Remote" "DisplayIcon" "$INSTDIR\NeoTransmission.exe,0"
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Transmission Remote" "NoModify" 1
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Transmission Remote" "NoRepair" 1
  WriteUninstaller "uninstall.exe"
!endif
  
  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
    SetShellVarContext current
    CreateDirectory "$SMPROGRAMS\$StartMenuFolder"
    CreateShortCut "$SMPROGRAMS\$StartMenuFolder\Transmission Remote.lnk" "$INSTDIR\NeoTransmission.exe" "" "$INSTDIR\NeoTransmission.exe" 0 
!ifndef PORTABLE
    SetShellVarContext all
    CreateDirectory "$SMPROGRAMS\$StartMenuFolder"
;    CreateShortCut "$SMPROGRAMS\$StartMenuFolder\Uninstall.lnk" "$INSTDIR\uninstall.exe" "" "$INSTDIR\uninstall.exe" 0
    CreateShortCut "$SMPROGRAMS\$StartMenuFolder\Transmission Remote.lnk" "$INSTDIR\NeoTransmission.exe" "" "$INSTDIR\NeoTransmission.exe" 0 
!endif
  !insertmacro MUI_STARTMENU_WRITE_END

SectionEnd

; Optional section (can be disabled by the user)

Section /o $(NAME_SecDesktopIcon) SecDesktopIcon
  SetShellVarContext current
  SetOutPath "$INSTDIR\bin"
  CreateShortCut "$DESKTOP\Transmission Remote.lnk" "$INSTDIR\NeoTransmission.exe" "" "$INSTDIR\NeoTransmission.exe" 0
SectionEnd

Section "GeoIP Database" SecGeoIPDatabase
  SetOutPath "$INSTDIR"
  File "${APP}\GeoIP.dat"
SectionEnd

!ifndef PORTABLE
SubSection $(NAME_SecFiletypeAssociations) SecFiletypeAssociations

  Section $(NAME_SecRegiterTorrent) SecRegiterTorrent
    ${registerExtension} "$INSTDIR\NeoTransmission.exe" ".torrent" "Transmission Remote Torrent"
  SectionEnd

  Section $(NAME_SecRegiterMagnet) SecRegiterMagnet
    ${registerProtocol} "$INSTDIR\NeoTransmission.exe" "magnet" "Magnet URI"
  SectionEnd

SubSectionEnd
!endif

; Translation

SectionGroup $(NAME_SecLanguages) SecLanguages

  Section /o "Brazilian Portuguese" SecLanguagesBrazilianPortuguese
    CreateDirectory "$INSTDIR\pt-BR"
    SetOutPath "$INSTDIR\pt-BR"
    File "${APP}\pt-BR\NeoTransmission.resources.dll"
  SectionEnd

  Section /o "Chinese" SecLanguagesChinese
    CreateDirectory "$INSTDIR\zh-CN"
    SetOutPath "$INSTDIR\zh-CN"
    File "${APP}\zh-CN\NeoTransmission.resources.dll"
  SectionEnd
  
  Section /o "Czech" SecLanguagesCzech
    CreateDirectory "$INSTDIR\cs-CZ"
    SetOutPath "$INSTDIR\cs-CZ"
    File "${APP}\cs-CZ\NeoTransmission.resources.dll"
  SectionEnd
  
  Section /o "Danish" SecLanguagesDanish
    CreateDirectory "$INSTDIR\da-DK"
    SetOutPath "$INSTDIR\da-DK"
    File "${APP}\da-DK\NeoTransmission.resources.dll"
  SectionEnd
  
  Section /o "Dutch" SecLanguagesDutch
    CreateDirectory "$INSTDIR\nl-NL"
    SetOutPath "$INSTDIR\nl-NL"
    File "${APP}\nl-NL\NeoTransmission.resources.dll"
  SectionEnd
  
  Section /o "French" SecLanguagesFrench
    CreateDirectory "$INSTDIR\fr-FR"
    SetOutPath "$INSTDIR\fr-FR"
    File "${APP}\fr-FR\NeoTransmission.resources.dll"
  SectionEnd
  
  Section /o "German" SecLanguagesGerman
    CreateDirectory "$INSTDIR\de-DE"
    SetOutPath "$INSTDIR\de-DE"
    File "${APP}\de-DE\NeoTransmission.resources.dll"
  SectionEnd
  
  Section /o "Hungarian" SecLanguagesHungarian
    CreateDirectory "$INSTDIR\hu-HU"
    SetOutPath "$INSTDIR\hu-HU"
    File "${APP}\hu-HU\NeoTransmission.resources.dll"
  SectionEnd
  
  Section /o "Korean" SecLanguagesKorean
    CreateDirectory "$INSTDIR\ko-KR"
    SetOutPath "$INSTDIR\ko-KR"
    File "${APP}\ko-KR\NeoTransmission.resources.dll"
  SectionEnd
  
  Section /o "Polish" SecLanguagesPolish
    CreateDirectory "$INSTDIR\pl-PL"
    SetOutPath "$INSTDIR\pl-PL"
    File "${APP}\pl-PL\NeoTransmission.resources.dll"
  SectionEnd
  
  Section /o "Russian" SecLanguagesRussian
    CreateDirectory "$INSTDIR\ru-RU"
    SetOutPath "$INSTDIR\ru-RU"
    File "${APP}\ru-RU\NeoTransmission.resources.dll"
  SectionEnd
  
  Section /o "Spanish" SecLanguagesSpanish
    CreateDirectory "$INSTDIR\es-ES"
    SetOutPath "$INSTDIR\es-ES"
    File "${APP}\es-ES\NeoTransmission.resources.dll"
  SectionEnd
  
  Section /o "Taiwanese" SecLanguagesTaiwanese
    CreateDirectory "$INSTDIR\zh-TW"
    SetOutPath "$INSTDIR\zh-TW"
    File "${APP}\zh-TW\NeoTransmission.resources.dll"
  SectionEnd
  
  Section /o "Turkish" SecLanguagesTurkish
    CreateDirectory "$INSTDIR\tr-TR"
    SetOutPath "$INSTDIR\tr-TR"
    File "${APP}\tr-TR\NeoTransmission.resources.dll"
  SectionEnd

SectionGroupEnd

;--------------------------------

; Uninstaller

Section "Uninstall"

!ifndef PORTABLE
  ; Unregister File Association
  ${unregisterExtension} ".torrent" "Transmission Remote Torrent"
  ${unregisterProtocol} "magnet" "Magnet URI"
  
  ; Remove registry keys
  DeleteRegKey HKLM SOFTWARE\TransmissionRemote
!endif

  ; Remove files and uninstaller
  Delete "$INSTDIR\NeoTransmission.exe"
  Delete "$INSTDIR\Raccoom.Xml.dll"
  Delete "$INSTDIR\Microsoft.WindowsAPICodePack.dll"
  Delete "$INSTDIR\Microsoft.WindowsAPICodePack.Shell.dll"
  Delete "$INSTDIR\NeoTransmission.exe.config"
  Delete "$INSTDIR\Jayrock.dll"
  Delete "$INSTDIR\Jayrock.Json.dll"
  Delete "$INSTDIR\uninstall.exe"
  Delete "$INSTDIR\GeoIP.dat"
  Delete "$INSTDIR\Readme.md"
  Delete "$INSTDIR\LICENSE"
  Delete "$INSTDIR\cs-CZ\NeoTransmission.resources.dll"
  Delete "$INSTDIR\da-DK\NeoTransmission.resources.dll"
  Delete "$INSTDIR\de-DE\NeoTransmission.resources.dll"
  Delete "$INSTDIR\es-ES\NeoTransmission.resources.dll"
  Delete "$INSTDIR\fr-FR\NeoTransmission.resources.dll"
  Delete "$INSTDIR\hu-HU\NeoTransmission.resources.dll"
  Delete "$INSTDIR\ko-KR\NeoTransmission.resources.dll"
  Delete "$INSTDIR\nl-NL\NeoTransmission.resources.dll"
  Delete "$INSTDIR\pl-PL\NeoTransmission.resources.dll"
  Delete "$INSTDIR\pt-BR\NeoTransmission.resources.dll"
  Delete "$INSTDIR\ru-RU\NeoTransmission.resources.dll"
  Delete "$INSTDIR\tr-TR\NeoTransmission.resources.dll"
  Delete "$INSTDIR\zh-CN\NeoTransmission.resources.dll"
  Delete "$INSTDIR\zh-TW\NeoTransmission.resources.dll"

  ; Remove shortcuts, if any
  !insertmacro MUI_STARTMENU_GETFOLDER Application $StartMenuFolder
  SetShellVarContext current
  Delete "$SMPROGRAMS\$StartMenuFolder\*.*"
  RMDir "$SMPROGRAMS\$StartMenuFolder"
!ifndef PORTABLE
  SetShellVarContext all
  Delete "$SMPROGRAMS\$StartMenuFolder\*.*"
  RMDir "$SMPROGRAMS\$StartMenuFolder"
!endif

  ; Remove directories used
  RMDir "$INSTDIR\cs-CZ"
  RMDir "$INSTDIR\da-DK"
  RMDir "$INSTDIR\de-DE"
  RMDir "$INSTDIR\es-ES"
  RMDir "$INSTDIR\fr-FR"
  RMDir "$INSTDIR\hu-HU"
  RMDir "$INSTDIR\ko-KR"
  RMDir "$INSTDIR\nl-NL"
  RMDir "$INSTDIR\pl-PL"
  RMDir "$INSTDIR\pt-BR"
  RMDir "$INSTDIR\ru-RU"
  RMDir "$INSTDIR\tr-TR"
  RMDir "$INSTDIR\zh-CN"
  RMDir "$INSTDIR\zh-TW"
  RMDir "$INSTDIR"

  DeleteRegKey /ifempty HKCU "Software\TransmissionRemote"
!ifndef PORTABLE
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Transmission Remote"
!endif

SectionEnd

!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${SecTransmissionRemote} $(DESC_SecTransmissionRemote)
  !insertmacro MUI_DESCRIPTION_TEXT ${SecDesktopIcon} $(DESC_SecDesktopIcon)
!ifndef PORTABLE
  !insertmacro MUI_DESCRIPTION_TEXT ${SecFiletypeAssociations} $(DESC_SecFiletypeAssociations)
!endif
  !insertmacro MUI_DESCRIPTION_TEXT ${SecGeoIPDatabase} $(DESC_SecGeoIPDatabase)
  !insertmacro MUI_DESCRIPTION_TEXT ${SecLanguages} $(DESC_SecLanguages)
!ifndef PORTABLE
  !insertmacro MUI_DESCRIPTION_TEXT ${SecRegiterTorrent} $(DESC_SecRegiterTorrent)
  !insertmacro MUI_DESCRIPTION_TEXT ${SecRegiterMagnet} $(DESC_SecRegiterMagnet)
!endif
!insertmacro MUI_FUNCTION_DESCRIPTION_END

Function .onInit
  System::Call 'kernel32::CreateMutexA(i 0, i 0, t "Transmission Remote") ?e'
  Pop $R0
  StrCmp $R0 0 +3
    MessageBox MB_OK|MB_ICONEXCLAMATION "The installer is already running."
    Abort

  !insertmacro MUI_LANGDLL_DISPLAY
!ifdef PORTABLE
  StrCpy $INSTDIR "\${ProgramFilesDir}"
!else
  ${If} ${RunningX64}
      StrCpy $INSTDIR "$PROGRAMFILES64\${ProgramFilesDir}"
  ${Else}
      StrCpy $INSTDIR "$PROGRAMFILES\${ProgramFilesDir}"
  ${Endif}
!endif
FunctionEnd
