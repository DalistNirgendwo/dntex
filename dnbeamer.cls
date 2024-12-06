\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dnbeamer}[2024/12/06 Dalist Nirgendwo's standard class for presentations]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamerbase}}
\ProcessOptions\relax
\LoadClass{beamerbase}