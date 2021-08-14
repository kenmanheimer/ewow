;; Adapted from https://raw.githubusercontent.com/q2apro/ahk_greekletters/master/greekletters.ahk

; CapsLock on activates altchars mode - plain and unshifted are greek chars;
; specific others added as deemed useful.
; Credits to Exaskryz: https://autohotkey.com/boards/viewtopic.php?f=5&t=25218

; Explanation of Signs
; # Win (Windows logo key)
; ! Alt
; ^ Control
; + Shift
; &  An ampersand may be used between any two keys or mouse buttons to combine them into a custom hotkey.
; * - fires replacement immediately, O - removes default trigger character (ahk will be triggered with space)

; AHK Docs
; https://gist.github.com/csharpforevermore/11348986
; https://autohotkey.com/docs/Hotkeys.htm
; https://autohotkey.com/docs/Hotstrings.htm

#If !dummy && !ignored_frame() && accent = "`"
;; grave:
{
    a::send_accented("{U+00E0}")
    +a::send_accented("{U+00C0}")
    e::send_accented("{U+00E8}")
    +e::send_accented("{U+00C8}")
    i::send_accented("{U+00EC}")
    +i::send_accented("{U+00CC}")
    o::send_accented("{U+00F2}")
    +o::send_accented("{U+00D2}")
    u::send_accented("{U+00F9}")
    +u::send_accented("{U+00D9}")
}

#If !dummy && !ignored_frame() && accent = "'"
;; acute:
{
    a::send_accented("{U+00E1}")
    +a::send_accented("{U+00C1}")
    e::send_accented("{U+00E9}")
    +e::send_accented("{U+00C9}")
    i::send_accented("{U+00ED}")
    +i::send_accented("{U+00CD}")
    o::send_accented("{U+00F3}")
    +o::send_accented("{U+00D3}")
    u::send_accented("{U+00FA}")
    +u::send_accented("{U+00DA}")
    y::send_accented("{U+00FD}")
    +y::send_accented("{U+00DD}")
}

#If !dummy && !ignored_frame() && accent = "^"
;; circumflex
{
    a::send_accented("{U+00E2}")
    +a::send_accented("{U+00C2}")
    e::send_accented("{U+00EA}")
    +e::send_accented("{U+00CA}")
    i::send_accented("{U+00EE}")
    +i::send_accented("{U+00CE}")
    o::send_accented("{U+00F4}")
    +o::send_accented("{U+00D4}")
    u::send_accented("{U+00FB}")
    +u::send_accented("{U+00DB}")
}

#If !dummy && !ignored_frame() && accent = "~"
;; tilde
{
    a::send_accented("{U+00E3}")
    +a::send_accented("{U+00C3}")
    ; no e-tilde, i-tilde
    o::send_accented("{U+00F5}")
    +o::send_accented("{U+00D5}")
    ; no u-tilde
}

#If !dummy && !ignored_frame() && accent = ":"
;; umlaut
{
    a::send_accented("{U+00E4}")
    +a::send_accented("{U+00C4}")
    e::send_accented("{U+00EB}")
    +e::send_accented("{U+00CB}")
    i::send_accented("{U+00EF}")
    +i::send_accented("{U+00CF}")
    o::send_accented("{U+00F6}")
    +o::send_accented("{U+00D6}")
    u::send_accented("{U+00FC}")
    +u::send_accented("{U+00DC}")
    y::send_accented("{U+00FF}")
    +y::send_accented("{U+009F}")
}

#If !dummy && !ignored_frame() && accent = ","
;; cedilla
{
    c::send_accented("{U+00E7}") ; e-umlaut
    +c::send_accented("{U+00C7}") ; e-umlaut
}

;; Ought to use implement mechanism to use U+2044 FRACTION SLASH instead, but for now:

#If !dummy && !ignored_frame() && accent = "1"
;; numerator = 1
{
    2::send_accented("{U+00BD}") ; 1/2
    3::send_accented("{U+2153}") ; 1/3
    4::send_accented("{U+00BC}") ; 1/4
    5::send_accented("{U+2155}") ; 1/5
}
#If !dummy && !ignored_frame() && accent = "2"
;; numerator = 1
{
    3::send_accented("{U+2154}") ; 2/3
    5::send_accented("{U+2156}") ; 2/5
}

#If !dummy && !ignored_frame() && accent = "3"
;; numerator = 1
{
    4::send_accented("{U+00BE}") ; 3/4
    5::send_accented("{U+2157}") ; 3/5
}

#If GetKeyState("CapsLock","T") && !dummy && !ignored_frame() && !cx

{
	a::Send {U+03B1} ; α alpha
	+a::Send {U+0391} ; Α Alpha
	b::Send {U+03B2} ; β beta
	+b::Send {U+0392} ; Β Beta
	c::Send {U+03B3} ; γ gamma
	+c::Send {U+0393} ; Γ Gamma
	d::Send {U+03B4} ; δ delta
	+d::Send {U+0394} ; Δ Delta
	e::Send {U+03B5} ; ε epsilon
	+e::Send {U+0395} ; Ε Epsilon
	z::Send {U+03B6} ; ζ zeta
	+z::Send {U+0396} ; Ζ Zeta
	h::Send {U+03B7} ; η eta
	+h::Send {U+0397} ; Η Eta
	j::Send {U+03B8} ; θ theta
	+j::Send {U+0398} ; Θ Theta
	i::Send {U+03B9} ; ι iota
	+i::Send {U+0399} ; Ι Iota
	k::Send {U+03BA} ; κ kappa
	+k::Send {U+039A} ; Κ Kappa
	l::Send {U+03BB} ; λ lambda
	+l::Send {U+039B} ; Λ Lambda
	m::Send {U+03BC} ; μ mu
	+m::Send {U+039C} ; Μ Mu
	n::Send {U+03BD} ; ν nu
	+n::Send {U+039D} ; Ν Nu
	q::Send {U+03BE} ; ξ xi
	+q::Send {U+039E} ; Ξ Xi
	o::Send {U+03BF} ; ο omicron
	+o::Send {U+039F} ; Ο Omicron
	p::Send {U+03C0} ; π pi
	+p::Send {U+03A0} ; Π Pi
	r::Send {U+03C1} ; ρ rho
	+r::Send {U+03A1} ; Ρ Rho
	s::Send {U+03C3} ; σ sigma
	+s::Send {U+03A3} ; Σ Sigma
	!s::Send {U+03C2} ; ς final sigma
	t::Send {U+03C4} ; τ tau
	+t::Send {U+03A4} ; Τ Tau
	y::Send {U+03C5} ; υ upsilon
	+y::Send {U+03A5} ; Υ Upsilon
	f::Send {U+03C6} ; φ phi
	+f::Send {U+03A6} ; Φ Phi
	x::Send {U+03C7} ; χ chi
	+x::Send {U+03A7} ; Χ Chi
	u::Send {U+03C8} ; ψ psi
	+u::Send {U+03A8} ; Ψ Psi
	w::Send {U+03C9} ; ω omega
	+w::Send {U+03A9} ; Ω Omega
}