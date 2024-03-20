\NeedsTeXFormat{LaTeX2e}    % 指定编译当前文档所需的LaTeX格式和版本
\ProvidesClass{hebutthesis} % 声明此文件提供了一个文档类，叫做hebutthesis

\LoadClass{report}  % 加载report文档类

% 加载（包含）其他的包（package）以提供额外的功能或者设置
\RequirePackage[paperwidth = 21cm, paperheight= 29.7cm]{geometry}   % 文档页面布局A4纸
\RequirePackage[heading = true,zihao=-4,linespread=1.5,UTF8]{ctex}  % 调整中文标题小四号宋体，行间距1.5倍，UTF8编码
\RequirePackage{bm}           % 生成粗体数学符号
\RequirePackage{amsmath}      % 引入数学排版功能
\RequirePackage{amssymb}      % 提供额外数学符号集合
\RequirePackage{graphicx}     % 加载图像处理宏包
\RequirePackage[colorlinks=true,linkcolor=blue,urlcolor=black,bookmarksopen=true]{hyperref}   % 超链接设置，内部链接蓝色，外部URL链接黑色，pdf书签默认展开
\RequirePackage{bookmark}     % 基于hyperref宏包，提供更高级的pdf书签处理功能
\RequirePackage{appendix}     % 提供一些更高级的附录管理功能
\RequirePackage{float}        % 提供一些浮动体（图表图片）的精细控制功能
\RequirePackage{fancybox}     % 提供装饰盒子功能
\RequirePackage{titlesec}     % 自定义文档各级标题格式
\RequirePackage{array}        % 提供增强的表格布局功能
\RequirePackage{ulem}         % 提供各种文本下划线和删除线效果
\RequirePackage{fancyhdr}     % 提供页眉页脚的自定义功能
\RequirePackage{mathtools}    % 用于增强 LaTeX 的数学排版能力
\RequirePackage[most]{tcolorbox}        % 高度自定义彩色文本框
\RequirePackage[font=small]{caption}    % 使得所有的图表标题使用比正文小一号的字体大小
\RequirePackage[backend=biber,style=gb7714-2015,sorting=none]{biblatex}   % 处理参考文献的宏包，使用biber作为后端，格式依照gb7714-2015标准，引文不按特定顺序排列（而按照引用顺序）
\RequirePackage{parskip}              % 在文档开始前就调整段落间距，改变LaTeX默认行为，让文档中的段落之间用垂直空间分隔，而不是缩进第一行
% \RequirePackage{subfigure}            % 用于管理复杂图形
\RequirePackage{subfig}
\RequirePackage[export]{adjustbox}    % adjustbox用于调整盒子的属性，export表示将 adjustbox 包的键值选项导出到 \includegraphics 命令中
\RequirePackage{algorithm}            % 允许用户在文档中编写算法
\RequirePackage{booktabs}             % 提供了创建高质量表格的命令
\RequirePackage{tabularx}             % 使表格的列宽可以自动调整

\addbibresource{bibliography.bib}           % 指定参考文献数据库文件（.bib 文件）
\allowdisplaybreaks                         % 允许在数学环境中自动进行跨页断行
\DeclareMathOperator*{\argmax}{arg\ max\ }  % \DeclareMathOperator*用于定义一个带有上下限的运算符
\DeclareMathOperator*{\argmin}{arg\ min\ }  
\graphicspath{{./figures/}}                 % 指定包含图片的目录路径
\setlength\abovecaptionskip{-2.5pt}         % 图表标题和图表之间的距离减少2.5磅
\captionsetup[table]{labelsep=space}        % 表格标题中标签与题目之间只有一个空格
\captionsetup[figure]{labelsep=space}       % 图片标题中标签与题目之间只有一个空格

