\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dnscript}[2021/05/16 Dalist Nirgendwo's standard class for lecture notes]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scriptbase}}
\ProcessOptions\relax
\LoadClass{scriptbase}	

%==========================LECTURE==============================================

\newcounter{lecture}
\DeclareNewTOC[owner=dnscript,listname=List of lectures,type=lecture,types=lectures, name=lecture]{listoflectures}

%only relevant for lecture notes
\def\@lecture{}											
\newcommand{\lecture}[1]{%
	\stepcounter{lecture}
	\marginnote{\normalfont Lecture \thelecture, #1}
	\addxcontentsline{listoflectures}{section}[]{Lecture \thelecture{} from #1}
}