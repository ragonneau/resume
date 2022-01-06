%%
%% This is adcv.cls.
%% It consists of a modified version of the Adaptive CV LaTeX class
%% adcv.cls of Dr. Alessandro Rossini, available at
%%     https://github.com/alessandrorossini/adcv
%%
%% Copyright 2022 Tom M. Ragonneau.
%% Copyright 2016-2020 Alessandro Rossini.
%%
%% It may be distributed and/or modified under the conditions of the
%% LaTeX Project Public License, either version 1.3 of this license or
%% (at your option) any later version. The latest version of this
%% license is in
%%     http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%%
%% This work has the LPPL maintenance status 'maintained'.
%%
%% The Current Maintainer of this work is Tom M. Ragonneau.
%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{adcv}[2016/12/15 Adaptive CV]

% Options

\newif\ifextended
\extendedfalse
\DeclareOption{extended}{
    \extendedtrue
}

\newif\ifonline
\onlinefalse
\DeclareOption{online}{
    \onlinetrue
}

\newif\ifprint
\printfalse
\DeclareOption{print}{
    \printtrue
}

\newif\ifde
\defalse
\DeclareOption{de}{
    \AtEndOfPackage{
        \InputIfFileExists{adcv_de.def}{}{
            \ClassError{adcv}{German definition file 'adcv_de.def' not found.}
        }
    }
    \detrue
}

\newif\ifen
\enfalse
\DeclareOption{en}{
    \AtEndOfPackage{
        \InputIfFileExists{adcv_en.def}{}{
            \ClassError{adcv}{English definition file 'adcv_en.def' not found.}
        }
    }
    \entrue
}

\newif\iffr
\frfalse
\DeclareOption{fr}{
    \AtEndOfPackage{
        \InputIfFileExists{adcv_fr.def}{}{
            \ClassError{adcv}{French definition file 'adcv_fr.def' not found.}
        }
    }
    \frtrue
}

\newif\ifzhhant
\zhhantfalse
\DeclareOption{zh-hant}{
    \AtEndOfPackage{
        \InputIfFileExists{adcv_zh-hant.def}{}{
            \ClassError{adcv}{Traditional chinese definition file 'adcv_zh-hant.def' not found.}
        }
    }
    \zhhanttrue
}

\DeclareOption*{
    \PassOptionsToClass{\CurrentOption}{article}
}

\ExecuteOptions{en}
\ProcessOptions
\LoadClass{article}

% Typographical rules

\ifde
    \RequirePackage[german]{babel}
\else
    \iffr
        \RequirePackage[french]{babel}
    \else
        \RequirePackage[english]{babel}
        \ifzhhant
            \RequirePackage{xeCJK}
        \fi
    \fi
\fi

% Geometry

\RequirePackage[top=2cm,left=2cm,right=2cm,bottom=2cm]{geometry}

\newlength\adcv@leftcol
\newlength\adcv@centercol
\newlength\adcv@rightcol
\newlength\adcv@colsep
\newlength\adcv@leftcentercol
\newlength\adcv@centerrightcol
\newlength\adcv@langcol

\setlength{\adcv@leftcol}{10em}
\setlength{\adcv@rightcol}{10em}
\setlength{\adcv@colsep}{1em}
\setlength{\adcv@centercol}{\textwidth}
\addtolength{\adcv@centercol}{-\adcv@leftcol}
\addtolength{\adcv@centercol}{-\adcv@rightcol}
\addtolength{\adcv@rightcol}{-2\adcv@colsep}
\setlength{\adcv@leftcentercol}{\textwidth}
\addtolength{\adcv@leftcentercol}{-\adcv@rightcol}
\addtolength{\adcv@leftcentercol}{-\adcv@colsep}
\setlength{\adcv@centerrightcol}{\textwidth}
\addtolength{\adcv@centerrightcol}{-\adcv@leftcol}
\addtolength{\adcv@centerrightcol}{-\adcv@colsep}
\setlength\adcv@langcol{0.2\adcv@centerrightcol}
\addtolength{\adcv@langcol}{-2\tabcolsep}
\addtolength{\adcv@langcol}{-2\arrayrulewidth}

% Colours

\RequirePackage{xcolor}

