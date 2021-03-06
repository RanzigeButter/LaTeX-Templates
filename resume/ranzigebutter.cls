% ==============================================================================
%  ____                 _            ____        _   _
% |  _ \ __ _ _ __  ___(_) __ _  ___| __ ) _   _| |_| |_ ___ _ __
% | |_) / _` | '_ \|_  / |/ _` |/ _ \  _ \| | | | __| __/ _ \ '__|
% |  _ < (_| | | | |/ /| | (_| |  __/ |_) | |_| | |_| ||  __/ |
% |_| \_\__,_|_| |_/___|_|\__, |\___|____/ \__,_|\__|\__\___|_|
%                         |___/
% ==============================================================================
\ProvidesClass{ranzigebutter}[RanzigeButter Resume]
\LoadClass{scrartcl}
\NeedsTeXFormat{LaTeX2e}
% ==============================================================================

% Table of Contens
% 1. General
% 2. Layout
% 3. Fonts
% 4. Colors
% 5. Styles
% 6. Miscellaneous
% 7. Commands

% ==============================================================================
% 1. General
% ==============================================================================

\RequirePackage[hidelinks, unicode]{hyperref}
\RequirePackage{bookmark}
\hypersetup {
  pdfstartview = {FitV},
  pdfview = {FitH},
  pdffitwindow = true,
  pdftitle = {Tim Schneider - Resume},
  pdfauthor = {Tim Schneider}
}

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[english]{babel}

% ==============================================================================
% 2. Layout
% ==============================================================================

\RequirePackage[
  top=1.5cm,
  bottom=2cm,
  left=2cm,
  right=2cm,
  nohead,
  footskip=0.5cm
]{geometry}

\setlength{\parskip}{0pt}

\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}

% ==============================================================================
% 3. Fonts
% ==============================================================================

% Font - Packages
% ==================================================

\RequirePackage[default]{opensans}
\RequirePackage{merriweather}
\RequirePackage{fontawesome}

% Font - Aliases
% ==================================================

\newcommand*{\fontHeading}{\merriweather}

% ==============================================================================
% 4. Colors
% ==============================================================================

% Colors - Packages
% ==================================================

\RequirePackage{xcolor}
\RequirePackage{pagecolor}

% Colors - Definition
% ==================================================

\definecolor{color__white}{HTML}{ffffff}
\definecolor{color__grey}{HTML}{9e9e9e}
\definecolor{color__black}{HTML}{101016}

% Colors - Set
% ==================================================

\pagecolor{color__white}
\color{color__black}

% ==============================================================================
% 5. Styles
% ==============================================================================

% Style - Name
% ==================================================