\renewcommand{\title}[1]{\def\hebutthesis@title{#1}}          % 对命令‘\title’的重新定义，因为report标准类没有
\renewcommand{\author}[1]{\def\hebutthesis@author{#1}}
\newcommand{\studentID}[1]{\def\hebutthesis@studentID{#1}}    % 定义全新的命令
\newcommand{\college}[1]{\def\hebutthesis@college{#1}}
\newcommand{\major}[1]{\def\hebutthesis@major{#1}}
\newcommand{\supervisor}[1]{\def\hebutthesis@supervisor{#1}}
\newcommand{\hebutThesisTime}[1]{\def\hebutthesis@hebutThesisTime{#1}}
\newCJKfontfamily{\fzxbsjt}{fzxbsjt.ttf}     % 定义新中日韩字体家族，命令为\fzxbsjt（方正小标宋简体），文件为fzxbsjt.ttf
\renewcommand{\headrulewidth}{0.5pt}         % 重新定义页面顶部规则线宽度为0.5磅
\tcbset{                          % 属于tcolorbox包，创建带有可选彩色背景的文本框
  height=0.85\textheight ,        % 本框的高度为文档总文本高度的85%
  colback=white,                  % 文本框背景白色
  arc=0mm,                        % 文本框角的圆弧半径为0毫米，即直角
  toprule=0.4mm,                  % 文本框上边框的宽度为0.4毫米
  bottomrule=0.4mm,               % 文本框下边框的宽度为0.4毫米
  leftrule=0.4mm,                 % 文本框左边框的宽度为0.4毫米
  rightrule=0.4mm                 % 文本框右边框的宽度为0.4毫米
}


\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}  % 定义一个类（class）或宏包（package）接收到未定义选项时的行为

\DeclareOption{design}{
  \def\doctype{毕业设计说明书}
  % 设置封面
  \renewcommand{\maketitle}[0]{     % 重新定义\maketitle，不允许输入参数
    \newgeometry{                         % 调整页面布局
      top        = 2.6cm,%2.41 2.5        % 上边距2.6cm，
      bottom     = 2.7cm, %2.73 %2.68     
      left       = 3.5cm, %3.4
      right      = 1.65cm,
      headheight = 1.0cm,                 % 页眉高度1cm
      headsep    = 0.64cm,                % 页眉和正文之间的距离（分隔）设置为0.64cm
      footskip   = 0.79cm                 % 页脚底部与正文底部之间的距离设置为0.79cm
    }
    \begin{titlepage}         % 创建自定义标题页
      \begin{center}          % 居中显示
        \vspace*{2.36cm}      % 强制在页面的顶部添加2.36cm的空白空间
        \fontsize{26}{0}\kaishu{河\quad 北\quad 工\quad 业\quad 大\quad 学}   % 字号设置26磅，行间距默认，楷书，\quad为空格
        \vskip 26pt           % 垂直方向上添加空白空间26磅
        \fontsize{36}{0}\fzxbsjt{毕业设计说明书}    % 字体“方正小标宋简体”
        \vskip 52pt
        \renewcommand\arraystretch{1.6}           % 调整局部表格行高为默认的1.6倍
        \begin{tabular}{c c}                      % 创建一个2列居中对齐的表格
          \fontsize{15}{0}\songti{作\qquad 者：}&\fontsize{16}{0}\kaishu\uline{\makebox[7em][c]{\hebutthesis@author}}   
          % 字号15磅，默认行间距，宋体；字号16磅，楷书，下划线，创建一个宽度为7个中文字符宽度的盒子，并且盒子内的内容居中对齐，用于动态插入作者名字
          \fontsize{15}{0}\songti{学\qquad 号：}\Large\uline{\makebox[7em][c]{\hebutthesis@studentID}}\\      % \Large表示比默认字体大一号，\表示换行
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

        \vspace*{1.56cm}        % 在页面的底部强制添加1.56cm的空白空间
        {\Large\fontsize{16}{0}\heiti{\hebutthesis@hebutThesisTime}}
      \end{center}
    \end{titlepage}

  }
  
}

\DeclareOption{thesis}{
  \def\doctype{毕业论文}
    
  % 设置封面
  \renewcommand{\maketitle}[0]{     % 重新定义\maketitle，不允许输入参数
    \newgeometry{                         % 调整页面布局
      top        = 2.6cm,%2.41 2.5        % 上边距2.6cm，
      bottom     = 2.7cm, %2.73 %2.68     
      left       = 3.5cm, %3.4
      right      = 1.65cm,
      headheight = 1.0cm,                 % 页眉高度1cm
      headsep    = 0.64cm,                % 页眉和正文之间的距离（分隔）设置为0.64cm
      footskip   = 0.79cm                 % 页脚底部与正文底部之间的距离设置为0.79cm
    }
    \begin{titlepage}         % 创建自定义标题页
      \begin{center}          % 居中显示
        \vspace*{2.36cm}      % 强制在页面的顶部添加2.36cm的空白空间
        \fontsize{26}{0}\kaishu{河\quad 北\quad 工\quad 业\quad 大\quad 学}   % 字号设置26磅，行间距默认，楷书，\quad为空格
        \vskip 26pt           % 垂直方向上添加空白空间26磅
        \fontsize{44}{0}\fzxbsjt{毕\qquad 业\qquad 论\qquad 文}    % 字体“方正小标宋简体”
        \vskip 52pt
        \renewcommand\arraystretch{1.6}           % 调整局部表格行高为默认的1.6倍
        \begin{tabular}{c c}                      % 创建一个2列居中对齐的表格
          \fontsize{15}{0}\songti{作\qquad 者：}&\fontsize{16}{0}\kaishu\uline{\makebox[7em][c]{\hebutthesis@author}}   
          % 字号15磅，默认行间距，宋体；字号16磅，楷书，下划线，创建一个宽度为7个中文字符宽度的盒子，并且盒子内的内容居中对齐，用于动态插入作者名字
          \fontsize{15}{0}\songti{学\qquad 号：}\Large\uline{\makebox[7em][c]{\hebutthesis@studentID}}\\      % \Large表示比默认字体大一号，\表示换行
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

        \vspace*{1.56cm}        % 在页面的底部强制添加1.56cm的空白空间
        {\Large\fontsize{16}{0}\heiti{\hebutthesis@hebutThesisTime}}
      \end{center}
    \end{titlepage}

  }
}

\ExecuteOptions{design}
\ProcessOptions\relax     % 处理由 \DeclareOption 和 \DeclareOption* 声明的选项

% 设置页眉页脚
\setlength\headwidth{\textwidth}    % 确保页眉宽度与文本宽度相同
\newcommand{\setyear}[1]{\def\theyear{#1}}
\newcommand{\setdoctype}[1]{\def\doctype{#1}}
\fancypagestyle{plain}{             % 属于fancyhdr宏包，添加一个plain样式
  \fancyhead[C]{\songti\zihao{5} 河北工业大学{\theyear}届本科{\doctype}}    % 设置页眉的中间部分，宋体5号
}
\pagestyle{fancy}               % 在LaTeX文档中设置页面样式为fancy
\fancyhead[R]{}                 % 右侧页眉为空
\fancyhead[L]{}
\fancyhead[C]{\songti\zihao{5} 河北工业大学{\theyear}届本科{\doctype}}
\cfoot{\footnotesize\thepage}   % 将页码以较小的字体大小放置在每页的页脚中央位置

% 设置中文宏包
\ctexset{                         % 基于latex的中文宏包，设置中文处理相关的参数
    chapter={
        name={},                              % 章节标题前不自动添加任何前缀（如“第一章”中的“第”和“章”），只显示章节的数字和标题文本
        number = \arabic{chapter},            % 章节编号使用阿拉伯数字
        format={\bfseries\heiti\zihao{-3}},   % 黑体加粗小三
        aftername={\quad},                    % 章节编号和标题文本之间的间距一个空格
        beforeskip={.5\baselineskip},         % 段前0.5行
        afterskip={.5\baselineskip},
    },
    section={
        format={\bfseries\heiti\zihao{4}},    % 黑体加粗四号
        aftername={\quad},
%        beforeskip={.5\baselineskip},
%        afterskip={.5\baselineskip},
    },
    subsection={
        format={\heiti\zihao{4}},             % 黑体四号
        aftername={\quad},
%        beforeskip={.5\baselineskip},
%        afterskip={.5\baselineskip},
    },
    subsubsection={
        format={\heiti\zihao{5}},
        aftername={\quad},
%        beforeskip={.5\baselineskip},
%        afterskip={.5\baselineskip},
        indent={2em},                         % 小节标题下第一行文本的缩进量2字符宽度
    }
}

\parskip=0pt                  % 段落之间垂直距离为0
\floatname{algorithm}{算法}   % 将 algorithm 环境的标题名称从默认的“Algorithm”更改为“算法”