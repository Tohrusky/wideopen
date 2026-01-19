% Class declarations

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{wideopen}
\LoadClassWithOptions{article}

% Layout

\RequirePackage[top=2.25cm, bottom=2.5cm, left=2.5cm, right=2.5cm, columnsep=0.65cm]{geometry}
\RequirePackage{microtype}
\RequirePackage{placeins}
\RequirePackage{hyphenat}
\RequirePackage{setspace}
\RequirePackage{parskip}
\RequirePackage[latin, english]{babel}
\RequirePackage{lipsum}
\RequirePackage{etoolbox}

\DisableLigatures[f]{family=sf*} 

% Graphics

\RequirePackage{graphicx}
\RequirePackage{subcaption}

% Tables

\RequirePackage{booktabs}
\RequirePackage{nicematrix}
\RequirePackage{multirow}
\RequirePackage{bm}
\newcommand{\nm}[1]{#1}

% Colorful stuff

\RequirePackage[most]{tcolorbox}
\RequirePackage{xcolor}
\definecolor{maincolor}{HTML}{e56b6f}
\definecolor{bgcolor}{HTML}{f7e1d7}
\definecolor{abscolor}{HTML}{023047}

% References

\RequirePackage{hyperref}
\RequirePackage[noabbrev,nameinlink]{cleveref}
\hypersetup{
  colorlinks,
  linkcolor=maincolor,
  citecolor=maincolor,
  urlcolor=maincolor
}


% Section and caption format

\RequirePackage{titlesec}
\titleformat*{\paragraph}{\itshape}
\titleformat*{\section}{\Large\scshape\bfseries}
\titleformat*{\subsection}{\large\scshape\bfseries}
\titleformat*{\subsubsection}{\normalsize\scshape\bfseries}
\DeclareTextFontCommand{\textbf}{\bfseries\sffamily}

\RequirePackage{caption}
\DeclareCaptionLabelSeparator{custom}{}
\DeclareCaptionFormat{custom}{{\sffamily\textbf{#1 #2}} #3}
\captionsetup{singlelinecheck=false,format=custom,labelsep=custom,font=small}
\captionsetup[sub]{singlelinecheck=true,format=custom,labelsep=custom,font=small}

% Meta custom fonts
% http://c.caignaert.free.fr/Install-ttf-Font.pdf

\renewcommand*\ttdefault{cmvtt}
\RequirePackage[T1]{fontenc}

% Authors, affiliations, infos

\renewcommand\addtolist[5][]{
  \begingroup
    \if\relax#3\relax\def\sep{}\else\def\sep{#5}\fi
    \let\protect\@unexpandable@protect 
    \xdef#3{\expandafter{#3}\sep #4[#1]{#2}}%
  \endgroup
}

\newcommand\authorlist{}
\newcommand\authorformat[2][]{{\sffamily \bfseries #2$^{#1}$}}
\renewcommand\author[2][]{\addtolist[#1]{#2}{\authorlist}{\authorformat}{, }}

\newcommand\affiliationlist{}
\newcommand\affiliationformat[2][]{{\normalsize $^{#1}$#2}}
\newcommand\affiliation[2][]{\addtolist[#1]{#2}{\affiliationlist}{\affiliationformat}{, }}

\newcommand\contributionlist{}
\newcommand\contributionformat[2][]{{\small $^{#1}$#2}}
\newcommand\contribution[2][]{\addtolist[#1]{#2}{\contributionlist}{\contributionformat}{, }}

\newcommand\metadatalist{}
\newcommand\metadataformat[2][]{{\small {\sffamily \bfseries #1:} #2}}
\newcommand\metadata[2][]{\addtolist[#1]{#2}{\metadatalist}{\metadataformat}{\par}}

\renewcommand{\abstract}[1]{\def\abstractlist{{\color{abscolor} #1}}}
\newcommand{\email}[1]{\href{mailto:#1}{\texttt{#1}}}

\renewcommand\date[1]{\metadata[Date]{#1}}
\newcommand\correspondence[1]{\metadata[Correspondence]{#1}}

\renewcommand{\title}[1]{
  \newcommand{\titlelist}{
    {\huge\scshape\bfseries #1}
  }
}

\newcommand{\beginappendix}{\appendix{\huge\sffamily Appendix\par}}

% Titlebox

\newcommand{\mymaketitle}{
    {
        \setlength{\parindent}{0cm}
        \setlength{\parskip}{0.5cm}
        {
          \setlength{\parskip}{0cm}
          \raggedright
          \nohyphens
          %
          {
            \setstretch{1.618}
            \titlelist\par
          }
          \vskip 0.2cm
          %
          \authorlist\par
          \vskip 0.2cm
          %
          \affiliationlist\par
          %
          \contributionlist\par
        }
        \vskip 0.25cm
        {
          \setlength{\parskip}{0cm}
          \ifdefempty{\metadatalist}{\vspace*{0.65cm}}{\metadatalist\par}
        }
        %
        \vskip 0.25cm
        \begin{tcolorbox}[
          enhanced,
          frame hidden,
          colback=bgcolor,
          arc=10pt,
          left=0.6cm,
          right=0.6cm,
          top=0.4cm,
          bottom=0.5cm
        ]
        {\color{abscolor}\abstractlist\par}
        \end{tcolorbox}
        \FloatBarrier
    }
}

\renewcommand{\maketitle}{
  \mymaketitle
}
