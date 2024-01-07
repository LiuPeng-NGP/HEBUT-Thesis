\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hebutthesis}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions
\LoadClass{report}

\RequirePackage[paperwidth = 21cm, paperheight= 29.7cm]{geometry}
\RequirePackage[heading = true,zihao=-4,linespread=1.5,UTF8]{ctex}
\RequirePackage{bm}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{graphicx}
\RequirePackage[colorlinks=true,linkcolor=blue,urlcolor=black,bookmarksopen=true]{hyperref}
\RequirePackage{bookmark}
\RequirePackage{appendix}
\RequirePackage{float}
\RequirePackage{fancybox}
\RequirePackage{titlesec}
\RequirePackage{array}
\RequirePackage{ulem}
\RequirePackage{fancyhdr}
\RequirePackage{mathtools}
\RequirePackage[most]{tcolorbox}
\RequirePackage[font=small]{caption}
\RequirePackage[backend=biber,style=gb7714-2015,sorting=none]{biblatex}
\RequirePackage{parskip}
\RequirePackage{subfigure}
\RequirePackage[export]{adjustbox}
\RequirePackage{algorithm}
\RequirePackage{algorithmic}

\addbibresource{bibliography.bib}
\allowdisplaybreaks
\DeclareMathOperator*{\argmax}{arg\ max\ }
\DeclareMathOperator*{\argmin}{arg\ min\ }
\graphicspath{{./figures/}}
\setlength\abovecaptionskip{-2.5pt}
\captionsetup[table]{labelsep=space}
\captionsetup[figure]{labelsep=space}

\renewcommand{\title}[1]{\def\hebutthesis@title{#1}}
\renewcommand{\author}[1]{\def\hebutthesis@author{#1}}
\newcommand{\studentID}[1]{\def\hebutthesis@studentID{#1}}
\newcommand{\college}[1]{\def\hebutthesis@college{#1}}
\newcommand{\major}[1]{\def\hebutthesis@major{#1}}
\newcommand{\supervisor}[1]{\def\hebutthesis@supervisor{#1}}
\newcommand{\hebutThesisTime}[1]{\def\hebutthesis@hebutThesisTime{#1}}
\newCJKfontfamily{\fzxbsjt}{fzxbsjt.ttf}
\renewcommand{\headrulewidth}{0.5pt}
\tcbset{
  height=0.85\textheight ,
  colback=white,
  arc=0mm,
  toprule=0.4mm,
  bottomrule=0.4mm,
  leftrule=0.4mm,
  rightrule=0.4mm
}

\renewcommand{\maketitle}[0]{
  \newgeometry{
    top        = 2.6cm,%2.41 2.5
    bottom     = 2.7cm, %2.73 %2.68
    left       = 3.5cm, %3.4
    right      = 1.65cm,
    headheight = 1.0cm,
    headsep    = 0.64cm,
    footskip   = 0.79cm
  }
	\begin{titlepage}
		\begin{center}
			\vspace*{2.36cm}
      \fontsize{26}{0}\kaishu{河\quad 北\quad 工\quad 业\quad 大\quad 学}
			\vskip 26pt
			\fontsize{36}{0}\fzxbsjt{毕业设计说明书}
			\vskip 52pt
      \renewcommand\arraystretch{1.6}
      \begin{tabular}{c c}
        \fontsize{15}{0}\songti{作\qquad 者：}&\fontsize{16}{0}\kaishu\uline{\makebox[7em][c]{\hebutthesis@author}}
        \fontsize{15}{0}\songti{学\qquad 号：}\Large\uline{\makebox[7em][c]{\hebutthesis@studentID}}\\
        \fontsize{15}{0}\songti{学\qquad 院：}&\fontsize{16}{0}\kaishu\uline{\makebox[24em][c]{\hebutthesis@college}} \\
        \fontsize{15}{0}\songti{系(专业)：}&\fontsize{16}{0}\kaishu\uline{\makebox[24em][c]{\hebutthesis@major}}\\
        \fontsize{15}{0}\songti{题\qquad 目：}&\fontsize{16}{0}\kaishu\uline{\makebox[24em][c]{\hebutthesis@title}} \\
        &\fontsize{16}{0}\kaishu\uline{\makebox[24em][c]{}}
      \end{tabular}
      \vskip 78pt
      \renewcommand\arraystretch{2.4}
      \begin{tabular}{c c}
        \fontsize{15}{0}\songti{指导者：}&\fontsize{16}{0}\kaishu\uline{\makebox[20em][c]{\hebutthesis@supervisor}} \\
        \fontsize{15}{0}\songti{评阅者：}&\fontsize{16}{0}\kaishu\uline{\makebox[20em][c]{}}\\
      \end{tabular}
      \renewcommand\arraystretch{1.2}

      \vspace*{1.56cm}
      {\Large\fontsize{16}{0}\heiti{\hebutthesis@hebutThesisTime}}
		\end{center}
	\end{titlepage}


  \setlength\headwidth{\textwidth}
  \fancypagestyle{plain}{
    \fancyhead[C]{\songti\zihao{5} 河北工业大学2023届本科毕业设计说明书}
  }
  \pagestyle{fancy} 
  \fancyhead[R]{}
  \fancyhead[L]{}
  \fancyhead[C]{\songti\zihao{5} 河北工业大学2023届本科毕业设计说明书}
  \cfoot{\footnotesize\thepage}
}

\ctexset{
    chapter={
        name={},
        number = \arabic{chapter},
        format={\bfseries\heiti\zihao{-3}},
        aftername={\quad}, 
        beforeskip={.5\baselineskip},
        afterskip={.5\baselineskip},
    },
    section={
        format={\bfseries\heiti\zihao{4}},
        aftername={\quad},
        beforeskip={.5\baselineskip},
        afterskip={.5\baselineskip},
    },
    subsection={
        format={\heiti\zihao{4}},
        aftername={\quad},
        beforeskip={.5\baselineskip},
        afterskip={.5\baselineskip},
    },
    subsubsection={
        format={\heiti\zihao{5}},
        aftername={\quad},
        beforeskip={.5\baselineskip},
        afterskip={.5\baselineskip},
        indent={2em},
    }
}


\parskip=0pt
\floatname{algorithm}{算法}