%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ProvidesClass{friggeri-cv}[2012/04/30 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}


%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}
\definecolor{black}{RGB}{0,0,0}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}

\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}
\definecolor{pblue}{HTML}{0395DE}
\definecolor{earthblue}{HTML}{0000A0}

\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\else
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{black}

%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage{fontspec}
\RequirePackage{unicode-math}

% phone symbol
% \RequirePackage{fontawesome5}

\renewcommand*\familydefault{\sfdefault}
%newfontfamily\bodyfont[]{libertine}
% \RequirePackage{libertine}
% \newfontfamily\bodyfont[
%   Color=textcolor,
%   Ligatures=TeX,
%   BoldFont=LinLibertine_RB.otf,
%   ItalicFont=LinLibertine_RI.otf,
%   BoldItalicFont=LinLibertine_RBI.otf
% ]{LinLibertine_R.otf}

\newfontfamily\thinfont[]{Lato-Light.ttf}
\newfontfamily\headingfont[]{texgyreheros-bold.otf}


% \setmainfont[
%   Color=textcolor,
%   Ligatures=TeX,
%   BoldFont=LinLibertine_RB.otf,
%   ItalicFont=LinLibertine_RI.otf,
%   BoldItalicFont=LinLibertine_RBI.otf
% ]{LinLibertine_R.otf}


%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}

\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \thinfont%
  \color{white}%
}

\newcommand{\header}[2]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=4cm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      \fontsize{30pt}{62pt}\color{header}%
      %{\thinfont #1}~{\headingfont #2}
      {\thinfont #1~#2}
    };
%    \node [anchor=north] at (name.south) {%
%      \fontsize{14pt}{24pt}\color{pblue}%
%      \bodyfont #3%
%    };
  \end{tikzpicture}
  % \vspace{0.5cm}
  \vspace{-3\parskip}
}


%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}

% color change in section headers:
%\newcounter{colorCounter}
%\def\@sectioncolor#1#2#3{%
%  {%
%    \color{%
%      \ifcase\value{colorCounter}%
%        blue\or%
%        red\or%
%        orange\or%
%       green\or%
%        purple\else%
%        headercolor\fi%
%    } #1#2#3%
%  }%
%  \stepcounter{colorCounter}%
%}

%\newcounter{colorCounter}
%\def\@sectioncolor#1#2#3{%
%  {%
%    \color{%
%      \ifcase\value{colorCounter}%
%        pblue\or%
%        pblue\or%
%        pblue\or%
%        pblue\or%
%        pblue\else%
%        pblue\fi%
%    } #1#2#3%
%  }%
%  \stepcounter{colorCounter}%
%}

