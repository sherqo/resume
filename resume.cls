\ProvidesClass{resume}[2010/07/10 v0.9 Resume class]
\LoadClass[11pt,letterpaper]{article}
\usepackage[left=0.4in,top=0.4in,right=0.4in,bottom=0.4in]{geometry}
\usepackage[parfill]{parskip}
\usepackage{array}
\usepackage{ifthen}
\usepackage{xcolor}
\usepackage{enumitem}
\pagestyle{empty}


\usepackage[T1]{fontenc}
% \usepackage{lmodern} % the original font 
% \usepackage{newpxtext} % good and safe 
% \usepackage{ebgaramond} % i think that's better 
\usepackage{cochineal}  % better than ebgaramond 
% \usepackage{crimson}      % very readable, warm serif, better at numbers 
% \usepackage{libertine}    % very clean, why everyone is better than the prev
% \usepackage{stix2}        % so readable really and not bad 

\setlist[itemize]{nosep}

\def \name#1{\def\@name{#1}}
\def \@name {}
\def \addressSep {$\cdot$}

\let \@addressone \relax
\let \@addresstwo \relax
\let \@addressthree \relax

\def \address #1{
	\@ifundefined{@addressone}{
		\def \@addressone {#1}
	}{
		\@ifundefined{@addresstwo}{
			\def \@addresstwo {#1}
		}{
			\def \@addressthree {#1}
		}}
}

\def \printaddress #1{
\begingroup
\def \\ {\addressSep\ }
\centerline{#1}
\endgroup
\par
\addressskip
}

\def \printname {
	\begingroup
	\hfil{\MakeUppercase{\namesize\bf \@name}}\hfil
	\nameskip\break
	\endgroup
}

\let\ori@document=\document
\renewcommand{\document}{
	\ori@document
	\printname
	\@ifundefined{@addressone}{}{\printaddress{\@addressone}}
	\@ifundefined{@addresstwo}{}{\printaddress{\@addresstwo}}
	\@ifundefined{@addressthree}{}{\printaddress{\@addressthree}}
}

\newenvironment{rSection}[1]{
	\sectionskip
	\MakeUppercase{\bf \textcolor{HEADINGCOLOR}{#1}}
	\sectionlineskip
	\hrule
	\begin{list}{}{
			\setlength{\leftmargin}{1.5em}
		}
		\item[]
		      }{
	\end{list}
}

\def\namesize{\huge}
\def\addressskip{\smallskip}
\def\sectionlineskip{\medskip}
\def\nameskip{\bigskip}
\def\sectionskip{\medskip}