\definecolor{white}{HTML}{FFFFFF}
\definecolor{lightgray}{HTML}{999999}
\definecolor{gray}{HTML}{555555}
\definecolor{paynegray}{HTML}{353E49}
\definecolor{black}{HTML}{000000}
\definecolor{tpxteal}{HTML}{418689}

\ifprint
    \colorlet{regulartext}{black}
    \colorlet{headerfill}{white}
    \colorlet{headertext}{black}
    \colorlet{lighttext}{gray}
    \colorlet{linktext}{lightgray}
\else
    \colorlet{regulartext}{gray}
    \colorlet{headerfill}{paynegray}
    \colorlet{headertext}{white}
    \colorlet{lighttext}{lightgray}
    \colorlet{linktext}{tpxteal}
\fi

% Hyperref

\RequirePackage{hyperref}

\hypersetup{
    colorlinks=true,
    allcolors=linktext,
}

\ifextended
    \AtBeginDocument{%
        \hypersetup{%
            pdfauthor={\adcv@firstname~\adcv@lastname},%
            pdftitle={\adcv@firstname~\adcv@lastname\adcv@cvofkey},%
        }%
    }
\else
    \AtBeginDocument{%
        \hypersetup{%
            pdfauthor={\adcv@firstname~\adcv@lastname},%
            pdftitle={\adcv@firstname~\adcv@lastname\adcv@resumeofkey},%
        }%
    }
\fi

% Fonts

\RequirePackage{fontspec}

\setmainfont[
    Path=fonts/Roboto/,
    BoldFont=Roboto-Bold.ttf,
    ItalicFont=Roboto-Italic.ttf,
    BoldItalicFont=Roboto-BoldItalic.ttf,
    Color=regulartext,
]{Roboto-Light.ttf}
\newfontfamily\la@regular[
    Path=fonts/Roboto/,
    Color=regulartext,
]{Roboto-Regular.ttf}
\newfontfamily\la@light[
    Path=fonts/Roboto/,
    Color=regulartext,
]{Roboto-Light.ttf}
\newfontfamily\la@thin[
    Path=fonts/Roboto/,
    Color=regulartext,
]{Roboto-Thin.ttf}
\newfontfamily\la@regularheader[
    Path=fonts/Roboto/,
    Color=headertext,
]{Roboto-Regular.ttf}
\newfontfamily\la@thinheader[
    Path=fonts/Roboto/,
    Color=headertext,
]{Roboto-Thin.ttf}

\ifzhhant
    \setCJKmainfont[
        Path=fonts/NotoSerifTC/,
        BoldFont=NotoSerifTC-Bold.otf,
        Color=regulartext,
    ]{NotoSerifTC-Light.otf}
    \newCJKfontfamily\zhhant@regular[
        Path=fonts/NotoSerifTC/,
        Color=regulartext,
    ]{NotoSerifTC-Regular.otf}
    \newCJKfontfamily\zhhant@light[
        Path=fonts/NotoSerifTC/,
        Color=regulartext,
    ]{NotoSerifTC-Light.otf}
    \newCJKfontfamily\zhhant@thin[
        Path=fonts/NotoSerifTC/,
        Color=regulartext,
    ]{NotoSerifTC-Light.otf}
    \newCJKfontfamily\zhhant@regularheader[
        Path=fonts/NotoSerifTC/,
        Color=headertext,
    ]{NotoSerifTC-Regular.otf}
    \newCJKfontfamily\zhhant@thinheader[
        Path=fonts/NotoSerifTC/,
        Color=headertext,
    ]{NotoSerifTC-Light.otf}
    \def\regular{\la@regular\zhhant@regular}
    \def\light{\la@light\zhhant@light}
    \def\thin{\la@thin\zhhant@thin}
    \def\regularheader{\la@regularheader\zhhant@regularheader}
    \def\thinheader{\la@thinheader\zhhant@thinheader}
\else
    \let\regular\la@regular
    \let\light\la@light
    \let\thin\la@thin
    \let\regularheader\la@regularheader
    \let\thinheader\la@thinheader
\fi

\ifzhhant
    \newcommand*{\lighttext}{\addfontfeature{Color=lighttext}\addCJKfontfeature{Color=lighttext}}
    \newcommand*{\linktext}{\addfontfeature{Color=linktext}\addCJKfontfeature{Color=linktext}}
