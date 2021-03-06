% Author: Abid H. Mujtaba (Dept. of Physics, CIIT-Islamabad)
% Email: abid.mujtaba@comsats.edu.pk

% We define all style related instructions for formatting CIIT Dissertations inside this package

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ciit-dissertation}[2017/07/18 Standard CIIT class for Dissertations]

% This document class is derived from the book class:
\LoadClass[a4paper,12pt]{book}


\RequirePackage[toc,page]{appendix}
\RequirePackage[backend=biber,sorting=none]{biblatex}
\RequirePackage{colortbl}       % Used to change background color of table rows
\RequirePackage{emptypage}      % suppress page numbers of empty pages
\RequirePackage{enumitem}       % Change indentation of itemize and enumerate
\RequirePackage{fancyhdr}       % used to style the page numbers
\RequirePackage[margin=1in]{geometry}
\RequirePackage[double spacing]{set space}
\RequirePackage{tabularx}
\RequirePackage{xcolor}         % Used by colortbl and to change the color of text


% Rename the Bibliography title to read "References"
\DefineBibliographyStrings{english}{bibliography={References},}

% Ensure that ALL page numbers are in the footer on the right
\pagestyle{fancy}
% Clear the header and footer
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}      % Remove the horizontal line from the top
% Place the page number
\fancyfoot[R]{\thepage}

% We also need to redefine the style for chapter title pages
\fancypagestyle{plain}{%
    \renewcommand{\headrulewidth}{0pt}
    \fancyhf{}
    \fancyfoot[R]{\thepage}
}


\makeatletter

% Define a macro that takes two arguments. Only if the first is non-empty will the second be executed.
\newcommand{\ifnotempty}[2]{
    \ifx#1\empty                % if #1 is empty then (skipped to 'else' which is executed when #1 is non-empty)
    \else
        \expandafter#2          % \expandafter ensures that #2 is expanded after the conditional is evaluated so that the correct order is followed
    \fi
}

% Define constants that can be used by the author
\def\undergraduate{Undergraduate}
\def\graduate{Graduate}

% Define the global variables and macros for populating them. These are used to specify the content of the front matter.
\def\@dedication{}
\def\@acknowledgement{}
\def\@abstract{}
\def\@program{}
\def\@dissertationtype{}
\def\@session{}
\def\@submissiondate{}
\def\@department{}
\def\@campus{}
\def\@degreetype{}
\def\@supervisor{}
\def\@supervisordesignation{}
\def\@hod{}
\def\@hoddesignation{}
\def\@externalexaminer{}
\def\@externalexaminerdesignation{}
\def\@externalexaminerinstitution{}
\def\@externalexamineraddress{}

