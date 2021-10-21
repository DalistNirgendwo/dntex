\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jvfbeamer-de}[2021/05/16 Johannes von Falkensteins Standardklasse für Vorträge]

\LoadClass[12pt]{beamer}


%\addtobeamertemplate{navigation symbols}{}{%
%	\usebeamerfont{footline}%
%	\usebeamercolor[fg]{footline}%
%	\hspace{1em}%
%	\insertframenumber/\inserttotalframenumber
%}
\setbeamertemplate{itemize items}[circle]

%===================COLOURS=========================================================

\usetheme{Goettingen}
\usecolortheme{whale}
\useoutertheme{infolines} % Alternatively: miniframes, infolines, split
\useinnertheme{circles}
\definecolor{UBCblue}{RGB}{128,0,128} % UBC Blue (primary)
\definecolor{UBCgrey}{rgb}{0,0,0} % UBC Grey (secondary)

\setbeamercolor{palette primary}{bg=UBCblue,fg=white}
\setbeamercolor{palette secondary}{bg=UBCblue,fg=white}
\setbeamercolor{palette tertiary}{bg=UBCblue,fg=white}
\setbeamercolor{palette quaternary}{bg=UBCblue,fg=white}
%\setbeamercolor{structure}{fg=black} % itemize, enumerate, etc
%\setbeamercolor{section in toc}{fg=black} % TOC sections

% Override palette coloring with secondary
%\setbeamercolor{subsection in head/foot}{bg=black,fg=white}


%===================PACKAGES=========================================================

\usepackage{jvfmath}
\usepackage{lmodern}
\usepackage{hyperref}		%Hyperlinks
\usepackage{thmtools}		%für custom theorem-Umgebungen
\usepackage{tcolorbox}


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


%=============ENVIRONMENTS=======================================================

\makeatletter
\newcommand\myonlynewline{\newline\@afterheading}
\makeatother

\declaretheoremstyle[
headfont=\bfseries,
bodyfont=\itshape,
%spaceabove=12pt,
spacebelow=30pt,
headpunct={\myonlynewline},
]{thmnew}

\declaretheoremstyle[
headfont=\bfseries,
%spaceabove=12pt,
spacebelow=30pt,
headpunct={\myonlynewline},
%qed={//},
]{defnew}

\declaretheoremstyle[
headfont=\bfseries,
%spaceabove=12pt,
spacebelow=24pt,
headpunct={:\ },
%qed={//},
]{remnew}