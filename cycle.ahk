;; Cycle between windows in the same application.
;; From https://autohotkey.com/board/topic/116659-switch-between-unminimized-windows-of-the-same-application/

;; Alas this implementation doesn't work with Groupy-gathered windows.

#If !dummy

#`:: ; Next window
WinGetClass, ActiveClass, A
WinSet, Bottom,, A
WinActivate, ahk_class %ActiveClass%
return

+#`:: ; Previous window
WinGetClass, ActiveClass, A
WinActivateBottom, ahk_class %ActiveClass%
return
