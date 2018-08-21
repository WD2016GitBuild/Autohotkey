!i::Send {PgUp}
!m::Send {PgDn}

!;:: Send {Home}
!':: Send {End}

!h:: Send {left}
!j:: Send {down}
!k:: Send {up}
!l:: Send {right}

!d::Send {Backspace} 
!f::Send {Delete}

!1::send, {lctrl down}{lwin down}{left down}{left up}{lctrl up}{lwin up}
!2::send, {lctrl down}{lwin down}{right down}{right up}{lctrl up}{lwin up}

!w::WinMinimize, A  ;最小化活动窗口。

;记事本
#n::Run Notepad

;浏览器打开百度首页
#b::Run http://www.baidu.com

Alt & CapsLock::SendInput, {Enter}

Alt & 4::SendInput, {Alt Down}{F4}

;PS
#IfWinActive, ahk_class Photoshop
;PS导出JPG文件
!e::
send, {lctrl down}{lalt down}{lshift down}{' down}{' up}{lshift up}{lalt up}{lctrl up}
return

;PS导出PNG文件
!r::
send, {lctrl down}{lshift down}{' down}{' up}{lshift up}{lctrl up}
return

F1::
send, {lctrl down}{lalt down}{y down}{y up}{lalt up}{lctrl up}
return

F2::
send, {lctrl down}{lalt down}{h down}{h up}{lalt up}{lctrl up}
return

#IfWinActive

;chrome
;针对Chrome浏览器改键 F1替换F12
#IfWinActive, ahk_class Chrome_WidgetWin_1
F1::send {F12}
F2::send {F12}
F3::send {F12}
F4::send {F12}

;back
Alt & z::SendInput, {Alt Down}{Left}

#IfWinActive

;资源管理器
#IfWinActive, ahk_class CabinetWClass
^d::
send {BackSpace}
return
#IfWinActive


MouseIsOver(WinTitle) {
    MouseGetPos,,, Win
    return WinExist(WinTitle . " ahk_id " . Win)
}

#If MouseIsOver("ahk_class Shell_TrayWnd")
WheelUp::Send {Volume_Up}
WheelDown::Send {Volume_Down}
#If

Lshift & wheelup::Volume_Up
Lshift & WheelDown::Volume_Down

^!j::
WinGetActiveTitle, title
WinGetClass, outclassid, %title%
MsgBox %outclassid%
return


