\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dnscript-de}[2021/05/16 Dalist Nirgendwos Standardklasse für Vorlesungsskripte]

\LoadClass[a4paper,12pt]{scriptbase}


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


%==========================LECTURE==============================================

\newcounter{lecture}
\DeclareNewTOC[owner=dnscript-de,listname=Vorlesungsverzeichnis,type=lecture,types=lectures, name=Vorlesung]{listoflectures}

%Nur für Vorlesungsnotizen relevant
\def\@lecture{}											
\newcommand{\lecture}[1]{%
	\stepcounter{lecture}
	\marginnote{\normalfont Vorlesung \thelecture, #1}
	\addxcontentsline{listoflectures}{section}[]{Vorlesung \thelecture{} vom #1}
}