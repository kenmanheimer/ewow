;; Ewow repository: https://github.com/kenmanheimer/ewow (and from there find main one)
;; Autohotkey docs: https://www.autohotkey.com/docs/

;; RAIL_WINDOW class: X frames under WSLg
;; CASCADIA_HOSTING_WINDOW_CLASS: WindowsTerminal
ignored_frames = %ignored_frames%,vcxsrv/x X rl,ConsoleWindowClass,ahk_class ZPContentViewWndClass,RAIL_WINDOW,CASCADIA_HOSTING_WINDOW_CLASS

;; load libraries
;; --------------

#Include altchars.ahk

;; customize variables
;; -------------------

#If !dummy                                           ;; Everywhere:

RAlt::RWin  ;; Makes the right Alt key become the Right Windows key

;; See https://www.autohotkey.com/docs/misc/WinTitle.htm and WinActivate.htm

+^#c:: WinActivateBottom, ahk_exe chrome.exe
+^#e:: WinActivateBottom, ahk_exe msedge.exe
+^#i:: WinActivate, iTunes
  ;; Explorer (.. Explorer.exe goes to task bar)
+^#f:: WinActivateBottom, ahk_class CabinetWClass
+^#n:: WinActivateBottom, ahk_exe notion.exe
+^#p:: WinActivateBottom, ahk_exe notepad++.exe
+^#s:: WinActivate, Skype
+^#t:: WinActivateBottom, ahk_exe WindowsTerminal.exe
+^#u:: WinActivateBottom, ahk_class PuTTY
  ;; Alternate between all X clients:
+^#x:: WinActivateBottom, ahk_class RAIL_WINDOW
+^#z:: WinActivate, ahk_class ZPContentViewWndClass  ;; Zoom view window

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

^b:: backward_char()
+^b:: backward_word()
+!^b:: send("^b")                 ;; (Also see +^X^b below, for Notion.)
^f:: forward_char()
+^f:: forward_word()
+!^f:: send("^f")
+^s:: send("^f")                  ;; For Notion windows, where !meta + ^ctl doesn't work

^d:: delete_char()
+^d:: send("^d")
^k:: kill_line()
+^k:: send("^k")
+!^k:: send("+^k")

^e:: move_end_of_line()
+^e:: send("^e")
^a:: move_beginning_of_line()
+^a:: send("^a")
+!^a:: send("+^a")
^n:: next_line()
^+n:: send("^n")
!^+n:: send("+^n")
^p:: previous_line()
^+p:: send("^p")
^!+p:: send("+^p")

^space:: set_mark_command()
^g:: keyboard_quit()
+^g:: send("^g")

;; I don't use these much, there are good alternatives, and ^!v is valuable as is (paste verbatim.)
;;^!v:: scroll_up()
;;^+v:: scroll_down()

+^x:: set_cx_command()

;;;;;;;;;;;;;;;;;;;;; CTRL-X ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#If !dummy && !ignored_frame() && cx                 ;; Ctrl-x

^g:: reset_cx()               ; Cancel ctrl-x

':: set_accent_modifier("'")       ; single quote = acute
`:: set_accent_modifier("`")       ; backquote = grave
+`;:: set_accent_modifier(":")       ; pipe = umlaut (would prefer ":")
^:: set_accent_modifier("^")       ; hat = circumflex
~:: set_accent_modifier("~")       ; tilde
,:: set_accent_modifier(",")       ; comma = cedilla
-:: command_simple("{U+2013}", 1, 1)     ; en-dash
+-:: command_simple("{U+2014}", 1, 1)    ; em-dash
0:: command_simple("{U+00B0}", 1, 1)    ; degree
c:: command_simple("{U+00A2}", 1, 1)    ; cents
$:: command_simple("{U+20AC}", 1, 1)    ; Euro
\:: command_simple("{U+2713}", 1, 1)    ; checkmark

;; ;; FRACTION SLASH makes all fractions but the fractions are expanded in many contexts.
/:: send_accented("{U+2044}")       ; FRACTION SLASH - use between numerator and denomintor

1:: set_accent_modifier("1")       ; numerator = 1
2:: set_accent_modifier("2")       ; numerator = 2
3:: set_accent_modifier("3")       ; numerator = 3

h:: mark_whole_buffer()
l:: goto_line()                 ; (prompt if no prefix)
o:: next_window()               ; other-window
+o:: previous_window()        ; previous-buffer
q:: query_replace()          ; query-replace-regexp
<:: beginning_of_buffer()
>:: end_of_buffer()

^b::                         ; Another way to send ctrl-b, eg particularly in Notion:
command_simple("^b", 0, 1)   ; "changes" is 0 for consistency with effect of eg ^i.

;;(:: kmacro_start_macro()
;;):: kmacro_end_macro()
;;e:: kmacro_end_or_call_macro()


#If !dummy && !ignored_frame() && !cx
