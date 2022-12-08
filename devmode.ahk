#Requires AutoHotkey v2.0-beta
; #NoTrayIcon
Persistent Persist := true
;SetWorkingDir %A_ScriptDir%
;RunAsTask()
clamLight := "clamLight.png"
clamDark := "clamDark.png"
tabLight := "tabLight.png"
tabDark := "tabDark.png"
PID := "Eve.TapToClick.exe"
class About {
    Link() {
        Run "https://github.com/TheOkayJK?tab=repositories"
    }
}
;taskMenu := A_TrayMenu
aboutMenu := About
;taskMenu.Delete
;taskMenu.Add("Exit", ExitApp)
;taskMenu.Add("About" aboutMenu.Link())

Loop
{
    string process := ProcessExist(PID)
    deviceMode := SysGet(0x2003)
    ; appThemeMode := RegRead("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize", AppsUseLightTheme) i only care about system because that affects the taskbar where the icon is.
    sysThemeMode := RegRead("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize", "SystemUsesLightTheme")
    mouseDetected := RegRead("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\mouhid\Enum", "Count")
    if (mouseDetected > 2) {
        if (sysThemeMode == 1) {
            ; light mode is enabled so assign proper icons
            if (process !== 0 && deviceMode == 0) {
                ; running and in tablet mode means close taptoclick
                TraySetIcon(tabLight)
                ;MsgBox process " also " deviceMode
                ProcessClose(PID)
            } else if (process !== 0 && deviceMode == 1) {
                TraySetIcon(clamLight)
                ProcessClose(PID)
                ; running and in clamshell mode means no action needed, restart loop
                ; MsgBox process " also " deviceMode
            } else if (process == 0 && deviceMode == 1) {
                TraySetIcon(clamLight)
                ; not running and in clamshell mode means start taptoclick
                ; MsgBox process " also " deviceMode
            } else if (process == 0 && deviceMode == 0) {
                TraySetIcon(tabLight)
                ; not running and in tablet mode means no action needed, restart loop
                ; MsgBox process " also " deviceMode
            } else {
                aboutMenu.Link()
                MsgBox "error encountered! AAAAAA"
                break
            }
        } else if (sysThemeMode == 0) {
            ; dark mode is enabled so assign proper icons
            if (process !== 0 && deviceMode == 0) {
                TraySetIcon(tabDark)
                ; running and in tablet mode means close taptoclick
                ;MsgBox process " also " deviceMode
                ProcessClose(PID)
            } else if (process !== 0 && deviceMode == 1) {
                TraySetIcon(clamDark)
                ; running and in clamshell mode means no action needed, restart loop
                ; MsgBox process " also " deviceMode
                ProcessClose(PID)
            } else if (process == 0 && deviceMode == 1) {
                TraySetIcon(clamDark)
                ; not running and in clamshell mode means start taptoclick
                ; MsgBox process " also " deviceMode
            } else if (process == 0 && deviceMode == 0) {
                TraySetIcon(tabDark)
                ; not running and in tablet mode means no action needed, restart loop
                ; MsgBox process " also " deviceMode
            } else {
                aboutMenu.Link()
                MsgBox "error encountered! AAAAAA"
                break
            }
        } else {
            ;default to light mode
            if (process !== 0 && deviceMode == 0) {
                ; running and in tablet mode means close taptoclick
                TraySetIcon(tabLight)
                ;MsgBox process " also " deviceMode
                ProcessClose(PID)
            } else if (process !== 0 && deviceMode == 1) {
                TraySetIcon(clamLight)
                ; running and in clamshell mode means no action needed, restart loop
                ; MsgBox process " also " deviceMode
                ProcessClose(PID)
            } else if (process == 0 && deviceMode == 1) {
                TraySetIcon(clamLight)
                ; not running and in clamshell mode means start taptoclick
                ; MsgBox process " also " deviceMode
            } else if (process == 0 && deviceMode == 0) {
                TraySetIcon(tabLight)
                ; not running and in tablet mode means no action needed, restart loop
                ; MsgBox process " also " deviceMode
            } else {
                aboutMenu.Link()
                MsgBox "error encountered! AAAAAA"
                break
            }
        }
    } else {
        if (sysThemeMode == 1) {
            ; light mode is enabled so assign proper icons
            if (process !== 0 && deviceMode == 0) {
                ; running and in tablet mode means close taptoclick
                TraySetIcon(tabLight)
                ;MsgBox process " also " deviceMode
                ProcessClose(PID)
            } else if (process !== 0 && deviceMode == 1) {
                TraySetIcon(clamLight)
                ; running and in clamshell mode means no action needed, restart loop
                ; MsgBox process " also " deviceMode
            } else if (process == 0 && deviceMode == 1) {
                TraySetIcon(clamLight)
                ; not running and in clamshell mode means start taptoclick
                ; MsgBox process " also " deviceMode
                Run("Eve.TapToClick.exe", , "Min")
            } else if (process == 0 && deviceMode == 0) {
                TraySetIcon(tabLight)
                ; not running and in tablet mode means no action needed, restart loop
                ; MsgBox process " also " deviceMode
            } else {
                aboutMenu.Link()
                MsgBox "error encountered! AAAAAA"
                break
            }
        } else if (sysThemeMode == 0) {
            ; dark mode is enabled so assign proper icons
            if (process !== 0 && deviceMode == 0) {
                TraySetIcon(tabDark)
                ; running and in tablet mode means close taptoclick
                ;MsgBox process " also " deviceMode
                ProcessClose(PID)
            } else if (process !== 0 && deviceMode == 1) {
                TraySetIcon(clamDark)
                ; running and in clamshell mode means no action needed, restart loop
                ; MsgBox process " also " deviceMode
            } else if (process == 0 && deviceMode == 1) {
                TraySetIcon(clamDark)
                ; not running and in clamshell mode means start taptoclick
                ; MsgBox process " also " deviceMode
                Run("Eve.TapToClick.exe", , "Min")
            } else if (process == 0 && deviceMode == 0) {
                TraySetIcon(tabDark)
                ; not running and in tablet mode means no action needed, restart loop
                ; MsgBox process " also " deviceMode
            } else {
                aboutMenu.Link()
                MsgBox "error encountered! AAAAAA"
                break
            }
        } else {
            ;default to light mode
            if (process !== 0 && deviceMode == 0) {
                ; running and in tablet mode means close taptoclick
                TraySetIcon(tabLight)
                ;MsgBox process " also " deviceMode
                ProcessClose(PID)
            } else if (process !== 0 && deviceMode == 1) {
                TraySetIcon(clamLight)
                ; running and in clamshell mode means no action needed, restart loop
                ; MsgBox process " also " deviceMode
            } else if (process == 0 && deviceMode == 1) {
                TraySetIcon(clamLight)
                ; not running and in clamshell mode means start taptoclick
                ; MsgBox process " also " deviceMode
                Run("Eve.TapToClick.exe", , "Min")
            } else if (process == 0 && deviceMode == 0) {
                TraySetIcon(tabLight)
                ; not running and in tablet mode means no action needed, restart loop
                ; MsgBox process " also " deviceMode
            } else {
                aboutMenu.Link()
                MsgBox "error encountered! AAAAAA"
                break
            }
        }
    }
        Sleep(5000)
}