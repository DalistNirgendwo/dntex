\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jvfscript-de}[2020/07/07 Johannes von Falkensteins Standardklasse für Vorlesungsskripte]

\LoadClass[a4paper,12pt]{scrbook}

%===================PACKAGES=========================================================

\usepackage{imakeidx}		%für In
\usepackage{jvfmath}		%Mathe
\usepackage{marginnote}		%für Anmerkungen, welche Vorlesung das ist
\usepackage{setspace}		%\setstretch, also Zeilenabstand
\usepackage{lmodern}		%schönere Schriftart
\usepackage{wrapfig}		%um Bilder im Fließtext einzubingen
\usepackage{hyperref}		%Hyperlinks
\usepackage{thmtools}		%für custom theorem-Umgebungen
\usepackage{appendix}		%um einen Anhang zu deklarieren

%==========================FORMATIERUNG=========================================

\usepackage[inner=3cm, outer=3cm, top=3cm, bottom=3cm]{geometry}		%Seitengröße
\renewcommand{\epsilon}{\varepsilon}									%\epsilon ist sonst hässlich

\newcommand{\image}[2]{\begin{center}									%für Einbindung von pngs
		\includegraphics[width=#2]{#1.png}
	\end{center}}

\let\emph\relax 														%für Einbindung von pdfs aus Inkscape
\DeclareTextFontCommand{\emph}{\bfseries\em}

\usepackage{aliascnt}													%legt eine Kopie vom chapter und section-counter an, 
\newaliascnt{chaptertwo}{chapter}%										%die gleichzeitig hochtickt, aber nicht von \thesection beeinflusst wird
\newaliascnt{sectiontwo}{section}%

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
\renewcommand{\chaptermark}[1]{%								#ändert die Formatierung, wie chapter und section in Herader angezeigt werden
	\markboth{\chaptername\ \thechapter:\ #1}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection.\ #1}}
\rehead{\leftmark}												%recht auf geraden Seiten steht das Kapitel
\lohead{\rightmark}												%links auf ungeraden die Section
\chead{}
\ofoot{\thepage}												%außen unten steht die Seitenzahl


%==========================LECTURE==============================================

\newcounter{lecture}											%Nur für Vorlesungsnotizen relevant
\newcommand{\lecture}{\stepcounter{lecture} \index[lecture]{Vorlesung \thelecture} \marginnote{Vorlesung \thelecture}}
\makeindex[name=lecture,title=Vorlesungen,intoc]

%=============ENVIRONMENTS=======================================================

\declaretheoremstyle[
headfont=\bfseries,
bodyfont=\itshape,
spaceabove=\topsep,
spacebelow=15pt,
headpunct=\\,
]{thmnew}

\declaretheoremstyle[
headfont=\bfseries,
spaceabove=\topsep,
spacebelow=15pt,
headpunct=\\,
%qed={//},
]{defnew}

\declaretheoremstyle[
headfont=\bfseries,
spaceabove=\topsep,
spacebelow=15pt,
headpunct={:\ },
%qed={//},
]{remnew}

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