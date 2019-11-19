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
\RequirePackage[fixlanguage]{babelbib}
\setlength{\parindent}{0pt} 
\setlength{\parskip}{2ex}

% Pagesetup
\RequirePackage[utf8]{inputenc}
\RequirePackage{a4wide}

% Mikrotypografiske optimeringer
\RequirePackage[babel=true]{microtype}

% Required for starred commands
\RequirePackage{suffix}

% Math and electronic symbols
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{mathrsfs}
\RequirePackage{centernot}
\RequirePackage{textcomp}
\RequirePackage{gensymb}

\RequirePackage{siunitx}
\sisetup{
exponent-product = \cdot,
output-decimal-marker  =  {,}, % Pass på å endre desimalskilletegnet til punktum om du skriver på engelsk!
separate-uncertainty = true,
per-mode = symbol,
group-digits = false,
}

% Nice lists
\RequirePackage{enumerate}
\RequirePackage{enumitem}
\RequirePackage[font=small,labelfont=bf]{caption}
\RequirePackage{tabularx}
\RequirePackage{multirow}

% Nice images, figures, and listings
% Figurer og tabeller
\RequirePackage{graphicx} % Denne pakken er standard for å kunne laste inn figurfiler med ulike formater
% Løsne opp på de alt for strenge standardinstillingene for plassering av figurer og tabeller (floats) i LaTeX-kjernen
\renewcommand{\topfraction}{.85}
\renewcommand{\bottomfraction}{.7}
\renewcommand{\textfraction}{.15}
\renewcommand{\floatpagefraction}{.66}
\setcounter{topnumber}{3}
\setcounter{bottomnumber}{2}
\setcounter{totalnumber}{10}

\RequirePackage{flafter} % For å plassere floats i PDFen første sted LaTeX tillater etter det punktet de er definert i TeX-filen. Om du definerer figuren i TeX-filen rett etter at du refererer til den for første gang vil denne pakken sørge for at de fleste floats havner på greie steder
\RequirePackage{booktabs} % Denne pakken gir tilgang på endel ekstra kommandoer som legger til rette for god skikk og bruk i tabellformatering.
\RequirePackage{multirow}
\RequirePackage[font=small,labelfont=bf]{caption} % Justering av LaTeX standarder for figurtekst og tabelltekst.
\RequirePackage{grffile}
\RequirePackage[all]{xy}
\RequirePackage{wrapfig}
\RequirePackage{fancyvrb}
\RequirePackage{listings}
\RequirePackage{listingsutf8}
\RequirePackage{subfig}
\RequirePackage{mathtools}% automatically loads amsmath
\RequirePackage{lipsum}

% Drawing
\RequirePackage{pgf}
\RequirePackage{tikz}
\RequirePackage{pgfplots}
\pgfplotsset{compat=1.15}
\usetikzlibrary{arrows}

% Electronic drawing
\RequirePackage[european, american currents, american voltages,siunitx]{circuitikz}
\tikzset{opampdownlbl/.style={
    below,
    draw=none,
    append after command={
      (\tikzlastnode.north) edge ([shift={(-5pt,0pt)}]\tikzlastnode.north)
        edge ([shift={(+5 pt,0 pt)}]\tikzlastnode.north)
    }},
  opampuplbl/.style ={
    above,
    draw=none,
    append after command={
      (\tikzlastnode.south) edge ([shift={(-5pt,0pt)}]\tikzlastnode.south)
        edge ([shift={(+5pt,0pt)}]\tikzlastnode.south)
    }}
}
\newcommand*{\eq}{=}


% Conditionals
\RequirePackage{ifthen}

% Header & Page Setup
%\RequirePackage[left=1in,right=1in,top=1in,bottom=1in]{geometry}
\RequirePackage{fancyhdr}
\ifthenelse{\equal{\@oplargemargins}{1}}{}{\RequirePackage{fullpage}}

% Links
\RequirePackage[colorlinks=true,allcolors=blue, hidelinks, pdftex, pdfborderstyle={/S/U/W 0}]{hyperref}
% Noen av navnene for autoreferanser mangler på norsk, så vi ordner opp i det.
\addto\extrasnorsk{%
\def\figureautorefname{figur}%
\def\tableautorefname{tabell}%
\def\sectionautorefname{avsnitt}%
\def\subsectionautorefname{underavsnitt}%
\def\appendixautorefname{vedlegg}
}
% Vi endrer fonten som brukes for URLer til den vanlige tekstfonten.
\urlstyle{same}


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
