!macro customInstall
  DeleteRegKey HKCR "appyire"
  WriteRegStr HKCR "appyire" "" "URL:appyire"
  WriteRegStr HKCR "appyire" "URL Protocol" ""
  WriteRegStr HKCR "appyire\shell" "" ""
  WriteRegStr HKCR "appyire\shell\Open" "" ""
  WriteRegStr HKCR "appyire\shell\Open\command" "" "$INSTDIR\{APP_EXECUTABLE_FILENAME} %1"
!macroend

!macro customUnInstall
  DeleteRegKey HKCR "appyire"
!macroend

# Fix Can not find Squairrel error
# https://github.com/electron-userland/electron-builder/issues/837#issuecomment-355698368
!macro customInit
  nsExec::Exec '"$LOCALAPPDATA\Yire\Update.exe" --uninstall -s'
!macroend
