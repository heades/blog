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

-> $[[Box r A]]$

In this style, the typing judgment has the form of $[[g @ G |- t : A]]$
where $\gamma$ is a vector of elements from an abstract
preordered semiring $([[R]],[[mid]],[[*]],[[aid]],[[+]],[[<=]])$ and
$[[G]]$ is a standard typing context.  A **graded context** is of the
form $[[g @ G]]$ where the length of $[[g]]$ is the same as the length
of $[[G]]$, and each element of $[[g @ G]]$ is a pair $([[r]],[[x :
A]])$ of a variable and its corresponding grade.  We factor out the
grades from the typing context because it offers a more pleasant
theory and a nicer description of the typing rules.  If we squint at
the rules above ignoring the vectors, then we have the standard
introduction and elimination rules for Linear Logic's of-course!
modality.

In this post I'm going to explain how $[[Box r A]]$ has a graded
adjoint formalization in terms of a strict graded necessity modality
that is wrapped around an adjunction.  Then we will look at some
interesting implications of this, in particularly, we will ask if we
can define $[[Box r A]]$ in terms of this strict version using the
operators of our theory?

<!--
- Define graded comonad
- Define syntactic category
- Define action on syntactic category
- Discuss finding a syntactic adjunction to merge with the action.
-->

The **syntactic category**, $\cat{G}$, consists of the following data:

**(Objects)** Graded Contexts $[[g @ G]]$.  Suppose $\Gamma_{{\mathrm{1}}}$

<!--

  and $[[G2]] = ([[y1 :  B1]],\ldots,[[yk : Bl]])$. A morphism from $[[g1 @ G1]]$ to $[[g2 @
  G2]]$ is a pair of a vector of terms $\langle [[t1]], \ldots, [[tl]]
  \rangle$ and a usage matrix $[ [[g'i]] ]^{(l,k)}$ such that, $[[gj'
  @ G1 |- tj : Bj]]$ for $1 \leq j \leq l$ and $[[g2]] * [ [[g'i]]
  ]^{(l,k)} \leq [[g1]]$.

The identity morphism:

$[[g @ G]] \mto^{\mathsf{id}} [[g @ G]]$

is defined by $\mathsf{id} = [ [[aid]] | [[mid]] ]^{k} \odot \langle [[x1]], \ldots, [[xk]] \rangle$
where $[[G]] = ([[x1 : A1]], \ldots, [[xk : Ak]])$.

\ \\ \noindent
Composition of morphisms:
\begin{center}
\begin{math}
\begin{array}{lll}
[[g1 @ G1]] \mto^{[ [[gi]] ]^{j \times k} \odot \langle [[t1]],\ldots,[[tj]] \rangle} [[g2 @ G2]]\\

[[g2 @ G2]] \mto^{[ [[g'i]] ]^{l \times j} \odot \langle [[t'1]],\ldots,[[t'l]] \rangle} [[g3 @ G3]]
\end{array}
\end{math}
\end{center}
is defined to be the morphism:
\[
[[g1 @ G1]] \mto^{([ [[g'i]] ]^{l \times j} * [ [[gi]] ]^{j \times k}) \odot \langle [ [[t1]],\ldots,[[tj]]/[[G2]] ][[t'1]],\ldots,[ [[t1]],\ldots,[[tj]]/[[G2]] ][[t'l]]  \rangle} [[g3 @ G3]]
\]
where $[[g3]] * ([ [[g'i]] ]^{l \times j} * [ [[gi]] ]^{j \times k}) = ([[g3]] * [ [[g'i]] ]^{l \times j}) * [ [[gi]] ]^{j \times k} \leq [[g2]] * [ [[gi]] ]^{j \times k} \leq [[g1]]$.

\ \\
\noindent
Finally, we do not distinguish $\alpha$-equivalent morphisms.


-->XXXX
