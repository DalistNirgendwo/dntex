\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jvfscript}[2021/05/16 Johannes von Falkenstein's standard class for lecture notes]

\LoadClass[a4paper,12pt]{scrbook}

%===================PACKAGES=========================================================

\usepackage{imakeidx}
\usepackage{jvfmath}
\usepackage{marginnote}		%für Anmerkungen, welche Vorlesung das ist
\usepackage{setspace}		%\setstretch, also Zeilenabstand
\usepackage[UKenglish]{babel}
\usepackage{lmodern}
\usepackage{wrapfig}
\usepackage{hyperref}		%Hyperlinks
\usepackage{thmtools}		%for custom theorem-environments
\usepackage{appendix}		%to declare an appendix

%==========================FORMATIERUNG=========================================

%page size
\usepackage[inner=3cm, outer=3cm, top=3cm, bottom=3cm]{geometry}	
%line spacing
\setstretch{1.15}

%\epsilon ist sonst hässlich
\renewcommand{\epsilon}{\varepsilon}

%Hypersetup, making all hyperlinks purple
\usepackage{xcolor}														
\definecolor{goodpurple}{RGB}{128,0,128}
\hypersetup{
	colorlinks=true,
	linkcolor=goodpurple,
	filecolor=goodpurple,      
	urlcolor=goodpurple,
	bookmarksopen = true
}

%making \emph bold and italic
\let\emph\relax 																							
\DeclareTextFontCommand{\emph}{\bfseries\em}

%no headers in frontmatter
\AfterTOCHead{\pagestyle{plain}}
\AfterStartingTOC{\clearpage}


%==============BILDER============================================================

\usepackage{import}
\usepackage{xifthen}
\usepackage{pdfpages}
\usepackage{transparent}

%for including pdfs from inkspace in wrapfig
\newcommand{\wrapincfig}[2]{%
	\def\svgwidth{#2}
	\import{./images/}{#1.pdf_tex}
}

%for including independent pdfs from inkspace
\newcommand{\incfig}[2]{%	
	\begin{center}
		\wrapincfig{#1}{#2}
	\end{center}
}

%for including pngs
\newcommand{\image}[2]{\begin{center}									
		\includegraphics[width=#2]{#1.png}
\end{center}}

%==========================BACKEND==============================================

%produces a copy of the chapter and section-counters,
%that tick accordingly but don't influence \thesection
\usepackage{aliascnt}										
\newaliascnt{chaptertwo}{chapter}							
\newaliascnt{sectiontwo}{section}

%==============HEADER============================================================

\RequirePackage[headsepline]{scrlayer-scrpage}
\pagestyle{scrheadings}
\clearscrheadfoot
\setkomafont{pageheadfoot}{\upshape}

%changes the formating of how chapter and section are displayed in the header
\renewcommand{\chaptermark}[1]{%								
	\markboth{\chaptername\ \thechapter:\ #1}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection.\ #1}}

%chapter on the right side of even pages
\rehead{\leftmark}
%section on the left of odd pages												
\lohead{\rightmark}												
\chead{}
%page number on the outer side
\ofoot{\thepage}	

%==========================LECTURE==============================================

\newcounter{lecture}
\DeclareNewTOC[owner=jvfscript-de,listname=List of lectures,type=lecture,types=lectures, name=lecture]{listoflectures}

%only relevant for lecture notes
\def\@lecture{}											
\newcommand{\lecture}[1]{%
	\stepcounter{lecture}
	\marginnote{\normalfont Lecture \thelecture, #1}
	\addxcontentsline{listoflectures}{section}[]{Lecture \thelecture{} from #1}
}

\newcommand{\autolabel}{\label{\arabic{chaptertwo}.\arabic{thm}}}

%=============ENVIRONMENTS=======================================================

\makeatletter
\newcommand\myonlynewline{\newline\@afterheading}
\makeatother

\declaretheoremstyle[
headfont=\bfseries,
bodyfont=\itshape,
spaceabove=12pt,
spacebelow=30pt,
headpunct={\myonlynewline},
]{thmnew}

\declaretheoremstyle[
headfont=\bfseries,
spaceabove=12pt,
spacebelow=30pt,
headpunct={\myonlynewline},
%qed={//},
]{defnew}

\declaretheoremstyle[
headfont=\bfseries,
spaceabove=12pt,
spacebelow=24pt,
headpunct={:\ },
%qed={//},
]{remnew}
