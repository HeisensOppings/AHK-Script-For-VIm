#Hotstring
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#MaxThreadsPerHotkey 2
#NoTrayIcon
SetCapsLockState, AlwaysOff
Suspend, On  ; start as normal mode

CapsLock::
    Suspend, Permit  ; allow Suspend to switch
    if (A_IsSuspended) {
        Suspend, Off
        ToolTip, Command mode, 0, 1050
    } else {
        Suspend, On
        ToolTip
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
G::Click, WheelUp
h::Left
j::Down
k::Up
l::Right

Z::Send, ^{z}
X::Send, ^{x}
C::Send, ^{c}
V::Send, ^{v}
B::Click, WheelDown
n::PgDn
m::Delete
,::Home
.::End
/::Send, ^{/}
`;::Click, 1

;----vulume control by wheel
#If MouseIsOver("ahk_class Shell_TrayWnd")
    WheelUp::Send {Volume_Up}
WheelDown::Send {Volume_Down}

MouseIsOver(WinTitle) {
    MouseGetPos,,, Win
return WinExist(WinTitle . " ahk_id " . Win)
}