\else
    \newcommand*{\lighttext}{\addfontfeature{Color=lighttext}}
    \newcommand*{\linktext}{\addfontfeature{Color=linktext}}
\fi

\def\@sectioncolor#1#2#3{{\addfontfeature{Color=linktext} #1#2#3}}
\def\HyColor@@@@UseColor#1\@nil{\addfontfeatures{Color=linktext}}

\renewcommand{\section}[1]{\vspace{.5\baselineskip}{\Large\bfseries\@sectioncolor #1}}
\renewcommand{\subsection}[2]{\large\bfseries #2}

% Header

\RequirePackage{tikz}
\RequirePackage{fontawesome5}

\newcommand*{\adcvname}[3]{\def\adcv@firstname{#1}\def\adcv@lastname{#2}\def\adcv@degree{#3}}
\newcommand*{\adcvtitle}[1]{\def\adcv@title{#1}}
\newcommand*{\adcvaddress}[4]{\def\adcv@street{#1}\def\adcv@postalcode{#2}\def\adcv@locality{#3}\def\adcv@country{#4}}
\newcommand*{\adcvphone}[1]{\def\adcv@phone{#1}}
\newcommand*{\adcvemail}[3]{\def\adcv@emaillocal{#1}\def\adcv@emaildomainsecond{#2}\def\adcv@emaildomaintop{#3}}
\newcommand*{\adcvwebsite}[2]{\def\adcv@websiteurl{#1}\def\adcv@websitetext{#2}}

\newcommand*{\envelopeicon}{\textcolor{regulartext}{\faIcon{envelope}}}
\newcommand*{\houseicon}{\textcolor{regulartext}{\faIcon{home}}}
\newcommand*{\phoneicon}{\textcolor{regulartext}{\faIcon{phone}}}
\newcommand*{\placeicon}{\textcolor{regulartext}{\faIcon{map-marker-alt}}}

\ifonline
    \def\adcv@address{\placeicon~\adcv@locality\ifzhhant，\else,~\fi\adcv@country}
    \def\adcv@email{\envelopeicon~{\linktext\adcv@emaillocal @\adcv@emaildomainsecond.\adcv@emaildomaintop}}
    \def\adcv@telephone{}
\else
    \def\adcv@address{\placeicon~\adcv@street\ifzhhant，\else,~\fi\adcv@postalcode~\adcv@locality\ifzhhant，\else,~\fi\adcv@country}
    \def\adcv@email{\envelopeicon~\href{mailto:\adcv@emaillocal @\adcv@emaildomainsecond.\adcv@emaildomaintop}{\adcv@emaillocal @\adcv@emaildomainsecond.\adcv@emaildomaintop}}
    \def\adcv@telephone{\phoneicon~\adcv@phone}
\fi

\AtBeginDocument{%
    \begin{tikzpicture}[remember picture,overlay]%
        \node [rectangle,fill=headerfill,minimum width=\paperwidth,minimum height=8em,anchor=north] (box) at (current page.north) {};%
        \node [text=headertext,anchor=center] (name) at (box) {%
          {\Huge\thinheader\adcv@firstname~\regularheader\adcv@lastname\thinheader\ifzhhant，\else,~\fi\adcv@degree}%
        };%
        \node [text=headertext,anchor=north] at (name.south) {%
          \Large\thinheader\adcv@title%
        };%
    \end{tikzpicture}%

    \vspace{\baselineskip}%

    \ifdefined\adcv@websiteurl%
        \ifx\adcv@websiteurl\empty%
            \def\adcv@website{}%
        \else%
            \def\adcv@website{\houseicon~\href{\adcv@websiteurl}{\adcv@websitetext}}%
        \fi%
    \else%
        \def\adcv@website{}%
    \fi%

    \begin{center}%
        \ifonline%
            \adcv@email\quad\adcv@website%

            \adcv@address%
        \else%
            \adcv@email\quad\adcv@website%

            \adcv@address\quad\adcv@telephone%
        \fi%
    \end{center}%
}

% Footer

\RequirePackage{array}
\RequirePackage{fancyhdr}
\RequirePackage{totpages}

\newcommand*{\adcvdate}[1]{\def\adcv@date{#1}}

\def\adcv@totpages{~/~\ref{TotPages}}
\def\adcv@page{\adcv@pagekey~\thepage\adcv@totpages}

\AtBeginDocument{%
    \pagestyle{fancy}%
    \fancyhead{}%
    \fancyfoot[C]{\footnotesize\light\adcv@firstname~\adcv@lastname\ifextended\adcv@cvofkey\else\adcv@resumeofkey\fi~(\adcv@date)\ifonline\else\quad\adcv@telephone\fi\quad\adcv@email}%
    \fancyfoot[R]{\raggedleft\footnotesize\light\adcv@page}%
    \renewcommand{\headrulewidth}{0em}%
    \setlength\footskip{\baselineskip}%
}

% Tables

\RequirePackage{longtable}
\RequirePackage{parskip}

\setlength{\LTpre}{\parskip}
\setlength{\LTpost}{0em}
\setlength{\LTleft}{0em}
\setlength{\LTright}{0em}

\newenvironment*{adcvtabletwo}{\begin{longtable}[l]{@{}>{\raggedright}p{\adcv@leftcentercol}@{\hspace{\adcv@colsep}} @{}>{\raggedleft}p{\adcv@rightcol}@{}}}{\end{longtable}}

\newcommand*{\adcvrowtwo}[2]{#1 & #2\tabularnewline}
\newcommand*{\adcvrowmulti}[1]{\multicolumn{2}{@{}p{\textwidth}}{\lighttext #1}\tabularnewline}

\newenvironment*{adcvtablethree}{\begin{longtable}[l]{@{}>{\raggedright}p{\adcv@leftcol}@{\hspace{\adcv@colsep}} @{}>{\raggedright}p{\adcv@centercol}@{} @{\hspace{\adcv@colsep}}>{\raggedleft}p{\adcv@rightcol}@{}}}{\end{longtable}}

\newcommand*{\adcvrowthree}[3]{\bfseries #1 & #2 & #3\tabularnewline}

\newcommand*{\adcvrowskip}{\tabularnewline[-\parskip]}

% Languages

\newenvironment*{adcvlanguages}{\begin{longtable}[l]{@{}>{\raggedleft}p{\adcv@leftcol}@{\hspace{\adcv@colsep}} @{}p{\adcv@centerrightcol}@{}}}{\end{longtable}}

\newcommand*{\adcvmothertongue}[1]{{\adcv@mothertonguekey} & {\bfseries #1}\tabularnewline[0em]}

\newcommand*{\adcvlanguagesheader}{%
    \adcv@otherkey &%
    \setlength\extrarowheight{0em}%
    \begin{tabular}[t]{|m{\adcv@langcol}|m{\adcv@langcol}|m{\adcv@langcol}|m{\adcv@langcol}|m{\adcv@langcol}|}%
        \firsthline%
        \multicolumn{2}{|c|}{{\bfseries\adcv@understandingkey}} & \multicolumn{2}{c|}{{\bfseries\adcv@speakingkey}} & \centering{\bfseries\adcv@writingkey}\tabularnewline%
        \cline{1-4}%
        \centering\small{\adcv@listeningkey} & \centering\small{\adcv@readingkey} & \centering\small{\adcv@interactionkey} & \centering\small{\adcv@productionkey} & \tabularnewline%
        \hline%
    \end{tabular}\tabularnewline[-\arrayrulewidth]%
}

\newcommand*{\adcvlanguage}[7]{%
    \bfseries #2$^{\mbox{\scriptsize#1}}$ &%
    \setlength\extrarowheight{0em}%
    \begin{tabular}{|m{\adcv@langcol}|m{\adcv@langcol}|m{\adcv@langcol}|m{\adcv@langcol}|m{\adcv@langcol}|}%
        \hline%
        #3 & #4 & #5 & #6 & #7\tabularnewline%
        \hline%
    \end{tabular}\tabularnewline[-\arrayrulewidth]%
}

\newcommand*{\adcvlanguagesfooter}{\adcvrowtwo{}{\footnotesize\textit{\adcv@cefrkey}}}
\newcommand*{\adcvlanguagesfootnote}[2]{\adcvrowtwo{}{\footnotesize\textit{#2}}}

\newcommand*{\adcvCEF}[2]{%
    \begin{tabular}{@{}>{\footnotesize}p{0.2\adcv@langcol}@{\hspace{1mm}}>{\footnotesize\centering}p{0.75\adcv@langcol}@{}}%
        #1 & #2\tabularnewline%
    \end{tabular}%
}

\newcommand*{\adcvAOne}{\adcvCEF{A1}{\adcv@basickey}}
\newcommand*{\adcvATwo}{\adcvCEF{A2}{\adcv@basickey}}
\newcommand*{\adcvBOne}{\adcvCEF{B1}{\adcv@independentkey}}
\newcommand*{\adcvBTwo}{\adcvCEF{B2}{\adcv@independentkey}}
\newcommand*{\adcvCOne}{\adcvCEF{C1}{\adcv@fluentkey}}
\newcommand*{\adcvCTwo}{\adcvCEF{C2}{\adcv@fluentkey}}

% Publications

\RequirePackage[backend=biber,block=par,defernumbers=false,maxnames=99,sorting=none,style=numeric]{biblatex}
\RequirePackage{csquotes}
\urlstyle{same}

\DeclareFieldFormat[article]{title}{#1}
\DeclareFieldFormat[inproceedings]{title}{#1}
\DeclareFieldFormat[misc]{title}{#1}
\DeclareFieldFormat[report]{title}{#1}

\renewcommand*{\newunitpunct}{\addcomma\space}

\DeclareBibliographyDriver{article}{%
    \printfield{title}%
    \newblock%
    \printnames{author}%
    \newblock%
    {%
        \small\lighttext%
        \usebibmacro{journal+issuetitle}%
        \newunit%
        \printfield{pages}%
        \newunit%
        \printlist{publisher}%
        \setunit{}%
        \newblock%
        \iffieldundef{doi}{%
            \iffieldundef{isbn}{}{%
                \printfield{isbn}%
                \newblock%
            }%
        }{%
            \printfield{doi}%
            \newblock%
        }%
        \printfield{url}%
        \newblock%
    }%
    \vspace{.5\baselineskip}%
}

\DeclareBibliographyDriver{inproceedings}{%
    \printfield{title}%
    \newblock%
    \printnames{author}%
    \newblock%
    {%
        \small\lighttext%
        \printfield{booktitle}%
        \newunit%
        \printfield{year}%
        \newunit%
        \printlist{publisher}%
        \setunit{}%
        \newblock%
        \iffieldundef{doi}{%
            \iffieldundef{isbn}{}{%
                \printfield{isbn}%
                \newblock%
            }%
        }{%
            \printfield{doi}%
            \newblock%
        }%
        \printfield{url}%
        \newblock%
    }%
    \vspace{.5\baselineskip}%
}

\DeclareBibliographyDriver{report}{%
    \printfield{title}%
    \newblock%
    \printnames{author}%
    \newblock%
    {%
        \small\lighttext%
        \printlist{institution}%
        \newunit%
        \printfield{year}%
        \setunit{}%
        \newblock%
        \printfield{isbn}%
        \newblock%
    }%
    \vspace{.5\baselineskip}%
}

\DeclareBibliographyDriver{misc}{%
    \printfield{title}%
    \newblock%
    \printnames{author}%
    \newblock%
    {%
        \small\lighttext%
        \printfield{year}%
        \newblock%
        \printfield{note}%
        \newblock%
    }%
    \vspace{.5\baselineskip}%
}

\DeclareNameFormat{author}{%
    \small\lighttext%
    \nameparts{#1}%
    \ifblank{\namepartgiven}{}{\namepartgiven\space}\namepartfamily%
    \ifthenelse{\value{listcount}<\value{liststop}}{\addcomma\addspace\ifthenelse{\value{listcount}=\the\numexpr\value{liststop}-1\relax}{and\addspace}{}}{}%
}

\let\oldrefsection\refsection
\let\endoldrefsection\endrefsection
\renewenvironment{refsection}{\oldrefsection}{\endoldrefsection\vspace{-.5\baselineskip}}

% Presentations

\RequirePackage{enumitem}

\newenvironment*{adcvpresentations}{%
    \setlist[enumerate]{labelsep=\biblabelsep,leftmargin=\labelwidth}%
    \renewcommand{\theenumi}{[\arabic{enumi}]}%
    \renewcommand{\labelenumi}{\theenumi}%
    \begin{enumerate}%
}{%
    \end{enumerate}%
}

\newcommand*{\adcvpresentation}[2]{\item #1\\{\small\lighttext #2}}
