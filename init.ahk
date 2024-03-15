;; Ewow repository: https://github.com/kenmanheimer/ewow (and from there find main one)
;; Autohotkey docs: https://www.autohotkey.com/docs/

;; Modifiers key:
; ; Comment to end-of-line
; + Shift
; ^ Control
; ! Alt
; # Win (Windows logo key)
; &  An ampersand may be used between any two keys or mouse buttons to combine them into a custom hotkey.
; * - fires replacement immediately,
; O - removes default trigger character (ahk will be triggered with space)

;; RAIL_WINDOW class: X frames under WSLg
;; CASCADIA_HOSTING_WINDOW_CLASS: WindowsTerminal
ignored_frames = %ignored_frames%,vcxsrv/x X rl,ConsoleWindowClass,ahk_class ZPContentViewWndClass,RAIL_WINDOW,CASCADIA_HOSTING_WINDOW_CLASS

;; load libraries
;; --------------

;; customize variables
;; -------------------

#If !dummy                                           ;; Everywhere:

;;RAlt::RWin  ;; Makes the right Alt key become the Right Windows key

;; See https://www.autohotkey.com/docs/misc/WinTitle.htm and WinActivate.htm

+^#f:: WinActivateBottom, ahk_class CabinetWClass    ;; Windows Explorer
+^#x:: WinActivateBottom, ahk_class RAIL_WINDOW      ;; Among X/Wayland clients
+^#z:: WinActivate, ahk_class ZPContentViewWndClass  ;; Zoom view window


;;+^#c:: WinActivateBottom, ahk_exe chrome.exe
;;+^#e:: WinActivateBottom, ahk_exe msedge.exe
;;+^#i:: WinActivate, iTunes
  ;; Explorer (.. Explorer.exe goes to task bar)
;;+^#p:: WinActivateBottom, ahk_exe notepad++.exe
;;+^#s:: WinActivate, Skype
;;+^#t:: WinActivateBottom, ahk_exe WindowsTerminal.exe
;;+^#u:: WinActivateBottom, ahk_class PuTTY

^+#r::                          ;; Reload:
MsgBox, 0, Reloading..., Reloading., .5
Reload
;;Progress, 100, fluff, Reloading
;;Sleep, 500
return
^#s::
run, C:\ProgramData\Microsoft\Windows\Start Menu\Programs\AutoHotkey\Window Spy.lnk
return

#Include cycle.ahk

#If !dummy && !ignored_frame() && !cx                ;; Regular

;; *** Probably want Shift-^X <space>:
;; *** But ewow mark command for regions doesn't work with other navigation. )-:
;;^space:: set_mark_command()
;;^g:: keyboard_quit()
+!^g:: keyboard_quit()
;;+^g:: send("^g")

;; I don't use these much, there are good alternatives, and ^!v is valuable as is (paste verbatim.)
;;^!v:: scroll_up()
;;^+v:: scroll_down()

+^x:: set_cx_command()

;;;;;;;;;;;;;;;;;;;;; CTRL-X ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#If !dummy && !ignored_frame() && cx                 ;; Ctrl-x

+^g:: reset_cx()               ; Cancel ctrl-x

;; ;; FRACTION SLASH makes all fractions but the fractions are expanded in many contexts.
/:: send_accented("{U+2044}")       ; FRACTION SLASH - use between numerator and denomintor

-:: command_simple("{U+2013}", 1, 1)     ; en-dash
+-:: command_simple("{U+2014}", 1, 1)    ; em-dash
0:: command_simple("{U+00B0}", 1, 1)    ; degree
c:: command_simple("{U+00A2}", 1, 1)    ; cents
e:: command_simple("{U+0190}", 1, 1)    ; Latin epsilon: Ɛ (bigger than lower case epsilon)
$:: command_simple("{U+20AC}", 1, 1)    ; Euro
\:: command_simple("{U+2713}", 1, 1)    ; checkmark

1:: set_accent_modifier("1")       ; numerator = 1
2:: set_accent_modifier("2")       ; numerator = 2
3:: set_accent_modifier("3")       ; numerator = 3

h:: mark_whole_buffer()
l:: goto_line()                 ; (prompt if no prefix)
o:: next_window()               ; other-window
+o:: previous_window()        ; previous-buffer
q:: query_replace()          ; query-replace-regexp

;;^b::                         ; Another way to send ctrl-b, eg particularly in Notion:
;;command_simple("^b", 0, 1)   ; "changes" is 0 for consistency with effect of eg ^i.

;;(:: kmacro_start_macro()
;;):: kmacro_end_macro()
;;e:: kmacro_end_or_call_macro()


;;===========================================================================
;; OBSOLETE: Retaining for useful info:

;; Using native windows accents instead of these accent modifiers. klm 2023-09-09
; ':: set_accent_modifier("'")       ; single quote = acute
; `:: set_accent_modifier("`")       ; backquote = grave
; +`;:: set_accent_modifier(":")       ; pipe = umlaut (would prefer ":")
; ^:: set_accent_modifier("^")       ; hat = circumflex
; ~:: set_accent_modifier("~")       ; tilde
; ,:: set_accent_modifier(",")       ; comma = cedilla
