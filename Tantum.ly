\version "2.14.2"
\include "fingering.ly"
\header {
	title = "Tantum ergo Sacramentum"
	composer ="Flor Peeters"
}
\paper {
  #(set-paper-size "a4" 'landscape)
}

keretEgy = \relative c'' { e1 c d e f e}
keretKetto = \relative c'' { a1 \(g f e d d c\fermata\)}

jobb =   \relative c' { \time 2/2 \tempo "Moderato" 4 = 92 \clef treble
			c1 (d e c
			d e f e)
			\keretKetto c' \( b c g
			a g f e \) a
			\(b c
			b a a g\fermata\)
			g \(g e c
			d e f e\)
			\keretKetto
			\bar "||"
		      }

jobbwithFinger = \addFingering \jobb
#"1231
2343
5432
121
5452
32113
454345
5531
23435
432121
"


bal = \relative c { \time 2/2 \clef bass \set fingeringOrientations = #'(down) 
		    c2 \(e | f g | c, d | e c\)
		     \set fingeringOrientations = #'(up) 
		    b \(g | c b | a b |
		    \once \override Fingering #'padding = #1 c\)
		    \set fingeringOrientations = #'(down) e
		    \(f d | e c | a b | c\) e
		    \(f e | f g | c,1\fermata\) \break
		    c2 \(e | g f | e d | e c \)
		    f \( d | e f | g gis | a g! | fis \) d
		    \( g f! | e fis | g \) g,
		    \( c b c d g1\fermata \)
		    g2 \(f | e d | c b | a \) a'
		    \(g f | e c | d f | a g | f\) d
		    \(e f | g gis | a g? | fis d | g1 | c,\fermata\)
		     \bar "||"
		   }

balwithFinger = \addFingering \bal
#"53|21|32|1'3-2'
35|23|43|21
24|12|43|21
23|21|5
53|12|34|35
24|32|12|11|24
12|32|15
14|54|1
12|31|23
51|23|45|42|12
35|43|12|11|24|1|5
"

szoveg = \lyricmode {
Tan -- tum -- er -- go Sac -- ra -- men -- tum
Ve -- ne -- re -- mur cer -- nu -- i:
Et an -- ti -- quum do -- cu -- men -- tum
Novo ce -- dat ri -- tu -- i:
Praes -- tet fi -- des supp -- le -- men -- tum
Sen -- su -- um de -- fec -- tui.

Geni -- to -- ri, Geni -- to -- que
La -- us et ju -- bi -- la -- tio,
Sa -- lus, ho -- nor, vir -- tus quo -- que
Sit et be -- ne -- dic -- tio:
Pro -- ce -- den -- ti ab ut -- ro -- que
Com -- par sit lau -- da -- tio.
A -- men.
}

\new PianoStaff <<
\set PianoStaff.instrumentName = #"I Diapason 8'"
\new Staff 
     \jobbwithFinger
\new Staff {
     \new Voice = "bal" {
       \balwithFinger
     }
}
\new Lyrics = "bal"

\context Lyrics = "bal" {
  \lyricsto "bal" {
    \szoveg
  }
}
>>

%% lilypond fingering substitution -- szavakra kijött, de külön kell hozzáadni az ujjrendet szólam + ujjrend és utánna a piano staff hivatkozással.
