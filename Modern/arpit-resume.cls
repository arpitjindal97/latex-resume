%----------------------------------------------------------------------------------------
%	CLASS OPTIONS AND REQUIRED PACKAGES
%----------------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{arpit-resume}[2014/04/30 CV class]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\newcommand{\name}{command for Name of canidate}
\newcommand{\designation}{designation of canidate}
\newcommand{\summary}{summary of canidate}
%\newcommand{\section}{Heading section}
\newcommand{\timeline}{timeline content}
\newcommand{\contactlink}{timeline content}
\newcommand{\contact}{timeline content}
\newcommand{\contacticon}{}
\newcommand{\achievement}{acheivement}
\newcommand{\achievementitem}{}
\newcommand{\timelineyear}{timelineyear}
\newcommand{\contributionitem}{}
\newcommand{\contributionheading}{}
\newcommand{\educationitem}{}
\newcommand{\workitem}{}
\newcommand{\listitem}{}
\LoadClass{article}

\RequirePackage[hmargin=0.8cm, vmargin=0.8cm]{geometry} % Specifies horizontal and vertical page margins
%\RequirePackage{hyperref} % Required for links
\RequirePackage{fontspec}
\usepackage{fontawesome5}
\usepackage{wrapfig}
\usepackage{tabularx}
\usepackage{vcell}
\usepackage{tabularray}
\usepackage{lettrine}
\usepackage{tcolorbox}
\usepackage{array}
\usepackage{vwcol}
\usepackage{hyperref}
\usepackage{changepage}
\usepackage{enumitem}
%\setlength{\parindent}{0em}
%\RequirePackage[usenames,dvipsnames]{xcolor}
\definecolor{main-theme}{HTML}{2F80ED}
\definecolor{content}{HTML}{333333}
\definecolor{link}{HTML}{2D9CDB}

