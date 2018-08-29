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

Alt & CapsLock::SendInput, {Enter}

Alt & 4::SendInput, {Alt Down}{F4}



; ColorPix
#IfWinExist, ColorPix
^!q::
WinActivate, ColorPix
;MsgBox "存在"
return
#IfWinExist

#IfWinNotExist, ColorPix
^!q::
;MsgBox "不存在"
run, "C:\Program Files\ColorPix\ColorPix.exe"
return
#IfWinNotExist




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

;Enter
;Ctrl & Right::SendInput, {Enter}

;F1改为图层快捷键
;F1::F7

F1::
send, {lctrl down}{lalt down}{y down}{y up}{lalt up}{lctrl up}
return

F2::
send, {lctrl down}{lalt down}{h down}{h up}{lalt up}{lctrl up}
return

^!d::
send, {lctrl down}{lalt down}{lshift down}{n down}{n up}{lshift up}{lalt up}{lctrl up}
return

;将大写锁定键改为Enter
;$CapsLock::Enter

;将LAlt+Capslock改为Capslock锁定
;LControl & Capslock::SetCapsLockState, % GetKeyState("CapsLock", "T") ? "Off" : "On"

;LWin::p
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

;SetCapsLockState , AlwaysOff
;CapsLock & h::SendInput {Left}
;CapsLock & j::SendInput {Down}
;CapsLock & k::SendInput {Up}
;CapsLock & l::SendInput {Right}
;CapsLock & a::SendInput {Home}
;CapsLock & e::SendInput {End}
;CapsLock & d::SendInput {Delete}
;Shift & CapsLock::SendInput, {Shift Down}{Blind}{Esc}{Shift Up}
;CapsLock::SendInput {Esc}
;Esc::CapsLock


^!j::
WinGetActiveTitle, title
WinGetClass, outclassid, %title%
MsgBox %outclassid%
return



;html制作快捷键
::h/a$::
send, <a href="#"></a>{left}{left}{left}{left}
return

::h/a/img$::
send, <a href="#"><img src="/images/wd/" /></a>{left}{left}{left}{left}{left}{left}{left}{left}
return

::h/div$::
send, <div></div>{left}{left}{left}{left}{left}{left}
return

::h/div.$::
send, <div class=""></div>{left}{left}{left}{left}{left}{left}{left}{left}
return

::h/div#$::
send, <div id=""></div>{left}{left}{left}{left}{left}{left}{left}{left}
return

::h/img$::
send, <img src="/images/wd/" />{left}{left}{left}{left}
return

::h/script$::
send, <script type="text/javascript">{Enter}{Space}{Space}{Space}{Space}$(function(){{}{Enter}{Space}{Space}{Space}{Space}{Space}{Space}{Space}{Space}{Enter}{Space}{Space}{Space}{Space}{}});{Enter}</script>
return

::h/zzsm$::
send, <!--由中企动力科技集团股份有限公司成都分公司技术部设计制作<br>如果您有任何意见或建议请电邮dm-chengdu@300.cn -->
return


;Windows 10 虚拟桌面自动切换
#Persistent
$ctrl::
if ctrl_presses > 0 ; SetTimer 已经启动，所以我们记录按键。
{
ctrl_presses += 1
return
}
;否则，这是新一系列按键的首次按键。将计数设为 1 并启动定时器：
ctrl_presses = 1
SetTimer, Keyctrl, 500 ;在 500 毫秒内等待更多的按键。
return
Keyctrl:
SetTimer, Keyctrl, off
if ctrl_presses = 1 ;该键已按过一次。
{
Gosub singleClick
}
else if ctrl_presses = 2 ;该键已按过两次。
{
Gosub doubleClick
}
else if ctrl_presses = 3
{
Gosub trebleClick
}
;不论上面哪个动作被触发，将计数复位以备下一系列的按键：
ctrl_presses = 0
return
singleClick:
send {ctrl}
return
doubleClick:
send #^{left}
return
trebleClick:
send #^{right}
return
;不论上面哪个动作被触发，将计数复位以备下一系列的按键：
SPACE_presses = 0
return
singleClick2:
send {SPACE}
return
doubleClick2:
send {enter}
return