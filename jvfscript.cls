\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jvfscript}[2021/05/16 Johannes von Falkenstein's standard class for lecture notes]

\LoadClass[a4paper,12pt]{scriptbase}	

%==========================LECTURE==============================================

\newcounter{lecture}
\DeclareNewTOC[owner=jvfscript,listname=List of lectures,type=lecture,types=lectures, name=lecture]{listoflectures}

%only relevant for lecture notes
\def\@lecture{}											
\newcommand{\lecture}[1]{%
	\stepcounter{lecture}
	\marginnote{\normalfont Lecture \thelecture, #1}
	\addxcontentsline{listoflectures}{section}[]{Lecture \thelecture{} from #1}
}