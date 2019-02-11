\NeedsTeXFormat{LaTeX2e}
\LoadClassWithOptions{article}
\ProvidesClass{elsys-design}[2019-02-11 Class file for ELSYS designnotes assignments]

% ----- Options ---------------------------------------------------------------
\newcommand\@opanon{0}
\DeclareOption{anonymous}{\renewcommand\@opanon{1}}
\newcommand\@opnewpage{0}
\DeclareOption{newpage}{\renewcommand\@opnewpage{1}}
\newcommand\@oplargemargins{0}
\DeclareOption{largemargins}{\renewcommand\@oplargemargins{1}}
\ProcessOptions

% ----- Packages --------------------------------------------------------------

% Better fonts with accents
\RequirePackage{lmodern}
\RequirePackage[T1]{fontenc}
\RequirePackage{babel}
\setlength{\parindent}{0pt} 
\setlength{\parskip}{2ex}

% Pagesetup
\RequirePackage[utf8]{inputenc}
\RequirePackage{a4wide}


% Required for starred commands
\RequirePackage{suffix}

% Math and electronic symbols
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{mathrsfs}
\RequirePackage{centernot}
\RequirePackage{siunitx}
\RequirePackage{textcomp}
\RequirePackage{gensymb}

% Nice lists
\RequirePackage{enumerate}
\RequirePackage{enumitem}
\RequirePackage[font=small,labelfont=bf]{caption}
\RequirePackage{tabularx}
\RequirePackage{multirow}

% Nice images, figures, and listings
\RequirePackage{graphicx}
\RequirePackage{grffile}
\RequirePackage[all]{xy}
\RequirePackage{wrapfig}
\RequirePackage{fancyvrb}
\RequirePackage{listings}

% Drawing
\RequirePackage{pgf}
\RequirePackage{tikz}
\RequirePackage{pgfplots}
\pgfplotsset{compat=1.15}
\usetikzlibrary{arrows}

% Electronic drawing
\RequirePackage[european, american currents, american voltages,siunitx]{circuitikz}
\newcommand*{\eq}{=}


% Conditionals
\RequirePackage{ifthen}

% Header & Page Setup
%\RequirePackage[left=1in,right=1in,top=1in,bottom=1in]{geometry}
\RequirePackage{fancyhdr}
\ifthenelse{\equal{\@oplargemargins}{1}}{}{\RequirePackage{fullpage}}

% Links
\RequirePackage[hidelinks, pdftex, pdfborderstyle={/S/U/W 0}]{hyperref}


% ----- Titlevariables --------------------------------------------------------
\newcommand\heading[1]{\renewcommand\@heading{#1}}
\newcommand\@heading{}

\newcommand\version[1]{\renewcommand\@version{#1}}
\newcommand\@version{}



% ----- Reference commands --------------------------------------------------------

\newcommand{\figref}[1]{Figur \ref{#1}}
%\newcommand{\eqref}[1]{(\ref{#1})}


% ----- Page Setup ------------------------------------------------------------

% Use block style paragraphs
\setlength{\parindent}{0pt}
\setlength{\parskip}{5pt plus 1pt}

\def\indented#1{\list{}{}\item[]}
\let\indented=\endlist

% ------- Table of Contents -------

\newcommand{\toc}{
  \setlength{\parskip}{0ex}
  \renewcommand{\baselinestretch}{0.1}\normalsize
  \tableofcontents
  \renewcommand{\baselinestretch}{1.00}\normalsize
  \setlength{\parskip}{2ex}
  \rule{\textwidth}{1pt}
} 

% ----- Title & Header --------------------------------------------------------
\pagestyle{empty}
\pagestyle{plain}

\renewcommand{\maketitle}[0]{%
  \begin{minipage}[c]{0.15\textwidth}
  \includegraphics[width=2.0cm]{elsys_pos_staaende_ntnu}  
  \end{minipage}
  \begin{minipage}[c]{0.85\textwidth}

  \renewcommand{\arraystretch}{1.7}
  \large 
  \begin{tabularx}{\textwidth}{|X|X|}
  \hline
  \multicolumn{2}{|l|}{} \\
  \multicolumn{2}{|l|}{\huge \textbf{\@heading}} \\
  \multicolumn{2}{|l|}{}  \\
  \hline
  \multicolumn{2}{|l|}{Tittel: 
  %Skriv inn tittel her:------------------------------------------
  \@title
  } \\
  \hline
  \multicolumn{2}{|l|}{Forfattere: 
  %Skriv inn forfattere her:--------------------------------------
  \@author
  } \\
  \hline
  %Skriv inn versjon og dato her her:-----------------------------
  Versjon: \@version & Dato: \@date
  \\
  \hline 
  \end{tabularx}
  \end{minipage}
  \normalsize
}

% ----- For usage with pandoc converted documents -----------------------------

\providecommand{\tightlist}{%
  \setlength{\itemsep}{0pt}\setlength{\parskip}{0pt}}

% -----------------------------------------------------------------------------