\hypersetup{
    colorlinks=true,
    linkcolor=green,
    filecolor=content,
    urlcolor=link,
    pdfpagemode=FullScreen,
    pdftitle={Arpit's Resume},
    pdfauthor={Arpit Agarwal},
    pdfsubject={Site Reliability Engineer},
    pdfkeywords={Resume},
    pdfproducer=xdvipdfmx,
    pdfcreator=xelatex
}

\renewcommand{\name}[1]{ % Defines the command for the main heading
    {
        \color{main-theme}
        \fontsize{18pt}{18pt} % Font size
        \fontspec[Path = fonts/ubuntu/]{Ubuntu-M}\selectfont 
        #1
    }
}
\renewcommand{\designation}[1]{
% Used in designation
    { %\begin{adjustwidth}{2pt}{0pt}
        \color{content}
        \fontsize{9pt}{9pt} % Font size
        \fontspec[Path = fonts/ubuntu/]{Ubuntu-B}\selectfont #1
        %\end{adjustwidth}
    }
}
\renewcommand{\summary}[1]{
%% Used in short summary, 
    \color{main-theme} \fontsize{13pt}{12pt} \selectfont
    \lettrine[findent=1pt]{{\textbf{\faIcon{quote-left}}}}{}
    \color{content}
    \fontspec[Path = fonts/ubuntu/]{Ubuntu-M}
    \fontsize{7pt}{12pt}\selectfont #1
    %\achievement{#1}

    % above empty line should not be removed
}
\newcommand{\sectionicon}[1]{
{\fontspec[Path = fonts/ubuntu/]{Ubuntu-M}
\color{main-theme} \fontsize{18pt}{18pt} \selectfont \faIcon{#1}}
}

\newcommand{\sectionhead}[1]{
{
    \vspace{2mm}
    \noindent \rule{\linewidth}{0.7pt}
    \vspace{-3.5mm}
    \newline
    \color{content} 
    \fontsize{10.5pt}{10pt}
    \fontspec[Path = fonts/ubuntu/]{Ubuntu-B}
    \selectfont
    \hspace{-5pt} \uppercase{#1}
    \vspace{-1.8mm}
    \newline
    \noindent \rule{\linewidth}{.7pt}
    }
}

\renewcommand{\section}[2]{
\vspace{-10pt}
\begin{tabularx}{\linewidth}{@{}c@{\hskip -5pt}l@{\hskip 2pt}X@{}}

\savecellbox{\rule{0pt}{15pt}}
& \savecellbox{\sectionicon{#2}}
& \savecellbox{\sectionhead{#1}}
\\[-\rowheight]
\printcellmiddle
& \printcellmiddle
& \printcellmiddle
\\


\end{tabularx}
\vspace{-13pt}
}

\renewcommand{\contacticon}[1]{
\color{main-theme} \fontsize{13pt}{1pt} \selectfont
%\hspace{0mm} 
\parbox[c]{1em}{\faIcon{#1} }
}

\renewcommand{\contactlink}[2]{
    \fontsize{8pt}{8pt} \color{content}
    \fontspec[Path = fonts/ubuntu/]{Ubuntu-R}\selectfont
    \href{#1#2}{#2}
}

\renewcommand{\contact}[1]{
    %\begin{tcolorbox} 
        \begin{vwcol}[widths={0.25,0.7},sep=.5cm,rule=1pt,indent=1em]
            \raggedleft
            Contact
            \columnbreak
            #1
        \end{vwcol} 
    %\end{tcolorbox}
}

\renewcommand{\achievement}[1]{
% used by achievement, work designation
    \color{content}
    \fontspec[Path = fonts/ubuntu/]{Ubuntu-M}
    \fontsize{7pt}{12pt} \selectfont #1 % First name font
}

\renewcommand{\achievementitem}[5]{
   \filldraw[content](#1,#2)circle(3pt)
    node[anchor=west,
    xshift=.5mm
    ] {
        \achievement{#3}
        \color{main-theme}\selectfont#4
    }
    node[anchor=east,outer sep=3pt] { \timelineyear{#5} };
}

\renewcommand{\timelineyear}[1]{
% used by timeline left side year, work content, contribution description
% hobbies list, skills list
    \color{content}
    \fontsize{7pt}{12pt} % Font size
    \fontspec[Path = fonts/ubuntu/]{Ubuntu-R}\selectfont#1 % First name font
}

\renewcommand{\educationitem}[6]{
    \filldraw[content](#1,#2)circle(3pt)
    node[anchor=west,outer sep=2pt,align=left,yshift=-2.2mm,xshift=1mm] {
        \achievement{#3}\\
        \timelineyear{#4}
        \color{main-theme}#5
    }
    node[anchor=east,outer sep=3pt] {
        \timelineyear{#6}
    };
}

\newlist{myBullets}{itemize}{1}

\setlist[myBullets]{
  label={\textbullet},
  leftmargin=*,
  topsep=0.51pt,
  partopsep=0ex,
  parsep=0ex,
  itemsep=0.48pt,
  before={\itshape}
}

\renewcommand{\workitem}[4] {
    \filldraw[content](#1,#2)circle(3pt)
    node[below right,
    align=left,
    outer sep=5pt,
    yshift=3mm,xshift=1mm,
    %preaction={fill, yellow}
    ] {
        #4
    }
    node[anchor=east,outer sep=1pt,inner sep=-1pt,xshift=-2mm,
    %preaction={fill, yellow}
    ] {
        \timelineyear{#3}
    };
}

\renewcommand{\contributionheading}[1]{
% used by contribution heading, work company
    \color{content}
    \fontsize{9pt}{12pt} % Font size
    \fontspec[Path = fonts/ubuntu/]{Ubuntu-M}\selectfont#1
}

\renewcommand{\contributionitem}[5]{
    \filldraw[content](#1,#2)circle(2pt)
    node[below right,
    outer sep=4pt,
    align=left,
    yshift=3.5mm,
    %preaction={fill, yellow}
    ] {
        \contributionheading{#3}\\
        \timelineyear{#4} -\space\space
        \href{#5}{ Link}
    }
    node[anchor=east,outer sep=20pt,
    %preaction={fill, yellow}
    ]{};
}