\newcommand*{\resumeStyleName}[1]{
  \fontHeading
  \fontsize{28pt}{1em}
  \color{color__black}
  \textbf{#1}
}

% Style - Personal Informations
% ==================================================

\newcommand*{\resumeStyleData}[2]{
  {\leavevmode\color{color__black}#1}
  &
  {#2}\\
}

% Style - Section
% ==================================================

\renewcommand*{\section}[1]{
  {
    \par\addvspace{24pt}
    \fontHeading
    \fontsize{18pt}{0em}
    \color{color__black}
    \textbf{#1}
    \vhrulefill{2pt}
    \par\nobreak\addvspace{10pt}
  }
}

% Style - Entry
% ==================================================

\setlength{\tabcolsep}{10pt}
\renewcommand*{\arraystretch}{2}

\newcommand*{\resumeStyleEntry}[2]{
  \parbox[b]{\hsize}{\raggedleft\color{color__black}#1}
  &
  \parbox[t]{\hsize}{#2}\\
}

% Style - Footer
% ==================================================

\newcommand*{\resumeStyleFooter}[1]{
  {
    \fontsize{10pt}{1em}
    \selectfont
    \color{color__grey}
    #1
  }
}

% ==============================================================================
% 6. Miscellaneous
% ==============================================================================

% Images
% ==================================================

\RequirePackage{tikz}

% Spreadsheets
% ==================================================

\RequirePackage{tabularx}
\newcolumntype{L}[1]{>{\raggedright\arraybackslash}p{#1}}
\newcolumntype{C}[1]{>{\centering\arraybackslash}p{#1}}
\newcolumntype{R}[1]{>{\raggedleft\arraybackslash}p{#1}}

% Utility
% ==================================================

\RequirePackage{xifthen}

\def\vhrulefill#1{\leavevmode\leaders\hrule\@height#1\hfill \kern\z@}

% ==============================================================================
% 7. Commands
% ==============================================================================

% Commands - Personal Informations
% ==================================================

\newcommand*{\resumePicture}[1]{\renewcommand{\resumePicture}{#1}}
\newcommand*{\resumeName}[1]{\renewcommand{\resumeName}{#1}}
\newcommand*{\resumeBirthdate}[1]{\renewcommand{\resumeBirthdate}{#1}}
\newcommand*{\resumeAdress}[1]{\renewcommand{\resumeAdress}{#1}}
\newcommand*{\resumePhone}[1]{\renewcommand{\resumePhone}{#1}}
\newcommand*{\resumeEMail}[1]{\renewcommand{\resumeEMail}{#1}}
\newcommand*{\resumeWebsite}[1]{\renewcommand{\resumeWebsite}{#1}}

% Commands - Header
% ==================================================

\newcommand*{\makeHeader}{

  % Commands - Header - Name
  % ==================================================

  \newcommand*{\makeName}{
    {\resumeStyleName\resumeName}
    \vspace{20pt}
  }

  % Commands - Header - Personal Informations
  % ==================================================

  \newcommand*{\makeData}{
    \setlength{\tabcolsep}{5pt}
    \renewcommand*{\arraystretch}{1.5}

    \begin{tabularx}{\linewidth}{R{0.5cm}X}
      % Date of Birth
      \ifthenelse{\equal{\resumeBirthdate}{}}
        {}
        {\resumeStyleData{\faBirthdayCake}{\resumeBirthdate}}
      % Adress
      \ifthenelse{\equal{\resumeAdress}{}}
        {}
        {\resumeStyleData{\faHome}{\resumeAdress}}
      % Phone
      \ifthenelse{\equal{\resumePhone}{}}
        {}
        {\resumeStyleData{\faPhone}{\resumePhone}}
      % E-Mail
      \ifthenelse{\equal{\resumeEMail}{}}
        {}
        {\resumeStyleData{\faEnvelope}{\href{mailto:\resumeEMail}{\resumeEMail}}}
      % Website
      \ifthenelse{\equal{\resumeWebsite}{}}
        {}
        {\resumeStyleData{\faGlobe}{\href{https://\resumeWebsite}{\resumeWebsite}}}
    \end{tabularx}
  }

  % Commands - Header - Picture
  % ==================================================

  \newlength\resumeWidthPicture
  \pgfmathsetlength{\resumeWidthPicture}{5.5cm}

  \newcommand*{\makePicture}{
    \raggedleft\begin{tikzpicture}
      \color{color__grey}\draw (0, 0) circle (\resumeWidthPicture/2+0.3cm);
      \clip (0, 0) circle (\resumeWidthPicture/2);
      \node[
        anchor=north west,
        inner sep=0pt,
        outer sep=0pt
      ] at (-\resumeWidthPicture/2, \resumeWidthPicture/2) {
        \includegraphics[width=\resumeWidthPicture]{\resumePicture}
      };
    \end{tikzpicture}
  }

  % Commands - Header - Layout
  % ==================================================

  \begin{minipage}[c]{0.6\linewidth}
    \makeName
    \makeData
  \end{minipage}
  \begin{minipage}[c]{0.39\linewidth}
    \makePicture
  \end{minipage}

}

% Commands - Entry
% ==================================================

\newcommand*{\resumeEntry}{\resumeStyleEntry}

% Commands - Footer
% ==================================================

\newcommand*{\makeFooter}[3]{
  \fancyfoot[L]{\resumeStyleFooter{#1}}
  \fancyfoot[C]{\resumeStyleFooter{#2}}
  \fancyfoot[R]{\resumeStyleFooter{#3}}
}
