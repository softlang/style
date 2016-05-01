%*******************************************************************************
%  softlang.cls
%
%  Latex Dokumentenvorlage der
%  Arbeitsgruppe Softwaresprachen (Software Languages Team)
%
%  Dank an Detlev Droege und Matthias Biedermann
%
%  adaptiert von
%  templateSE.cls 2006-03-28  v1.0  Philipp Schaer (Erste Version)
%  cgSA.cls 2006-01-17  v1.2  M. Biedermann (neues FB4-Layout fÃ¼r SA, Einzelarbeit)
%  2007-06-06 Thomas Lempa (FB4-Layout fÃ¼r SA und DA)
%  2007-12-21 Michael T. Boos (Erweiterung für Projektpraktikum)
%  2007-12-21 Michael T. Boos UTF8 changed to latin1
%  2008-05-14 Nico Jahn (FB-4 Layout für Skripte, Seminararbeiten und DA, SA, BA, MA überarbeitet)
%  2012-10-30 Michael Ruster back to UTF8, use of hyphens in unknown words put together from two known
%  2015-12-25 Matthias Paul (Erweiterung für das Software Languages Team)
%
%*******************************************************************************

%--- Identification ------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{softlang}[2015/12/25 v1.3]

%--- Initial code --------------------------------------------------------------

\RequirePackage{ifthen}
\newboolean{@isScr}
\newboolean{@isSem}
\newboolean{@isProSem}
\newboolean{@isPP}
\newboolean{@isSA}
\newboolean{@isDA}
\newboolean{@isBA}
\newboolean{@isMA}
\newboolean{@isFemale}
\newboolean{@isTimes}
\newboolean{@isPalatino}
\newboolean{@isExtern}
\newboolean{@isSingle}
\newboolean{@isOneHalf}
\newboolean{@isDouble}

%--- Declaration of options ----------------------------------------------------

\DeclareOption{scr}{\setboolean{@isScr}{true}}
\DeclareOption{sem}{\setboolean{@isSem}{true}}
\DeclareOption{prosem}{\setboolean{@isProSem}{true}}
\DeclareOption{pp}{\setboolean{@isPP}{true}}
\DeclareOption{sa}{\setboolean{@isSA}{true}}
\DeclareOption{diplom}{\setboolean{@isDA}{true}}
\DeclareOption{msc}{\setboolean{@isMA}{true}}
\DeclareOption{bsc}{\setboolean{@isBA}{true}}
\DeclareOption{w}{\setboolean{@isFemale}{true}}
\DeclareOption{m}{\setboolean{@isFemale}{false}}
\DeclareOption{times}{\setboolean{@isTimes}{true}}
\DeclareOption{palatino}{\setboolean{@isPalatino}{true}}
\DeclareOption{twoside}{\PassOptionsToClass{twoside,openright}{book}}
\DeclareOption{oneside}{\PassOptionsToClass{oneside}{book}}
\DeclareOption{extern}{\setboolean{@isExtern}{true}}
\DeclareOption{10pt}{\PassOptionsToClass{10pt}{book}}
\DeclareOption{11pt}{\PassOptionsToClass{11pt}{book}}
\DeclareOption{12pt}{\PassOptionsToClass{12pt}{book}}
\DeclareOption{single}{\setboolean{@isSingle}{true}}
\DeclareOption{onehalf}{\setboolean{@isOneHalf}{true}}
\DeclareOption{double}{\setboolean{@isDouble}{true}}

%--- Execution of options ------------------------------------------------------

\ProcessOptions

%--- Package loading -----------------------------------------------------------

\LoadClass[a4paper,titlepage]{book}
\RequirePackage[ngerman,english]{babel}                       % Unterstuetzung neue deutsche Rechtschreibung
\RequirePackage{csquotes}                      
\RequirePackage[T1]{fontenc}                          % Silbentrennung auch bei Worten mit Umlauten
\RequirePackage[utf8]{inputenc}                       % Unterstuetzung von Umlauten und Sonderzeichen
\RequirePackage[ngerman=ngerman-x-latest]{hyphsubst}  % Silbentrennung bei unbekannten zusammengesetzten Worten
\RequirePackage{graphicx}                             % fuer Einbindung von Grafiken
\RequirePackage{graphics}                             % fuer Einbindung von Grafiken
\RequirePackage{tabularx}                             % flexible Gestaltung von Tabellen
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{amsmath}
\RequirePackage{color}                                % Unterstuetzung für Farben
\RequirePackage{setspace}                             % Zeilenabstand Ändern
\RequirePackage{fancyhdr}                             % Schicke Kopfzeilen
\RequirePackage[colorlinks=true,linkcolor=black, citecolor = black,pdfpagemode = none,urlcolor=blue,pdfstartview=FitH,pdfhighlight={/P}]{hyperref}
% \RequirePackage{bibgerm}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Default: Computer Modern (TeX-Standard)

