\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2015/05/25 An elegant Résumé class]
\LoadClass{article}

% disable indent globally
\setlength{\parindent}{0pt}
\RequirePackage{xifthen}
\RequirePackage{etoolbox}
% use hyperlink for email and url
\RequirePackage[breaklinks]{hyperref}
% use fontawesome
\RequirePackage{fontawesome}
% use xcolor for customizing color
\RequirePackage[usenames,dvipsnames]{xcolor}
% loading fonts
\RequirePackage{fontspec}
% palatino font
\setmainfont{TeX Gyre Pagella}
\urlstyle{same}
% publications, use \fullcite
\RequirePackage[style=numeric,sorting=none,backend=biber]{biblatex}
\addbibresource{pub.bib}

\RequirePackage[
	a4paper,
	left=0.60in,
	right=0.60in,
	top=0.50in,
	bottom=0.50in,
	nohead
]{geometry}

\RequirePackage{titlesec}
\RequirePackage{enumitem}
\setlist{noitemsep} % removes spacing from items but leaves space around the whole list
\setlist{nosep} % removes all vertical spacing within and around the list
\newcommand{\configureList}[1]{\setlist[#1]{topsep=0.1em, leftmargin=1.25pc, parsep=0.25ex}}
\configureList{itemize}
\configureList{enumerate}
\RequirePackage[super]{nth}

\titleformat{\section}         % Customise the \section command 
  {\Large\scshape\raggedright} % Make the \section headers large (\Large),
                               % small capitals (\scshape) and left aligned (\raggedright)
  {}{0em}                      % Can be used to give a prefix to all sections, like 'Section ...'
  {}                           % Can be used to insert code before the heading
  [\titlerule]                 % Inserts a horizontal line after the heading
\titlespacing*{\section}{0cm}{*0.5}{*0.5}

\titleformat{\subsection}
  {\large\raggedright}
  {}{0em}
  {}
\titlespacing*{\subsection}{0cm}{*0.5}{*0.2}

\newcommand{\resumeHref}[2]{\underline{\href{#1}{#2}}}

\newcommand{\datedsection}[2]{%
  \section[#1]{#1 \hfill \resumeHref{#2}{\faGithub}}%
}
\newcommand{\datedsubsection}[2]{%
  \subsection[#1]{#1 \hfill #2}%
}
\newcommand{\datedsubsectionLinked}[2]{%
  \datedsubsection{#1}{\resumeHref{#2}{\faGithub}}%
}
\newcommand{\datedline}[2]{%
  {\par #1 \hfill #2 \par}%
}

% defines one's name
% usage: \name{<name>}
\newcommand{\name}[1]{
  \centerline{\Huge\scshape{#1}}
  \vspace{1.2ex}
}

% defines one's email
% usage: \email{<email>}
\newcommand{\email}[1]{\faEnvelope\ \href{mailto:#1}{#1}}
% defines one's phone
% usage: \phone{<phone>}
\newcommand{\phone}[1]{\faPhone\ {#1}}
% defines one's linkedin
% usage: \linkedin{<linkedin>}
\newcommand{\linkedin}[2][]{\faLinkedin\ 
  \ifthenelse{\isempty{#1}}%
    {\href{#2}{#2}}
    {\href{#2}{#1}}}
% defines one's GitHub
% usage: \github{<github>}
\newcommand{\github}[2][]{\faGithub\ 
  \ifthenelse{\isempty{#1}}%
    {\href{#2}{#2}}
    {\href{#2}{#1}}}
% defines one's homepage
% usage: \homepage{<homepage>}
\newcommand{\homepage}[2][]{\faLink\ 
  \ifthenelse{\isempty{#1}}%
    {\href{#2}{#2}}
    {\href{#2}{#1}}}

\newcommand{\basicInfo}[1]{
  \centerline{\large{#1}}
  \vspace{0.20ex}
}

\newcommand{\role}[2]{
  {\par \textit{#1} ~ #2 \par}
}

