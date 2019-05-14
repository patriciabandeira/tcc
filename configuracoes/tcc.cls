%%
%% Customizações do abnTeX2 (http://abnTeX2.googlecode.com) para a Universidade XXXX
%%
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%%
%% This work has the LPPL maintenance status `maintained'.
%% 
%% The Current Maintainer of this work is Matheus Liberato, matheusliberatosbs@gmail.com
%%
%% Further information about abnTeX2 are available on http://abntex2.googlecode.com/
%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tcc}[2013/04/01 v1.0 Modelo TCC baseado em abnTeX2]

% Repassa os parâmetros ao abntex2
\DeclareOption*{%
\PassOptionsToClass{\CurrentOption}{abntex2}
}

\PassOptionsToClass{
chapter=TITLE,
12pt, % Tamanho da fonte
twoside, % Para impressão em verso e anverso. Oposto a oneside
a4paper, % Tamanho do papel
english, % Idioma adicional para hifenização
french, % Idioma adicional para hifenização
spanish, % Idioma adicional para hifenização
brazilian, %
brazil % o último idioma é o principal do documento
}{abntex2}

\ProcessOptions\relax
\LoadClass{abntex2}

% Pacotes
%% Correção ortográfica
%\RequirePackage[brazil,brazilian]{babel}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Pacotes necessários para compilar.    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{graphicx}
%\RequirePackage[scaled]{uarial}
%\renewcommand*\familydefault{\sfdefault}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Comando para exibir o ano de uma data %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\imprimirano}{\the\year}
%\newcommand{\imprimirano}{2014}

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
%   COLOCA CABECALHO
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
\RequirePackage{fancyhdr}

\fancypagestyle{IFMS}{%
%	\fancyhf{} % deletar configuração atual do cabeçalho e rodapé
%	\chead{\includegraphics[width=1\textwidth]{figura/image003}}
	\renewcommand{\headrulewidth}{0pt}
%	\addtolength{\headheight}{0.5pt} % cria um espaço para linha
}

\RequirePackage{etoc}
\renewcommand{\etocaftertitlehook}{\pagestyle{IFMS}}
\renewcommand{\etocaftertochook}{\thispagestyle{IFMS}}

\addtocontents{toc}{\protect\thispagestyle{IFMS}}
\addtocontents{lof}{\protect\thispagestyle{IFMS}}
\addtocontents{lot}{\protect\thispagestyle{IFMS}}


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
%   ALTERA A CRIACAO DA CAPA
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
\renewcommand{\imprimircapa}{%
  \begin{capa}%
	\thispagestyle{IFMS}
    \center
    {\bfseries\large\MakeTextUppercase\imprimirinstituicao}
    
    \vspace*{1cm}
    
    %{\ABNTEXchapterfont\normalsize\MakeTextUppercase\imprimirautor}
    {\large\MakeTextUppercase\imprimirautor}

    \vfill
    %{\ABNTEXchapterfont\bfseries\large\MakeTextUppercase\imprimirtitulo}
    {\bfseries\large\MakeTextUppercase\imprimirtitulo}
    \vfill
    
    \large\MakeTextUppercase\imprimirlocal

    \large\imprimirano
    
    %\vspace*{1cm}
  \end{capa}
}
\makeatother


\makeatletter
\renewcommand{\imprimirfolhaderosto}{%
 \begin{center}
	
	\vspace*{1cm}
	{\ABNTEXchapterfont\large\imprimirautor}
	
	 \vspace*{\fill}\vspace*{\fill}
	\begin{center}
		\ABNTEXchapterfont\bfseries\Large\imprimirtitulo
	\end{center}
	\vspace*{\fill}
	
	\abntex@ifnotempty{\imprimirpreambulo}{%
		\hspace{.45\textwidth}
		\begin{minipage}{.5\textwidth}
			\SingleSpacing
			\imprimirpreambulo
		\end{minipage}%
		\vspace*{\fill}
	}%

{\abntex@ifnotempty{\imprimirinstituicao}{\imprimirinstituicao\vspace*{\fill}}}

{\large\imprimirorientadorRotulo~\imprimirorientador\par}
\abntex@ifnotempty{\imprimircoorientador}{%
	{\large\imprimircoorientadorRotulo~\imprimircoorientador}%
}%
\vspace*{\fill}

{\large\imprimirlocal}
\par
{\large\imprimirdata}
%\vspace*{1cm}
	
\end{center}

}
\makeatother