\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{beamerbase}[2024/12/06 The basis for Dalist Nirgendwo's standard classes for presentations]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax
\LoadClass[12pt]{beamer}


\setbeamertemplate{itemize items}[circle]
\renewcommand{\epsilon}{\varepsilon}


%===================COLOURS=========================================================

\usetheme{Goettingen}
\usecolortheme{whale}
%\useoutertheme{infolines} % Alternatively: miniframes, infolines, split
\useinnertheme{circles}
\definecolor{UBCblue}{RGB}{128,0,128} % UBC Blue (primary)
\definecolor{UBCgrey}{rgb}{0,0,0} % UBC Grey (secondary)

\setbeamercolor{palette primary}{bg=UBCblue,fg=white}
\setbeamercolor{palette secondary}{bg=UBCblue,fg=white}
\setbeamercolor{palette tertiary}{bg=UBCblue,fg=white}
\setbeamercolor{palette quaternary}{bg=UBCblue,fg=white}
%\setbeamercolor{palette sidebar primary}{fg=white, bg=UBCblue}
\setbeamercolor{palette sidebar secondary}{fg=black}
\setbeamercolor{palette sidebar tertiary}{fg=UBCblue}
\setbeamercolor{title in sidebar}{fg=black}
\setbeamercolor{section in sidebar}{fg=black}
\setbeamercolor{subsection in sidebar}{fg=black}
%\setbeamercolor{section in sidebar shaded}{fg=red,bg=black}
%\setbeamercolor{structure}{fg=black} % itemize, enumerate, etc
\setbeamercolor{section in toc}{fg=black} 		% TOC sections
\setbeamercolor{subsection in toc}{fg=black} 	% TOC sections

% Override palette coloring with secondary
%\setbeamercolor{subsection in head/foot}{bg=black,fg=white}

\usefonttheme{serif}


%==============PICTURES============================================================

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


%===================PACKAGES=========================================================

\usepackage{dnmath}
\usepackage{lmodern}
\usepackage{hyperref}		%Hyperlinks
\usepackage{thmtools}		%für custom theorem-Umgebungen
\usepackage{tcolorbox}
\usepackage{wrapfig}		%for embedding images in text
\usepackage[utf8]{inputenc}


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