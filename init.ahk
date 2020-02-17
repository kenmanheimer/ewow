;; Ewow repository: https://github.com/kenmanheimer/ewow (and from there find main one)
;; Autohotkey docs: https://www.autohotkey.com/docs/

;; load libraries
;; --------------

;; #Include lib_autopair.ahk

;; customize variables
;; -------------------

ignored_frames = %ignored_frames%,vcxsrv/x X rl,ConsoleWindowClass

#If !dummy                                           ;; Everywhere:

^#c:: WinActivate, ahk_exe chrome.exe
^#e:: WinActivate, emacs@
^#i:: WinActivate, iTunes
^#f:: WinActivate, ahk_class CabinetWClass   ;; Explorer (.. Explorer.exe goes to task bar)
^#n:: WinActivate, ahk_exe notion.exe
^#s:: WinActivate, Skype
^#t:: WinActivate, ahk_exe WindowsTerminal.exe

^+#r::                          ;; Reload:
MsgBox, 0, Reloading..., Reloading., .5
;;Progress, 100, fluff, Reloading
;;Sleep, 500
Reload
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

^!v:: scroll_up()
^+v:: scroll_down()

+^x:: set_cx_command()

#If !dummy && !ignored_frame() && cx                 ;; Ctrl-x

x:: ignore()
g:: keyboard_quit()
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
