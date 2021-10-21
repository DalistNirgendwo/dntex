\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jvfscript-de}[2021/05/16 Johannes von Falkensteins Standardklasse für Vorlesungsskripte]

\LoadClass[a4paper,12pt]{scrbook}


%===================PACKAGES=========================================================

\usepackage{imakeidx}		%für Indices
\usepackage{jvfmath}		%Mathe
\usepackage{marginnote}		%für Anmerkungen, welche Vorlesung das ist
\usepackage{setspace}		%\setstretch, also Zeilenabstand
\usepackage{lmodern}		%schönere Schriftart
\usepackage{wrapfig}		%um Bilder im Fließtext einzubingen
\usepackage{thmtools}		%für custom theorem-Umgebungen
\usepackage{appendix}		%um einen Anhang zu deklarieren
\usepackage{enumitem}
\usepackage{hyperref}		%Hyperlinks
\usepackage{cleveref}


%==========================FORMATIERUNG=========================================

%Seitengröße
\usepackage[inner=3cm, outer=3cm, top=3cm, bottom=3cm]{geometry}	
%Zeilenabstand. Kann man auch später nochmal reinhämmern, falls man es ändern will
\setstretch{1.15}

%\epsilon ist sonst hässlich
\renewcommand{\epsilon}{\varepsilon}

%Hypersetup, damit die Links lila sind
\usepackage{xcolor}														
	\definecolor{goodpurple}{RGB}{128,0,128}
	\hypersetup{
		colorlinks=true,
		linkcolor=goodpurple,
		filecolor=goodpurple,      
		urlcolor=goodpurple,
		bookmarksopen = true
	}

%damit \emph fett und kursiv ist
\let\emph\relax 																							
	\DeclareTextFontCommand{\emph}{\bfseries\em}
	
%damit auch die zweite Seite von ToCs keine Header hat
\AfterTOCHead{\pagestyle{plain}}
\AfterStartingTOC{\clearpage}


%==============BILDER============================================================

\usepackage{import}
\usepackage{xifthen}
\usepackage{pdfpages}
\usepackage{transparent}

%für Einbindung von pdfs aus Inkscape in Wrapfigs
\newcommand{\wrapincfig}[2]{%
	\def\svgwidth{#2}
	\import{./images/}{#1.pdf_tex}
}

%für die alleinstehende Einbindung von pdfs aus Inkscape
\newcommand{\incfig}[2]{%	
	\begin{center}
		\wrapincfig{#1}{#2}
	\end{center}
}

%für Einbindung von pngs
\newcommand{\image}[2]{\begin{center}									
	\includegraphics[width=#2]{#1.png}
\end{center}}


%==========================BACKEND==============================================

%legt eine Kopie vom chapter und section-counter an,
%die gleichzeitig hochtickt, aber nicht von \thesection beeinflusst wird
\usepackage{aliascnt}										
\newaliascnt{chaptertwo}{chapter}							
\newaliascnt{sectiontwo}{section}


%==========================DEUTSCH==============================================

\usepackage[utf8]{inputenc}

%Sprache. Falls es Englisch sein soll einfach zum Kommentar machen
\usepackage[ngerman]{babel}

%deutsche Anführungszeichen bei \enquote{}								
\usepackage[babel,german=quotes]{csquotes}				
\usepackage[T1]{fontenc}

%deutsche Worttrennung
\usepackage{hyphsubst}									
\HyphSubstIfExists{ngerman-x-latest}{%
	\HyphSubstLet{ngerman}{ngerman-x-latest}}{}
\HyphSubstIfExists{german-x-latest}{%
	\HyphSubstLet{german}{german-x-latest}}{}
\usepackage{csquotes}
\MakeOuterQuote{"}


%==============HEADER============================================================

\RequirePackage[headsepline]{scrlayer-scrpage}
\pagestyle{scrheadings}
\clearscrheadfoot
\setkomafont{pageheadfoot}{\upshape}

%ändert die Formatierung, wie chapter und section im Header angezeigt werden
\renewcommand{\chaptermark}[1]{%								
	\markboth{\chaptername\ \thechapter:\ #1}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection.\ #1}}

%rechts auf geraden Seiten steht das Kapitel
\rehead{\leftmark}
%links auf ungeraden die Section												
\lohead{\rightmark}												
\chead{}
%außen unten steht die Seitenzahl
\ofoot{\thepage}												


%==========================LECTURE==============================================

\newcounter{lecture}
\DeclareNewTOC[owner=jvfscript-de,listname=Vorlesungsverzeichnis,type=lecture,types=lectures, name=Vorlesung]{listoflectures}

%Nur für Vorlesungsnotizen relevant
\def\@lecture{}											
\newcommand{\lecture}[1]{%
	\stepcounter{lecture}
	\marginnote{\normalfont Vorlesung \thelecture, #1}
	\addxcontentsline{listoflectures}{section}[]{Vorlesung \thelecture{} vom #1}
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