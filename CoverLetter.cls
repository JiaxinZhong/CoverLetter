\ProvidesClass{CoverLetter}
\LoadClass[12pt]{article}


\NeedsTeXFormat{LaTeX2e}

\RequirePackage{xifthen}      % 条件判断

\usepackage[
    a4paper,
    left = 2.54cm,
    right = 2.54cm, 
    top = 2.54cm, 
    bottom=2.54cm
]{geometry}


% 定义类选项，允许通过 \documentclass[...] 调用
\DeclareOption{JiaxinZhong}{\def\selectedauthor{JiaxinZhong}}
\DeclareOption{YunJing}{\def\selectedauthor{YunJing}}

% 如果用户未选择作者，则默认选 JiaxinZhong
\ifcsname selectedauthor\endcsname
  % 如果 \selectedauthor 已定义则不作处理
\else
  \def\selectedauthor{JiaxinZhong}
\fi

\ProcessOptions\relax

% 定义选择作者信息的命令
\newcommand{\authoroption}[1]{\def\selectedauthor{#1}}
% 如果没有设置，则默认使用 jiaxin
\providecommand{\selectedauthor}{JiaxinZhong}

% 定义输出作者信息的命令
\newcommand{\AuthorInfo}{%
  \ifthenelse{\equal{\selectedauthor}{JiaxinZhong}}{%
    {\color{MainColor} \faMapMarker} Graduate Program in Acoustics \\
    \hphantom{\faMapMarker} College of Engineering                 \\
    \hphantom{\faMapMarker} The Pennsylvania State University      \\
    {\color{MainColor}\faEnvelope} 118 Research West\\
    \hphantom{\faEnvelope} University Park, PA 16802\\
    {\color{MainColor}\faPhone} (+1)814-699-0386\\
    {\color{MainColor}\faAt} Jiaxin.Zhong@psu.edu\\
    {\color{MainColor}\faGlobe} \url{http://JiaxinZhong.com}%
  }{%
    \ifthenelse{\equal{\selectedauthor}{YunJing}}{%
        {\color{MainColor} \faMapMarker} Graduate Program in Acoustics \\
        \hphantom{\faMapMarker} College of Engineering                 \\
        \hphantom{\faMapMarker} The Pennsylvania State University      \\
      {\color{MainColor}\faEnvelope} 201 Applied Science Building\\
      \hphantom{\faEnvelope} University Park, PA 16802\\
      {\color{MainColor}\faPhone} (+1)814-867-1334\\
      {\color{MainColor}\faAt} yqj5201@psu.edu\\
      {\color{MainColor}\faGlobe} \url{https://sites.psu.edu/jinglab/}%
    }{%
      \textbf{Author information not set correctly.}%
    }%
  }%
}

% 定义作者签名
\newcommand{\AuthorSignature}{%
    \ifthenelse{\equal{\selectedauthor}{JiaxinZhong}}{%
        \includegraphics[scale=0.8]{img/Signature-EN1-20181030.png}
        \vspace{-1em}
        \\
        Dr. Jia-Xin Zhong
    }{%
        \ifthenelse{\equal{\selectedauthor}{YunJing}}{%
            \vspace{-0.4em}
            \includegraphics[scale=0.32]{img/YunJing_Signature_TransparentBackgroun_240504C.png}
            \vspace{-0.6em}
            \\
            Prof. Yun Jing
        }
    }
}


\usepackage{xcolor}

\RequirePackage[fixed]{fontawesome5}

%% Set the header and footer
\definecolor{MainColor}{rgb}{0.1172 0.2578 0.4805}
% see https://tex.stackexchange.com/questions/227/how-can-i-add-page-of-on-my-document
\usepackage{lastpage}
\usepackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{} % clear existing header/footer entries
\renewcommand{\headrule}{}
\fancyfoot[C]{Page {\thepage} of \pageref*{LastPage}}
% note that 
%   \thispagestyle{firststyle}
% must be used below \maketitle
\fancypagestyle{firststyle}
{
    \fancyhf{}
    \fancyhead[L]{
        \begin{tabular}{l|l}
            \hspace{-1.3em}
            \parbox{.5\textwidth}{
                \includegraphics[width=0.4\textwidth]{img/PSU_logo.png}
            }
            &
            \parbox{.5\textwidth}{
                \AuthorInfo
            }
        \end{tabular}
    }
    \fancyfoot[C]{Page {\thepage} of \pageref*{LastPage}}
}
% 首页没有页眉，只有页脚
\fancypagestyle{firstbottomstyle}
{
    \fancyhf{}
    \fancyfoot[C]{Page {\thepage} of \pageref*{LastPage}}
}

\usepackage{lipsum}


%% table
\usepackage{booktabs}
\usepackage{multirow}

% ============Page setup============
\usepackage{hyperref}
\hypersetup{
    colorlinks      =   true,
    bookmarks       =   true,
    bookmarksopen   =   true,
    % bookmarksdepth  =   2,
    pdfstartview    =   Fit,
    pdftitle        =   {Rebuttal Letter},
    pdfauthor       =   {Jiaxin Zhong},
    linkcolor = MainColor,
    urlcolor = MainColor,
}

\usepackage{physics}
\usepackage{mathrsfs}
\usepackage{graphicx}


% command \hl
\usepackage{color,soul}
\usepackage{siunitx} % conflict with pkg physics: \vb
\usepackage{physics}
\usepackage{upgreek}
\usepackage{setspace}
\usepackage{amsmath}
\usepackage{bm}
\usepackage{amssymb}


\newcommand{\rev}[1]{{\leavevmode\color{red}#1}}
\renewcommand{\thefigure}{R\arabic{figure}}
\renewcommand{\theequation}{R\arabic{equation}}
\DeclareMathOperator{\sinc}{sinc}

\renewcommand{\thetable}{R\arabic{table}}
\renewcommand{\thefigure}{R\arabic{figure}}
\renewcommand{\theequation}{R\arabic{equation}}

% \usepackage[T1]{fontenc}
% \usepackage{mlmodern} % xelatex
% \usepackage{tgtermes} % pdflatex
% \usepackage{fontspec} % 用于 XeLaTeX 或 LuaLaTeX
% \setmainfont{TeX Gyre Termes} % 调用系统中可用的 TeX Gyre Termes 字体
% \usepackage{mathptmx} % pdflatex，Times New Roman 字体
\usepackage{newtxtext}
\usepackage{mlmodern}

% caption 宏包用于统一设置图表标题（figure/table 的 caption）格式
\usepackage[
    font=small,        % 图表标题整体字号设为 \small，比正文（12pt）小一号
    labelfont=bf,      % “Figure 1”、“Table 1” 这些标签部分用粗体
    labelsep=period    % 标签和标题之间用句号分隔：Figure 1. Caption text
]{caption}
\captionsetup[table]{skip=10pt}


\usepackage{xcolor}

\usepackage[most]{tcolorbox}
\tcbuselibrary{breakable,skins}
\newtcolorbox{commentbox}{
    enhanced, frame hidden, breakable, sharp corners,%
    leftrule=0pt, rightrule=0pt, toprule=0pt, bottomrule=0pt,%
    boxsep=2pt, top=0.5em, bottom=0.5em, left=0.5em, right=0.5em,%
    before skip=1.0em, after skip=1.0em,
    borderline west={2pt}{0pt}{cyan!75!black}, %gray!75!white
    colframe=gray, colback = {cyan!5!white},
    before upper={\parindent15pt\noindent}
}
% \newtcolorbox{commentbox}{
%     colback=cyan!5!white,
%     colframe=cyan!75!black,
%     before upper={\parindent15pt\noindent}
% }

% No indentations for each paragraph
\usepackage[parfill]{parskip}

\onehalfspacing

\usepackage{enumitem}


% Make citations appear as 2-5 instead of 2,3,4,5
\usepackage{cite}
