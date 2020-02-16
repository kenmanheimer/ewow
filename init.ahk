;; Ewow repository: https://github.com/kenmanheimer/ewow (and from there find main one)
;; Autohotkey docs: https://www.autohotkey.com/docs/

;; load libraries
;; --------------

;; #Include lib_autopair.ahk

;; customize variables
;; -------------------

ignored_frames = %ignored_frames%,vcxsrv/x X rl,ConsoleWindowClass

#If !dummy && cx

#If !dummy
^#e:: WinActivate, emacs@
^#u:: WinActivate, Ubuntu
^#i:: WinActivate, iTunes
^#c:: WinActivate, ahk_exe chrome.exe
^#t:: MsgBox, 0, Yop, Hello, 1

^+#r::
MsgBox, 0, Reloading..., Reloading., .5
;;Progress, 100, fluff, Reloading
;;Sleep, 500
Reload
return

#If !dummy && !ignored_frame() && !cx

^!b:: backward_char()
^!f:: forward_char()
^+b:: backward_word()
^+f:: forward_word()

^+d:: delete_char()

^+e:: move_end_of_line()
^+a:: move_beginning_of_line()
^+n:: next_line()
^+p:: previous_line()

^space:: set_mark_command()

^!v:: scroll_up()
^+v:: scroll_down()

+^x:: set_cx_command()

#If !dummy && !ignored_frame() && cx
x:: ignore()
g:: keyboard_quit()
h:: mark_whole_buffer()
l:: goto_line()                 ; (prompt if no prefix)
o:: next_window()               ; other-window
+o:: previous_window()        ; previous-buffer
q:: query_replace()          ; query-replace-regexp
<:: beginning_of_buffer()
>:: end_of_buffer()

;;(:: kmacro_start_macro()
;;):: kmacro_end_macro()
;;e:: kmacro_end_or_call_macro()


#If !dummy && !ignored_frame() && !cx


;;;;;;;;;;;;;;;;

;; evil_auto_mode = 1

;; //////////// auto execution section ends here ////////////

;; keybinds for lib_autopair
;; -------------------------

;; #If !ignored_frame() && !cx
;; ,:: smart_colon()
;; [:: smart_bracket()
;; +9:: insert_parentheses()
;; +[:: smart_brace()
;; +':: smart_dquot()

;; keybinds for lib_evil
;; ---------------------

;; #If !ignored_frame() && !evil
;; escape:: evil_mode()

;; #If !dummy && !ignored_frame() && evil
;; bs:: self_send_command()
;; enter:: self_send_command()
;; space:: self_send_command()

;; #Include lib_evil_keys.ahk
