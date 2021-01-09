; This is a collection of macros designed for Minecraft.
; Not everything is polished enough to work 100% of the time.
; If a macro listed in this program stops working, restart the program.
; Currently, these macros will be interrupted if you press other keys while they are running.
; If this occurs, press the keybind to start the macro again. (This commonly occurs with the Left and Right Mouse Button spammers while pressing the WASD Keys)
; Author: Hectoris919

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance, force
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetBatchLines, -1
SetKeyDelay, 0
Process, Priority,, High

Gui, New, AlwaysOnTop, Macros

Gui, Add, CheckBox, xm vLMBSpam gConfirmValues xm, Alt + LMB spams LMB
Gui, Add, CheckBox, vRMBSpam gConfirmValues, Alt + RMB spams RMB

Gui, Add, CheckBox, vSpaceSpam gConfirmValues, Ctrl + X spams the Space bar



Gui, Add, CheckBox, vSpamPrecise gEnable section, Alt + V spams RMB
Gui, Add, Edit, vSpamAmount ys
Gui, Add, UpDown, Range1-1000000 0x80, 1000
Gui, Add, Text, ys, times



Gui, Add, CheckBox, vQuickReplace gConfirmValues xs, Alt + R quickly clicks the left and right mouse`nbutton to replace blocks in creative minecraft

Gui, Add, Button, gGuiClose xm, Stop macro and Close
GuiControl, Disable, SpamAmount
Gui, Show
Return



GuiClose:
Gui, Destroy
ExitApp



Enable:
GuiControlGet, OutputVar,, SpamPrecise
GuiControl,  % (OutputVar) ? "Enable" : "Disable" , SpamAmount
Gosub, ConfirmValues
Return



ConfirmValues:
Gui, Submit
Gui, Show
Return



*!LButton::
; Thread, Interrupt, 0
Loop {
	If (LMBSpam == 1) {
		If (GetKeyState("Alt","P") and GetKeyState("LButton","P")) {
			SendInput, {Click, Down, Left}{Click, Up, Left}
		}
	}
	Else {
		break
	}
}
Return

*!RButton::
; Thread, Interrupt, 0
Loop {
	If (RMBSpam == 1) {
		If (GetKeyState("Alt","P") and GetKeyState("RButton","P")) {
			SendInput, {Click, Down, Right}{Click, Up, Right}
		}
	}
	Else {
		break
	}
}
Return

^x::
; Thread, Interrupt, 0
Loop {
	If (SpaceSpam == 1) {
		If (GetKeyState("Control","P") and GetKeyState("x","P")) {
			SendInput, {Blind}{Space Down}
			Sleep, 1
			SendInput, {Blind}{Space Up}
			Sleep, 1
		}
	}
	Else {
		break
	}
}
Return



!r::
; Thread, Interrupt, 0
If (GetKeyState("Alt","P") and GetKeyState("r","P") and QuickReplace == 1) {
	SendInput, {Click, Down, Left}{Click, Up, Left}{Click, Down, Right}{Click, Up, Right}
}
Return


!v::
; Thread, Interrupt, 0
If (SpamPrecise == 1){
	Loop %SpamAmount% {
		SendInput, {Click, Down, Right}{Click, Up, Right}
	}
}
Return
