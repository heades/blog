---
layout: blog
title: "Linear Categories: A Folklore Simplification"
date: 2018-07-24
categories:
 - category theory
 - linear logic
 - linear categories
---

<div id="divCheckbox" style="display: none;">
$$\newcommand{\cat}[1]{\mathcal{#1}}
\newcommand{\func}[1]{\mathsf{#1}}
\newcommand{\iso}[0]{\mathsf{iso}}
\newcommand{\H}[0]{\func{H}}
\newcommand{\J}[0]{\func{J}}
\newcommand{\catop}[1]{\cat{#1}^{\mathsf{op}}}
\newcommand{\Hom}[3]{\mathsf{Hom}_{\cat{#1}}(#2,#3)}
\newcommand{\limp}[0]{\multimap}
\newcommand{\colimp}[0]{\multimapdotinv}
\newcommand{\dial}[1]{\mathsf{Dial_{#1}}(\mathsf{Sets^{op}})}
\newcommand{\dialSets}[1]{\mathsf{Dial_{#1}}(\mathsf{Sets})}
\newcommand{\dcSets}[1]{\mathsf{DC_{#1}}(\mathsf{Sets})}
\newcommand{\sets}[0]{\mathsf{Sets}}
\newcommand{\obj}[1]{\mathsf{Obj}(#1)}
\newcommand{\mor}[1]{\mathsf{Mor(#1)}}
\newcommand{\id}[0]{\mathsf{id}}
\newcommand{\lett}[0]{\mathsf{let}\,}
\newcommand{\inn}[0]{\,\mathsf{in}\,}
\newcommand{\cur}[1]{\mathsf{cur}(#1)}
\newcommand{\curi}[1]{\mathsf{cur}^{-1}(#1)}
\newcommand{\mto}[0]{\to}
\newcommand{\m}[0]{\mathsf{m}}
\newcommand{\w}[0]{\mathsf{w}}
\newcommand{\c}[0]{\mathsf{c}}
$$
</div>

At [FLOC 2018](http://www.floc2018.org/) this year I got the opportunity to meet [Damiano Mazza](http://www-lipn.univ-paris13.fr/~mazza/), [Marco Gaboardi](http://www.acsu.buffalo.edu/~gaboardi/), and a few others for lunch.  One thing we all have in common is our interest in understanding the categorical models of various forms of substructural logics.  I learned from Damiano that there is a simplification to the definition of linear categories, but this simplification seems to be folklore.  So in this post I am going to write out this simplification, and prove that it is equivalent to the original definition of a linear category.

Linear Categories
-----------------

Linear categories are one of the first sound and complete categorical models of intuitionistic linear logic proposed in Gavin Bierman's [thesis](https://pdfs.semanticscholar.org/4abd/9b55397235e50c1ea9756626cd54e3ecb353.pdf).  He shows that the linear exponential, $$!A$$, can be modeled as a symmetric monoidal comonad. His original definition ([Definition 35 on p. 140](https://pdfs.semanticscholar.org/4abd/9b55397235e50c1ea9756626cd54e3ecb353.pdf)) is as follows.

<span class="definition">
A *linear category*, $$\cat{C}$$, consists of the following structure:</span>    

1. A symmetric monoidal category, $$\cat{C}$$, with finite products and coproducts,
2. A symmetric monoidal comonad $$(!,\varepsilon, \delta, \m_{A,B}, \m_I)$$ such that

   a. For every free $$!$$-coalgebra $$(!A,\delta_A)$$ there are two distinguished monoidal natural transformations with components:
   
      - (Weakening) $$\w_A : !A \mto I$$
      - (Contraction) $$\c_A : !A \to !A \otimes !A$$

      which form a commutative comonad and are coalgebra morphisms.
      
   b. Whenever $$f : (!A,\delta_A) \mto (!B,\delta_B)$$ is a coalgebra morphism between free coalgebras, then it is also a comonoid morphism.

There is a lot packed into this definition,  but we will expanded it in the next two sections.

Linear Categories Simplified
----------------------------

The simplification amounts to realizing that part b can be proven from the previous parts of the definition of a linear category.


Equivalence
-----------

