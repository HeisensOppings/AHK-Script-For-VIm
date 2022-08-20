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

e::^Right
w::^left
d::Send, ^{d}
q::Escape
; Esc::Gosub TypingMode
i::Gosub TypingMode
t::Tab
m::Delete
p::BackSpace
a::Ctrl
s::Alt
o::Send, {End}{Enter}{i}
h::Left
n::PgDn
u::^Left
j::Down
k::Up
l::Right
,::Home
.::End
Y::Send, ^{y}
Z::Send, ^{z}
X::Send, ^{x}
C::Send, ^{c}
V::Send, ^{v}
/::Send, ^{/}
R::Send, {WheelUp 3}
F::Send, {WheelDown 3}
`;::Ctrl        
'::Alt

a & q::Send, #q         
a & p::Send, ^{BackSpace}
a & w::Send, ^{w}
a & f::Send, ^{f}
a & e::Send, ^{e}
a & m::Send, ^{Delete}
a & g::Send, ^{g} ;go to line:
a & r::Send, ^{r} ;reload window
a & b::Send, ^{b} ;side bar visility
a & j::
    Loop, 8{
        Send, {Down}
    }
Return
a & k::
    Loop, 8{
        Send, {Up}
    }
Return
a & h::
    Loop, 8{
        Send, {Left}
    }
Return
a & l::
    Loop, 8{
        Send, {Right}
    }
Return
G::Click, 2
B::RButton

1::Send, +1
2::Send, +2
3::Send, +3
4::Send, +4
5::Send, +5
6::Send, +6
7::Send, +7
8::Send, +8
9::Send, +9
0::Send, +0
-::Send, +-
=::Send, +=

;----vulume control by wheel
#If MouseIsOver("ahk_class Shell_TrayWnd")
WheelUp::Send {Volume_Up}
WheelDown::Send {Volume_Down}

MouseIsOver(WinTitle) {
    MouseGetPos,,, Win
    return WinExist(WinTitle . " ahk_id " . Win)
}
