\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dnbeamer-de}[2024/12/06 Dalist Nirgendwos Standardklasse für Vorträge]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamerbase}}
\ProcessOptions\relax
\LoadClass{beamerbase}


%==========================DEUTSCH==============================================

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