% Section command
\renewcommand{\section}[1]{
  \par\vspace{.5\parskip}
  {\LARGE\headingfont\color{headercolor}#1}
  \par\vspace{.25\parskip}
}

% subsection command
\renewcommand{\subsection}[1]{
  \par\vspace{.5\parskip}
  {\large\headingfont\color{headercolor}#1}
  % \par\vspace{0.15\parskip}
  \par\vspace{2\parskip}
}

\pagestyle{empty}


%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{3pt}
\RequirePackage{longtable}
\newenvironment{entrylist}{%
  \begin{longtable}{@{\extracolsep{\fill}}rl}
}
{
  \end{longtable}
}
%\newcommand{\bfseriesfoo}{\headingfont\color{headercolor}}
\newcommand{\entry}[4]{%
  {\thinfont\color{headercolor} #1} & \parbox[t]{.83\textwidth}{%
    \hspace{0pt}{\headingfont\color{headercolor}{#2}}%
    \hfill%
    {\thinfont\small\color{headercolor} #3}\\%
    {\color{textcolor}#4}\vspace{\parsep}%
  }\\
}
\newcommand{\entrysoft}[4]{%
  {\thinfont\color{headercolor} #1} & \parbox[t]{.83\textwidth}{%
    \hspace{0pt}{\color{headercolor}{#2}}%
    \hfill%
    {\thinfont\scriptsize\color{headercolor} #3}\\%
    {\color{textcolor}#4}\vspace{\parsep}%
  }\\
}


%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

%\RequirePackage[absolute,overlay]{textpos}
%\setlength{\TPHorizModule}{1cm}
%\setlength{\TPVertModule}{1cm}
%\newenvironment{aside}{%
%  \let\oldsection\section
%  \renewcommand{\section}[1]{
%    \par\vspace{\baselineskip}{\Large\headingfont\color{pblue} ##1}
%  }
%  \begin{textblock}{3.6}(1.1, 0.55)
%  \begin{flushright}
%  \obeycr
%}{%
%  \restorecr
%  \end{flushright}
%  \end{textblock}
%  \let\section\oldsection
%}


%%%%%%%%%%%%%%%%
% Bibliography %
%%%%%%%%%%%%%%%%

% \RequirePackage[style=numeric, defernumbers=true, maxnames=99, backend=biber]{biblatex}
% \RequirePackage[style=numeric, defernumbers=true, maxnames=99, backend=biber, sort=myorder]{biblatex}
\RequirePackage[
  backend=biber,
  defernumbers=true,
  sorting=myorder,
  style=numeric,
  maxnames=99,
]{biblatex}
% \RequirePackage[style=numeric, defernumbers=true, maxnames=99]{biblatex}
\setlength\bibhang{0pt}

% Reverse order of publication number/label printed
% Count total number of entries in each refsection
\AtDataInput{%
  \csnumgdef{entrycount:\therefsection}{%
    \csuse{entrycount:\therefsection}+1}}

% Print the labelnumber as the total number of entries in the
% current refsection, minus the actual labelnumber, plus one
\DeclareFieldFormat{labelnumber}{\mkbibdesc{#1}}
\newrobustcmd*{\mkbibdesc}[1]{%
  \number\numexpr\csuse{entrycount:\therefsection}+1-#1\relax}



\defbibenvironment{bibliography}{%
  \list
    % {\printfield[labelnumberwidth]{labelnumber}}
    {\mkbibdesc{\thefield{labelnumber}}.}
    {%
      \setlength{\labelwidth}{\labelnumberwidth}%
      \setlength{\leftmargin}{\labelwidth}%
      \setlength{\labelsep}{\biblabelsep}%
      \addtolength{\leftmargin}{\labelwidth}% <- Changed
      \setlength{\itemsep}{\bibitemsep}%
      \setlength{\parsep}{\bibparsep}%
    }%
  \renewcommand*{\makelabel}[1]{\hss##1}%
}
{\endlist}
{\item}

\DeclareFieldFormat[article]{title}{#1\par}
\DeclareFieldFormat[book]{title}{#1\par}
\DeclareFieldFormat[inproceedings]{title}{#1\par}
\DeclareFieldFormat[misc]{title}{#1\par}
\DeclareFieldFormat[report]{title}{#1\par}

\def\newblock{\hskip 0pt plus 0pt minus 0pt}

\renewcommand*{\finentrypunct}{\ifboolexpr{togl {bbx:doi} and not test {\iffieldundef{doi}}}{}{}}

\DeclareBibliographyDriver{article}{%
  \printfield{title}%
  \nopagebreak\newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=gray}\itshape%
    \usebibmacro{journal+issuetitle}%
    % \usebibmacro{journal+issueyear}%
    % \printfield{journal}%
    % \setunit{\space}%
    % (\printfield{year})%
    \setunit{\space}%
    \printfield{pages}%
    \newunit%
    \printlist{publisher}%
    %\setunit*{\addcomma\space}%
    \setunit{\space}%
  }
  {\footnotesize\hfill
    \textcolor{gray}{\printfield{doi}}
  }
  \newunit%
  \finentry%
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{book}{%
  \printfield{title}%
  \nopagebreak\newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=gray}\itshape%
    \printlist{publisher}%
    \setunit*{\addcomma\space}%
    \printfield{note}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    \newunit%
    \finentry%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{inproceedings}{%
  \printfield{title}%
  \nopagebreak\newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=gray}%
    \printfield{booktitle}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    \newunit%
    \finentry%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{misc}{%
  \printfield{title}%
  \nopagebreak\newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=gray}\itshape%
    \printfield{booktitle}%
    \setunit*{\addcomma\space}%
    \printfield{note}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    \newunit%
    \finentry%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{report}{%
  \printfield{title}%
  \nopagebreak\newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=gray}\itshape%
    \printfield{type}%
    \setunit{\space}%
    \printfield{number}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \newunit%
    \finentry%
  }
  \par\vspace{0.3\baselineskip}
}

\renewcommand*{\mkbibnamegiven}[1]{%
  \ifitemannotation{highlight}
    {\color{red}\textbf{#1}}
    {#1}}

\renewcommand*{\mkbibnamefamily}[1]{%
  \ifitemannotation{highlight}
    {\color{red}\textbf{#1}}
    {#1}}

% biblatex name formatting changed with version 3.3.
% After this change the line "\ifblank{#3}{}{#3\space}#1%" gives an error.
% See also: http://tex.stackexchange.com/questions/327316/updating-friggeris-cv-making-it-work-with-texlive-2015-and-up-too-many-erro



\DeclareNameFormat{author}{%
  \small
  % \ifthenelse
  \nameparts{#1}%
  \addfontfeature{Color=gray}%
  {\ifthenelse{\equal{\namepartfamily}{Pasquier}}
    {\bf}{}%
  \ifblank{\namepartgiven}{}{\namepartgiven\space}\namepartfamily}%
  \ifthenelse{\value{listcount}<\value{liststop}}
    {\addcomma\space}
    {}%
}

% Astreisk
\defbibheading{subbibliography}[\refname]{\section{#1}}

\newcommand{\printbibsection}[4]{
  \begin{refsection}
    \nocite{*}
    % \newrefcontext[sorting=myorder]
    % \printbibliography[type={#1}, title={#2}, heading=section]
    \csnumgdef{entrycount:\therefsection}{#3}
    \section{#2}
    #4
    \printbibliography[type={#1}, heading=none]
  \end{refsection}
}

\DeclareSortingScheme{myorder}{
  \sort[direction=descending]{\field{sortyear}}
  \sort[direction=descending]{\field{year}}
  \sort[direction=descending]{\field{month}}
  % \sort[direction=descending]{
  %   \field{sortyear}
  %   \field{year}
  %   \field{month}
  % }
  % \sort{\field{label}}
}

% \DeclareSortingTemplate{myorder}{
%   \sort{
%     \field{presort}
%   }
%   \sort[final]{
%     \field{sortkey}
%   }
%   \sort[direction=descending]{
%     \field[strside=left,strwidth=7]{sortyear}
%     \field[strside=left,strwidth=4]{year}
%   }
%   \sort{
%     \field{sortname}
%     \field{author}
%     \field{editor}
%     \field{translator}
%     \field{sorttitle}
%     \field{title}
%   }
%   \sort{\citeorder}
% }


%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[left=2cm,top=3cm,right=2cm,bottom=2cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}
\urlstyle{same}