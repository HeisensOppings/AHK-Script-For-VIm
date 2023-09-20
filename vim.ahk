#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#MaxThreadsPerHotkey 2
Toggle = 0
B::
    Toggle := !Toggle
    If Toggle
        Send, {LButton Down}
    else
        Send, {LButton Up}
    #NoTrayIcon
    SetCapsLockState, AlwaysOff
    Suspend, On
    ;Command mode
CapsLock::
    Suspend, Off
    commandkey = %A_ThisHotkey%
    CoordMode, ToolTip, Screen
    ToolTip, Command mode, 0, 1050
    Keywait, %commandkey%
    if A_ThisHotkey <> %commandkey%
    {
        Gosub Typingmode
    }
return

TypingMode:
    ToolTip
    Suspend, On
return

q::Escape
w::Send, ^{W}
e::^+Tab
r::^Tab
t::Tab
Y::Send, ^{y}
u::PgUp
i::Gosub TypingMode
o::Send, {End}{Enter}{i}
p::BackSpace

a::Alt
s::Ctrl
d::Shift
F::Send, ^{d}
G::Click, 2
h::Left
j::Down
k::Up
l::Right

Z::Send, ^{z}
X::Send, ^{x}
C::Send, ^{c}
V::Send, ^{v}
B::RButton
n::PgDn
m::Delete
,::Home
.::End
/::Send, ^{/}

::;::
    SendInput, {End}();
    SendInput, {Left}{Left}
return

;----vulume control by wheel
#If MouseIsOver("ahk_class Shell_TrayWnd")
    WheelUp::Send {Volume_Up}
WheelDown::Send {Volume_Down}

MouseIsOver(WinTitle) {
    MouseGetPos,,, Win
return WinExist(WinTitle . " ahk_id " . Win)
}
