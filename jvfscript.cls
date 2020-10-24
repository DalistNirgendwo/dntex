\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jvfscript}[2020/07/07 Johannes von Falkensteins Standardklasse für Vorlesungsskripte]

\LoadClass[a4paper,12pt]{scrbook}

%===================PACKAGES=========================================================

\usepackage{jvfmath}
\usepackage{marginnote}		%für Anmerkungen, welche Vorlesung das ist
\usepackage{setspace}		%\setstretch, also Zeilenabstand
\usepackage[UKenglish]{babel}
\usepackage{lmodern}

%==========================FORMATIERUNG=========================================

\usepackage[inner=3cm, outer=3cm, top=3cm, bottom=3cm]{geometry}		%Seitengröße
\renewcommand{\epsilon}{\varepsilon}

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
\ofoot{\thepage}

%==========================LECTURE==============================================

\newcounter{lecture}
\newcommand{\lecture}{\stepcounter{lecture} \marginnote{Vorlesung \arabic{lecture}}}

%===================DEFINITIONSLISTE==================================================

\usepackage{thmtools}
\usepackage{etoolbox}
\makeatletter
\patchcmd\thmtlo@chaptervspacehack
{\addtocontents{loe}{\protect\addvspace{10\p@}}}
{\addtocontents{loe}{\protect\thmlopatch@endchapter\protect\thmlopatch@chapter{\thechapter}}}
{}{}
\AtEndDocument{\addtocontents{loe}{\protect\thmlopatch@endchapter}}
\long\def\thmlopatch@chapter#1#2\thmlopatch@endchapter{%
	\setbox\z@=\vbox{#2}%
	\ifdim\ht\z@>\z@
	\hbox{\bfseries\chaptername\ #1}\nobreak
	#2
	\addvspace{10\p@}
	\fi
}
\def\thmlopatch@endchapter{}

\makeatother
\renewcommand{\thmtformatoptarg}[1]{ -- #1}
\renewcommand{\listtheoremname}{List of definitions}

%=============ENVIRONMENTS=======================================================

\newtheoremstyle{newthm}% name of the style to be used
{\topsep}% measure of space to leave above the theorem. E.g.: 3pt
{15pt}% measure of space to leave below the theorem. E.g.: 3pt
{\itshape}% name of font to use in the body of the theorem
{7.5pt}% measure of space to indent
{\bfseries}% name of head font
{\\}% punctuation between head and body
{ }% space after theorem head; " " = normal interword space
{\thmname{#1}\thmnumber{ #2}\thmnote{ (#3)}}

\newtheoremstyle{newdef}% name of the style to be used
{\topsep}% measure of space to leave above the theorem. E.g.: 3pt
{15pt}% measure of space to leave below the theorem. E.g.: 3pt
{}% name of font to use in the body of the theorem
{7.5pt}% measure of space to indent
{\bfseries}% name of head font
{\\}% punctuation between head and body
{ }% space after theorem head; " " = normal interword space
{\thmname{#1}\thmnumber{ #2}\thmnote{ (#3)}}

\newtheoremstyle{newrem}% name of the style to be used
{\topsep}% measure of space to leave above the theorem. E.g.: 3pt
{\topsep}% measure of space to leave below the theorem. E.g.: 3pt
{}% name of font to use in the body of the theorem
{7.5pt}% measure of space to indent
{\bfseries}% name of head font
{: }% punctuation between head and body
{ }% space after theorem head; " " = normal interword space
{\thmname{#1}\thmnumber{ #2}\thmnote{ (#3)}}

\theoremstyle{newthm}
\newtheorem{thm}{Theorem}[section]
\newtheorem{thmn}[thm]{Theorem}
\newtheorem{lem}[thm]{Lemma}
\newtheorem{prop}[thm]{Proposition}
\newtheorem{cor}[thm]{Corollary}
\newtheorem{corn}[thm]{Corollary}
\newtheorem*{thm*}{Theorem}
\newtheorem*{thmn*}{Theorem}
\newtheorem*{lem*}{Lemma}
\newtheorem*{prop*}{Proposition}
\newtheorem*{cor*}{Corollary}
\newtheorem*{corn*}{Corollary}

\theoremstyle{newdef}
\newtheorem{defn}[thm]{Definition}
\newtheorem{conj}[thm]{Conjecture}
\newtheorem*{defn*}{Definition}
\newtheorem*{conj*}{Conjecture}

\theoremstyle{newrem}
\newtheorem{exmp}[thm]{Example}
\newtheorem{rem}[thm]{Remark}
\newtheorem{note}[thm]{Note}
\newtheorem*{exmp*}{Example}
\newtheorem*{rem*}{Remark}
\newtheorem*{note*}{Note}