\newcommand{\registrationnumber}[1]{\def\@registrationnumber{#1}}
\newcommand{\dedication}[1]{\def\@dedication{#1}}
\newcommand{\acknowledgement}[1]{\def\@acknowledgement{#1}}
\newcommand{\abstract}[1]{\def\@abstract{#1}}
\newcommand{\program}[1]{\def\@program{#1}}
\newcommand{\dissertationtype}[1]{\def\@dissertationtype{#1}}
\newcommand{\session}[1]{\def\@session{#1}}
\newcommand{\submissiondate}[1]{\def\@submissiondate{#1}}
\newcommand{\department}[1]{\def\@department{#1}}
\newcommand{\campus}[1]{\def\@campus{#1}}
\newcommand{\degreetype}[1]{\def\@degreetype{#1}}
\newcommand{\supervisor}[1]{\def\@supervisor{#1}}
\newcommand{\supervisordesignation}[1]{\def\@supervisordesignation{#1}}
\newcommand{\hod}[1]{\def\@hod{#1}}
\newcommand{\hoddesignation}[1]{\def\@hoddesignation{#1}}
\newcommand{\externalexaminer}[1]{\def\@externalexaminer{#1}}
\newcommand{\externalexaminerdesignation}[1]{\def\@externalexaminerdesignation{#1}}
\newcommand{\externalexaminerinstitution}[1]{\def\@externalexaminerinstitution{#1}}
\newcommand{\externalexamineraddress}[1]{\def\@externalexamineraddress{#1}}

% Renew the \maketitle macro so that it creates the title pages we want:
\renewcommand{\maketitle}{
    % First title page
    \thispagestyle{empty}
    \begin{center}
        {\LARGE \@title}\\
        \vspace{1.5\baselineskip}
        \includegraphics[width=0.3\textwidth]{comsats-logo}
        \vspace{3\baselineskip}\\
        {\large \MakeUppercase{\@program}}\\
        {\large \@dissertationtype}\\
        \vspace{5\baselineskip}
        {\LARGE \setstretch{1.25} COMSATS Institute of Information\\ Technology, Islamabad\\[0.5\baselineskip] \@session \par}      % The \par at the end explicitly ends the paragraph so that the stretched line spacing is applied to the last line as well
    \end{center}

    % Second title page
    \cleardoublepage
    \thispagestyle{empty}
    \hspace{-2em}\includegraphics[width=0.125\textwidth]{comsats-logo}\\
    \begin{center}
        \vspace{-3.5\baselineskip}
        \hspace{4em}{\large \bfseries COMSATS Institute of Information Technology}\\
        \vspace{3\baselineskip}
        {\LARGE \@title}\\
        \vspace{3\baselineskip}
        {\large A \@dissertationtype { Presented to}}\\[\baselineskip]
        {\Large COMSATS Institute of Information Technology, Islamabad}\\[\baselineskip]
        {\large in partial fulfillment}\\
        {\large of the requirement for the degree of}\\
        \vspace{2\baselineskip}
        {\LARGE \@program}\\
        \vspace{\baselineskip}
        {by}\\[\baselineskip]
        {\large \@author}\\
        {\large \@registrationnumber}\\
    \end{center}

    % Third title page
    \cleardoublepage
    \thispagestyle{empty}
    \begin{center}
        {\large \@title}\\
        \vspace{\baselineskip}
        % ToDo: Choose the correct article based on the degree type by writing an 'if' based macro
        {\large An \@degreetype { }\@dissertationtype { submitted}\\ to the Department of}\\
        \vspace{\baselineskip}
        {\large \@department}\\
        \vspace{\baselineskip}
        {\large as partial fulfillment for the award of Degree}\\
        \vspace{\baselineskip}
        {\large \@program}
        \vspace{\baselineskip}
        \begin{table}[h]
            \def\arraystretch{2.5}
            \centering
            \begin{tabularx}{0.9\textwidth}{|>{\centering\Large}X|>{\Large\centering}X|}
                \hline
                \rowcolor{gray}
                \textcolor{white}{Name} & \textcolor{white}{Registration No.}\tabularnewline
                \hline
                \@author & \@registrationnumber\tabularnewline
                \hline
            \end{tabularx}
        \end{table}
    \end{center}

    \hspace{-1em}Supervisor:\\
    \vspace{-1\baselineskip}
    \begingroup
        \renewcommand{\labelitemi}{}        % Remove the bullets
        \begin{itemize}[leftmargin=*]       % Remove the left margin
            \setlength\itemsep{-0.3\baselineskip}       % Decrease the vertical space between items
            \item \@supervisor
            \item \@supervisordesignation
            \item Department of \@department,
            \item CIIT, \@campus { Campus}
        \end{itemize}
    \endgroup

    \vspace{1.5\baselineskip}
    \begin{flushright}
        \rule{0.25\textwidth}{1pt}\\
        \@author\\
        \@registrationnumber
    \end{flushright}

    % Fourth title page: Final Approval
    \cleardoublepage
    \thispagestyle{empty}
    \begin{center}
        {\large COMSATS Institute of Information Technology, \@campus}\\
        \vspace{\baselineskip}
        {\LARGE Final Approval}\\
        \rule[0.8\baselineskip]{0.9\textwidth}{1pt}\\
        {\large This thesis titled}\\
        \vspace{0.5\baselineskip}
        {\large \@title}\\
        \vspace{0.5\baselineskip}
        {\large submitted for the degree of \@program}\\
        % \vspace{0.5\baselineskip}
        {\large by}\\
        \vspace{0.5\baselineskip}
        {\large \@author}\\
        {\large \@registrationnumber}\\
        \vspace{0.5\baselineskip}
        {\large has been approved}\\
        {\large for COMSATS Institute of Information Technology, \@campus}\\
    \end{center}

    \begin{center}
        \vspace{1\baselineskip}
        External Examiner: \rule{0.25\textwidth}{1pt}\\
        \begingroup
            \setstretch{1}
            \@externalexaminer~\\
            \@externalexaminerdesignation~\\
            \@externalexaminerinstitution~\\
            \@externalexamineraddress~\\
        \endgroup

        \vspace{1.5\baselineskip}
        \begingroup
            \setstretch{1}
            Supervisor: \rule{0.25\textwidth}{1pt}\\
            \@supervisor~\\
            \@supervisordesignation~\\
            Department of \@department\\
            CIIT, \@campus\\
        \endgroup

        \vspace{1.5\baselineskip}
        Head of Department: \rule{0.25\textwidth}{1pt}\\
        \begingroup
            \setstretch{1}
            \@hod~\\
            \@hoddesignation~\\
            Department of \@department\\
            CIIT, \@campus\\
        \endgroup
    \end{center}

    % Fifth title page: Declaration
    \cleardoublepage
    \thispagestyle{empty}
    \vspace{\baselineskip}
    \begin{center}
        {\Large Declaration}
    \end{center}
    \vspace{\baselineskip}
    % ToDo: Choose between singular I and plural We based on number of authors
    {I}, hereby declare that this project neither as a whole not as a part there of has been copied out from any source. It is further declared that {I} have developed this \@dissertationtype { and} the accompanied report entirely on the basis of {my} personal efforts made under the sincere guidance of {my} {supervisor}. No portion of the work presented in this report has been submitted for any other degree of qualification of this or any other University or Institute of learning, if found {I} shall stand responsible.
    \vspace{0.5\baselineskip}
    \begin{flushleft}
        \@submissiondate\\
    \end{flushleft}
    \begin{flushright}
        \vspace{2\baselineskip}
        \@author\\
        \@registrationnumber
    \end{flushright}


    % Sixth title page: Certificate
    \cleardoublepage
    \thispagestyle{empty}
    \vspace{\baselineskip}
    \begin{center}{\Large Certificate}\end{center}
    \vspace{\baselineskip}
    {It is certified that \@author { (\@registrationnumber)} has carried out all the work related to this \@dissertationtype { under} my supervision at the Department of \@department, COMSATS Institute of Information Technology, \@campus { and} the work fulfills the requirements for award of \@program { degree}.\par}
    \vspace{\baselineskip}
    {\@submissiondate\par}
    \vspace{1.5\baselineskip}
    Supervisor:\\
    \vspace{1.5\baselineskip}
    \rule[-2\baselineskip]{0.25\textwidth}{1pt}
    \vspace{-1.75\baselineskip}
    \begingroup
        \renewcommand{\labelitemi}{}        % Remove the bullets
        \begin{itemize}[leftmargin=*]       % Remove the left margin
            \setlength\itemsep{-0.3\baselineskip}       % Decrease the vertical space between items
            \item \@supervisor
            \item \@supervisordesignation
            \item Department of \@department,
            \item CIIT, \@campus { Campus}
        \end{itemize}
    \endgroup

    \vspace{2\baselineskip}
    \hspace{-1em}Head of Department:\\
    \vspace{1.5\baselineskip}
    \rule[-2\baselineskip]{0.25\textwidth}{1pt}
    \vspace{-1.75\baselineskip}
    \begingroup
        \renewcommand{\labelitemi}{}
        \begin{itemize}[leftmargin=*]
            \setlength\itemsep{-0.3\baselineskip}
            \item \@hod
            \item \@hoddesignation
            \item Department of \@department,
            \item CIIT, \@campus
        \end{itemize}
    \endgroup
}


% Define the command for creating ALL of the front matter right up to the first chapter
\newcommand{\makefrontmatter}{

    \maketitle

    % Create the dedication page (but only if \@dedication is non-empty)
    \ifnotempty{\@dedication}{%
        \cleardoublepage            % Creates a new page ensuring that if needed an empty page is inserted to ensure the following is on an odd page
        \vspace*{3cm}               % Empty space above the dedication text
        \thispagestyle{empty}       % Remove all formatting and styling from the current page
        \begin{center}
            \Large \emph{\@dedication}      % The dedication is centered horizontally and is italicized
        \end{center}
    }

    % Consists of the Acknowledgement, Abstract .etc
    \frontmatter

    \ifnotempty{\@acknowledgement}{
        \cleardoublepage
        \chapter{Acknowledgement}
        \@acknowledgement
    }

    \ifnotempty{\@abstract}{
        \cleardoublepage
        \chapter{Abstract}
        \@abstract
    }

    \tableofcontents

    \addcontentsline{toc}{chapter}{List of Figures}
    \listoffigures

    % Declare that the main matter is starting
    \mainmatter

    % Set parskip for main matter
    \setlength{\parskip}{1em}
}


% Define command for creating the references
\newcommand{\makereferences}{

    \addcontentsline{toc}{chapter}{References}      % Add references to ToC
    \printbibliography
}

\makeatother
