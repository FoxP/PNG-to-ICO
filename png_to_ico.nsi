# define installer name
OutFile "png_to_ico_setup.exe"

# set %AppData% as install directory
InstallDir $APPDATA\PNG-to-ICO\

# default section start
Section

# define output path
SetOutPath $INSTDIR

# specify files to go in output path
File png_to_ico.bat
# specify folders to go in output path
File /r ImageMagick

# registry keys and values
# add "PNG to ICO" entry to directory right-clic menu
WriteRegStr HKCR "Directory\shell\PNG-to-ICO" '' '&PNG to ICO'
WriteRegStr HKCR "Directory\shell\PNG-to-ICO" 'Icon' '$SYSDIR\shell32.dll,238'
WriteRegStr HKCR "Directory\shell\PNG-to-ICO\command" '' '"$INSTDIR\png_to_ico.bat" "%1"'
# add "PNG to ICO" entry to image right-clic menu
WriteRegStr HKCR "SystemFileAssociations\image\shell\PNG-to-ICO" '' '&PNG to ICO'
WriteRegStr HKCR "SystemFileAssociations\image\shell\PNG-to-ICO" 'Icon' '$SYSDIR\shell32.dll,238'
WriteRegStr HKCR "SystemFileAssociations\image\shell\PNG-to-ICO\command" '' '"$INSTDIR\png_to_ico.bat" "%1"'
# add uninstall information to Add/Remove Programs
WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\PNG-to-ICO" "DisplayName" "PNG-to-ICO"
WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\PNG-to-ICO" "UninstallString" "$\"$INSTDIR\png_to_ico_uninstaller.exe$\""

# define uninstaller name
WriteUninstaller $INSTDIR\png_to_ico_uninstaller.exe

CreateDirectory $SMPROGRAMS\PNG-to-ICO
# create a shortcut named "Uninstall" in the start menu programs directory
# point the new shortcut at the uninstaller youtube-dl-not-a-gui_uninstaller.exe
CreateShortCut "$SMPROGRAMS\PNG-to-ICO\Uninstall.lnk" "$INSTDIR\png_to_ico_uninstaller.exe"

# default section end
SectionEnd

# create a section to define what the uninstaller does.
# the section will always be named "Uninstall"
Section "Uninstall"

# always delete uninstaller first
Delete $INSTDIR\png_to_ico_uninstaller.exe

# registry keys and values
# delete "PNG to ICO" entry from directory right-clic menu
DeleteRegKey HKCR "Directory\shell\PNG-to-ICO"
# delete "PNG to ICO" entry to image right-clic menu
DeleteRegKey HKCR "SystemFileAssociations\image\shell\PNG-to-ICO"
# remove uninstall information from Add/Remove Programs
DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\PNG-to-ICO"

# delete installed files
Delete $INSTDIR\png_to_ico.bat
# delete installed folders
RMDir /r $INSTDIR\ImageMagick
RMDir $INSTDIR
# now delete shortcuts
Delete $SMPROGRAMS\PNG-to-ICO\Uninstall.lnk
RMDir $SMPROGRAMS\PNG-to-ICO

SectionEnd