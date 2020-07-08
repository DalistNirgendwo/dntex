\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jvfscript}[2020/07/07 Johannes von Falkensteins Standardklasse für Vorlesungsskripte]

\LoadClass[a4paper,12pt]{scrbook}

\RequirePackage{jvfscriptstyle}

%==========================FORMATIERUNG=========================================

\usepackage[inner=3cm, outer=3cm, top=3cm, bottom=3cm]{geometry}		%Seitengröße
\renewcommand{\epsilon}{\varepsilon}

%==========================DEUTSCH==============================================

\usepackage[utf8]{inputenc}
\usepackage[ngerman]{babel}								%Sprache. Falls es Englisch sein soll einfach zum Kommentar machen
\usepackage[babel,german=quotes]{csquotes}				%deutsche Anführungszeichen bei \enquote{}
\usepackage[T1]{fontenc}
\usepackage{hyphsubst}									%deutsche Worttrennung
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
\renewcommand{\chaptermark}[1]{%
	\markboth{\chaptername\ \thechapter:\ #1}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection.\ #1}}
\rehead{\leftmark}
\lohead{\rightmark}
\chead{}
\ohead{Vorlesung \arabic{lecture}}
\lefoot{\thepage}
\rofoot{\thepage}