\ifthenelse{\boolean{@isTimes}}{%
  \RequirePackage{times}                        % Schriftart Times New Roman
}{}

\ifthenelse{\boolean{@isPalatino}}{%
  \RequirePackage{palatino}                     % Schriftart Book Antiqua/Palatino
}{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%--- Code ----------------------------------------------------------------------

\renewcommand{\contentsname}{T\lowercase{able of} C\lowercase{ontents}}

\def\@studiengang{}
\newcommand{\studiengang}[1]{\def\@studiengang{#1}}

\def\@dozent{}
\newcommand{\dozent}[1]{\def\@dozent{#1}}

\def\@dozentInfo{}
\newcommand{\dozentInfo}[1]{\def\@dozentInfo{#1}}

\def\@erstgutachter{}
\newcommand{\erstgutachter}[1]{\def\@erstgutachter{#1}}

\def\@erstgutachterInfo{}
\newcommand{\erstgutachterInfo}[1]{\def\@erstgutachterInfo{#1}}

\def\@zweitgutachter{}
\newcommand{\zweitgutachter}[1]{\def\@zweitgutachter{#1}}

\def\@zweitgutachterInfo{}
\newcommand{\zweitgutachterInfo}[1]{\def\@zweitgutachterInfo{#1}}

\def\@drittgutachter{}
\newcommand{\drittgutachter}[1]{\def\@drittgutachter{#1}}

\def\@drittgutachterInfo{}
\newcommand{\drittgutachterInfo}[1]{\def\@drittgutachterInfo{#1}}

\newcommand{\abgabe}{%
  \ifcase\month\or Januar\or Februar\or M{\"a}rz\or April\or Mai\or Juni\or
  Juli\or August\or September\or Oktober\or November\or Dezember \fi\
  \number\year }

%%% save original offsets

\newlength{\voffsetBackup} \setlength{\voffsetBackup}{\voffset}

\newlength{\hoffsetBackup} \setlength{\hoffsetBackup}{\hoffset}

%%% preserve backslash (conflict with using \raggedleft

\newcommand{\PBS}[1]{\let\temp=\\#1\let\\=\temp}

%%% new titlepage
\renewcommand{\maketitle}{

%%%  Titelseite  %%%
 \setlength{\voffset}{-.5in}
% \setlength{\hoffset}{+.25in}
 \begin{titlepage}
    % Logo Uni
		\noindent\includegraphics[height=1.2cm]{logos/UniLogo}
		\hfill
		%\includegraphics[height=1.2cm]{logos/IwviLogo}\\
		%\hspace*{1.867cm}Fachbereich 4: Informatik%

		\normalsize \vspace*{1.5cm}

    \begin{center}
      \doublespacing
      {\huge\bfseries\@title}\\[1.25cm]
      \singlespacing

      \ifthenelse{\boolean{@isScr}}{
        \huge Skript\\[.2cm]}

			\ifthenelse{\boolean{@isSem}}{
        \huge Seminararbeit\\[.2cm]}

			\ifthenelse{\boolean{@isProSem}}{
        \huge Proseminararbeit\\[.2cm]}

      \ifthenelse{\boolean{@isSA}}{
        \huge Studienarbeit\\[.2cm]}

      \ifthenelse{\boolean{@isPP}}{
        \huge Projektpraktikum\\[.2cm]}

      \ifthenelse{\boolean{@isDA}}{%
          \huge Diplomarbeit\\[.2cm]
          \normalsize zur Erlangung des Grades eine%
          \ifthenelse{\boolean{@isFemale}}{%
            r Diplom-Informatikerin\\}{%
            s Diplom-Informatikers\\}}

      \ifthenelse{\boolean{@isBA}}{
          \huge Bachelorarbeit\\[.2cm]
          \normalsize zur Erlangung des Grades eines
          Bachelor of Science\\}

      \ifthenelse{\boolean{@isMA}}{
          \huge Masterarbeit\\[.2cm]
          \normalsize zur Erlangung des Grades eines
          Master of Science\\}

      \ifthenelse{\equal{\@studiengang}{}}{}{
        \normalsize im Studiengang \@studiengang \\[0.75cm]}

      \normalsize vorgelegt von\\[1ex]\Large\@author \\[2.3cm]
    \end{center}

      \normalsize {

      \ifthenelse{\boolean{@isScr}}{
        	\begin{tabularx}{\linewidth}{l X}
            Dozent  :     & \@dozent \\
                          & \@dozentInfo \\[.2cm]
          \end{tabularx}\\[2cm]}{

        \ifthenelse{\boolean{@isProSem}\or\boolean{@isSem}\or\boolean{@isSA}\or\boolean{@isPP}}{%
          %% if isSA or isPP or isSem
          \begin{tabularx}{\linewidth}{l X}
            Betreuer:     & \@erstgutachter \\
                          & \@erstgutachterInfo \\[.2cm]
                          & \@zweitgutachter \\
                          & \@zweitgutachterInfo \\[.2cm]
			\ifthenelse{\NOT\equal{\@drittgutachter}{}}{
						  & \@drittgutachter \\
                          & \@drittgutachterInfo \\[.2cm]}{}
          \end{tabularx}\\[2cm]}{%
		  
          % \begin{tabularx}{\linewidth}{r  X}
          \begin{tabularx}{1.05\textwidth}{r X} %{ >{\hsize=.24\hsize}X >{\hsize=0.76\hsize}X}
            \ifthenelse{\equal{\@zweitgutachter}{}}{
            Gutachter:			& \@erstgutachter \\
								& \@erstgutachterInfo \\}{
            Erstgutachter:  	& \@erstgutachter \\
								& \@erstgutachterInfo \\[.2cm]
            Zweitgutachter: 	& \@zweitgutachter \\
								& \@zweitgutachterInfo \\[.2cm]
			\ifthenelse{\NOT\equal{\@drittgutachter}{}}{
            Betreuer:			& \@drittgutachter \\
								& \@drittgutachterInfo \\[.2cm]}{}
			}
          \end{tabularx}\\[2cm]}}
      }
      \normalsize \hspace*{.12cm} Koblenz, im \abgabe

    \end{titlepage}


    \setlength{\voffset}{\voffsetBackup}
    \setlength{\hoffset}{\hoffsetBackup}


    \cleardoublepage

		\ifthenelse{\boolean{@isBA}\or\boolean{@isMA}\or\boolean{@isDA}}{
			
			\huge
			\textbf{Erklärung}
			\normalsize
		    \newline\newline\newline\newline\newline\newline
  		  \thispagestyle{empty}
	    	\noindent
    		Hiermit bestätige ich, dass die vorliegende Arbeit von mir selbständig verfasst wurde und ich
			keine anderen als die angegebenen Hilfsmittel – insbesondere keine im Quellenverzeichnis
			nicht benannten Internet–Quellen – benutzt habe und die Arbeit von mir vorher nicht in einem
			anderen Prüfungsverfahren eingereicht wurde. Die eingereichte schriftliche Fassung
			entspricht der auf dem elektronischen Speichermedium (CD-Rom).\\
    		\vspace*{2ex}

    		\begin{flushleft}
      		\begin{tabularx}{\linewidth}{X c c}

        	{} & Ja & Nein \\
        	{} & {} & {} \\
        	Mit der Einstellung der Arbeit in die Bibliothek bin ich einverstanden. & $\square$ & $\square$ \\
        	{} & {} & {} \\
        	Der Veröffentlichung dieser Arbeit im Internet stimme ich zu. &
        	$\square$ & $\square$

      		\end{tabularx}
    		\end{flushleft}
    		\vspace*{3cm}


    		\small
    		\noindent
    		\dotfill \\
    		{\small(Ort, Datum)}\hfill{\small (\@author)}
		}{}% Unterschiedliche Zeilenabstaende

\ifthenelse{\boolean{@isSingle}} {
    \singlespacing
  } {
    \ifthenelse{\boolean{@isDouble}} {
      \doublespacing
    } {
      \onehalfspacing
    }
  }
}

\interfootnotelinepenalty=10000