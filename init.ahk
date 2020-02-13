;; load libraries
;; --------------

;; #Include lib_evil.ahk
;; #Include lib_autopair.ahk

;; customize variables
;; -------------------

;; 2020-02-13 klm: Exempt emacs sent to vcxsrv. (Similar to but different from setting in fundamental.ahk.)
ignored_frames = %ignored_frames%,vcxsrv/x X rl,ConsoleWindowClass

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
^g:: keyboard_quit()

^+v:: scroll_up()
^!v:: scroll_down()

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
