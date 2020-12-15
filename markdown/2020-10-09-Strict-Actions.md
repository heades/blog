---
layout: blog
title: "Strict vs Lax Graded Necessiity Modalities"
date: 2020-11-15
categories:
 - logic
 - linear logic
 - monoidal categories
 - category theory
 - graded types
 - actions
 - granule project
 - type theory
 - coalgebras
 - graded modal types
abstract: "Encoding graded modalities leads to strict versions."
---

<div id="divCheckbox" style="display: none;">
$
\newcommand{\ottnt}[1]{\mathit{#1}}
\newcommand{\ottsym}[1]{#1}
\newcommand{\ottmv}[1]{\mathit{#1}}

\newcommand{\cat}[1]{\mathcal{#1}}
\newcommand{\func}[1]{\mathsf{#1}}
\newcommand{\Lin}[0]{\func{Lin}}
\newcommand{\Mny}[0]{\func{Mny}}
\newcommand{\Forget}[0]{\func{Forget}}
\newcommand{\Free}[0]{\func{Free}}
\newcommand{\Endo}[0]{\func{Endo}}
\newcommand{\mto}[0]{\to}
\newcommand{\Hom}[3]{\mathsf{Hom}_{\cat{#1}}(#2,#3)}
\newcommand{\interp}[1]{[\negthinspace[#1]\negthinspace]}
$
</div>

Graded necessity modalities are commonly defined by the following
inference rules:

<center><img width="70%" src="/images/posts/strict-actions/box-ifrs.png"></center>

-> $\Box_{ \ottmv{r} }  \ottnt{A}$

In this style, the typing judgment has the form of $\gamma  \mathbin{\odot}  \Gamma  \vdash  \ottnt{t}  \ottsym{:}  \ottnt{A}$
where $\gamma$ is a vector of elements from an abstract
preordered semiring $(\mathcal{R},\mathsf{m},\circledast,\mathsf{a},\oplus,\leq)$ and
$\Gamma$ is a standard typing context.  A **graded context** is of the
form $\gamma  \mathbin{\odot}  \Gamma$ where the length of $\gamma$ is the same as the length
of $\Gamma$, and each element of $\gamma  \mathbin{\odot}  \Gamma$ is a pair $(\ottmv{r},\ottmv{x}  \ottsym{:}  \ottnt{A})$ of a variable and its corresponding grade.  We factor out the
grades from the typing context because it offers a more pleasant
theory and a nicer description of the typing rules.  If we squint at
the rules above ignoring the vectors, then we have the standard
introduction and elimination rules for Linear Logic's of-course!
modality.

In this post I'm going to explain how $\Box_{ \ottmv{r} }  \ottnt{A}$ has a graded
adjoint formalization in terms of a strict graded necessity modality
that is wrapped around an adjunction.  Then we will look at some
interesting implications of this, in particularly, we will ask if we
can define $\Box_{ \ottmv{r} }  \ottnt{A}$ in terms of this strict version using the
operators of our theory?

<!--
- Define graded comonad
- Define syntactic category
- Define action on syntactic category
- Discuss finding a syntactic adjunction to merge with the action.
-->

The **syntactic category**, $\cat{G}$, consists of the following data:

**(Objects)** Graded Contexts $\gamma  \mathbin{\odot}  \Gamma$.  Suppose $\Gamma_{{\mathrm{1}}}$

<!--

  and $\Gamma_{{\mathrm{2}}} = (\ottmv{y_{{\mathrm{1}}}}  \ottsym{:}  \ottnt{B_{{\mathrm{1}}}},\ldots,\ottmv{y_{\ottmv{k}}}  \ottsym{:}  \ottnt{B_{\ottmv{l}}})$. A morphism from $\gamma_{{\mathrm{1}}}  \mathbin{\odot}  \Gamma_{{\mathrm{1}}}$ to $\gamma_{{\mathrm{2}}}  \mathbin{\odot}  \Gamma_{{\mathrm{2}}}$ is a pair of a vector of terms $\langle \ottnt{t_{{\mathrm{1}}}}, \ldots, \ottnt{t_{\ottmv{l}}}
  \rangle$ and a usage matrix $[ \gamma'_{\ottmv{i}} ]^{(l,k)}$ such that, $\gamma'_{\ottmv{j}}  \mathbin{\odot}  \Gamma_{{\mathrm{1}}}  \vdash  \ottnt{t_{\ottmv{j}}}  \ottsym{:}  \ottnt{B_{\ottmv{j}}}$ for $1 \leq j \leq l$ and $\gamma_{{\mathrm{2}}} * [ \gamma'_{\ottmv{i}}
  ]^{(l,k)} \leq \gamma_{{\mathrm{1}}}$.

The identity morphism:

$\gamma  \mathbin{\odot}  \Gamma \mto^{\mathsf{id}} \gamma  \mathbin{\odot}  \Gamma$

is defined by $\mathsf{id} = [ \mathsf{a} | \mathsf{m} ]^{k} \odot \langle \ottmv{x_{{\mathrm{1}}}}, \ldots, \ottmv{x_{\ottmv{k}}} \rangle$
where $\Gamma = (\ottmv{x_{{\mathrm{1}}}}  \ottsym{:}  \ottnt{A_{{\mathrm{1}}}}, \ldots, \ottmv{x_{\ottmv{k}}}  \ottsym{:}  \ottnt{A_{\ottmv{k}}})$.

\ \\ \noindent
Composition of morphisms:
\begin{center}
\begin{math}
\begin{array}{lll}
\gamma_{{\mathrm{1}}}  \mathbin{\odot}  \Gamma_{{\mathrm{1}}} \mto^{[ \gamma_{\ottmv{i}} ]^{j \times k} \odot \langle \ottnt{t_{{\mathrm{1}}}},\ldots,\ottnt{t_{\ottmv{j}}} \rangle} \gamma_{{\mathrm{2}}}  \mathbin{\odot}  \Gamma_{{\mathrm{2}}}\\

\gamma_{{\mathrm{2}}}  \mathbin{\odot}  \Gamma_{{\mathrm{2}}} \mto^{[ \gamma'_{\ottmv{i}} ]^{l \times j} \odot \langle \ottnt{t'_{{\mathrm{1}}}},\ldots,\ottnt{t'_{\ottmv{l}}} \rangle} \gamma_{{\mathrm{3}}}  \mathbin{\odot}  \Gamma_{{\mathrm{3}}}
\end{array}
\end{math}
\end{center}
is defined to be the morphism:
\[
\gamma_{{\mathrm{1}}}  \mathbin{\odot}  \Gamma_{{\mathrm{1}}} \mto^{([ \gamma'_{\ottmv{i}} ]^{l \times j} * [ \gamma_{\ottmv{i}} ]^{j \times k}) \odot \langle [ \ottnt{t_{{\mathrm{1}}}},\ldots,\ottnt{t_{\ottmv{j}}}/\Gamma_{{\mathrm{2}}} ]\ottnt{t'_{{\mathrm{1}}}},\ldots,[ \ottnt{t_{{\mathrm{1}}}},\ldots,\ottnt{t_{\ottmv{j}}}/\Gamma_{{\mathrm{2}}} ]\ottnt{t'_{\ottmv{l}}}  \rangle} \gamma_{{\mathrm{3}}}  \mathbin{\odot}  \Gamma_{{\mathrm{3}}}
\]
where $\gamma_{{\mathrm{3}}} * ([ \gamma'_{\ottmv{i}} ]^{l \times j} * [ \gamma_{\ottmv{i}} ]^{j \times k}) = (\gamma_{{\mathrm{3}}} * [ \gamma'_{\ottmv{i}} ]^{l \times j}) * [ \gamma_{\ottmv{i}} ]^{j \times k} \leq \gamma_{{\mathrm{2}}} * [ \gamma_{\ottmv{i}} ]^{j \times k} \leq \gamma_{{\mathrm{1}}}$.

\ \\
\noindent
Finally, we do not distinguish $\alpha$-equivalent morphisms.


-->XXXX
