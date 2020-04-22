;; Ewow repository: https://github.com/kenmanheimer/ewow (and from there find main one)
;; Autohotkey docs: https://www.autohotkey.com/docs/

ignored_frames = %ignored_frames%,vcxsrv/x X rl,ConsoleWindowClass

;; load libraries
;; --------------

#Include altchars.ahk

;; customize variables
;; -------------------

#If !dummy                                           ;; Everywhere:

RAlt::RWin  ;; Makes the right Alt key become the Right Windows key

^#c:: WinActivate, ahk_exe chrome.exe
^#e:: WinActivate, emacs@
^#i:: WinActivate, iTunes
^#f:: WinActivate, ahk_class CabinetWClass   ;; Explorer (.. Explorer.exe goes to task bar)
^#n:: WinActivate, ahk_exe notion.exe
^#s:: WinActivate, Skype
^#t:: WinActivate, ahk_exe WindowsTerminal.exe

^+#r::                          ;; Reload:
MsgBox, 0, Reloading..., Reloading., .5
Reload
;;Progress, 100, fluff, Reloading
;;Sleep, 500
return
^+#s::
run, C:\ProgramData\Microsoft\Windows\Start Menu\Programs\AutoHotkey\Window Spy.lnk
return

#Include cycle.ahk

#If !dummy && !ignored_frame() && !cx                ;; Regular

^b:: backward_char()
+^b:: backward_word()
+!^b:: Send, ^b                 ;; (Also see +^X^b, for Notion.)
^f:: forward_char()
+^f:: forward_word()
+!^f:: Send, ^f
+^s:: Send, ^f                  ;; For Notion windows, where !meta+^ctl doesn't work

^d:: delete_char()
+^d:: Send, ^d
^k:: kill_line()
+^k:: Send, ^k
+!^k:: Send, +^k

^e:: move_end_of_line()
+^e:: Send, ^e
^a:: move_beginning_of_line()
+^a:: Send, ^a
+!^a:: Send, +^a
^n:: next_line()
^+n:: Send, ^n
!^+n:: Send, +^n
^p:: previous_line()
^+p:: Send, ^p
^!+p:: Send, +^p

^space:: set_mark_command()
^g:: keyboard_quit()
+^g:: Send, ^g

;; I don't use these much, there are good alternatives, and ^!v is valuable as is (paste verbatim.)
;;^!v:: scroll_up()
;;^+v:: scroll_down()

+^x:: set_cx_command()

#If !dummy && !ignored_frame() && cx                 ;; Ctrl-x

x:: ignore()                    ; Cancel ctrl-x
g:: keyboard_quit()

-:: command_simple("{U+2013}", 1, 1)     ; en-dash
+-:: command_simple("{U+2014}", 1, 1)    ; em-dash
h:: mark_whole_buffer()
l:: goto_line()                 ; (prompt if no prefix)
o:: next_window()               ; other-window
+o:: previous_window()        ; previous-buffer
q:: query_replace()          ; query-replace-regexp
<:: beginning_of_buffer()
>:: end_of_buffer()

^b:: Send, ^b

;;(:: kmacro_start_macro()
;;):: kmacro_end_macro()
;;e:: kmacro_end_or_call_macro()


#If !dummy && !ignored_frame() && !cx
