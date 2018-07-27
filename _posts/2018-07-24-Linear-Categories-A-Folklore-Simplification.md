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

Recently, I read [this paper](https://lipn.fr/~mazza/papers/CoreQuantCoeff.pdf).  The authors use a simplified definition of a linear category, but without proof that their definition is really the same.  So I emailed them about it, and started a nice conversion with [Damiano Mazza](http://www-lipn.univ-paris13.fr/~mazza/), [Marco Gaboardi](http://www.acsu.buffalo.edu/~gaboardi/), and [Flavien Breuvart](http://www.lipn.univ-paris13.fr/~breuvart/).  Then at [FLOC 2018](http://www.floc2018.org/) this year I got the opportunity to meet [Damiano Mazza](http://www-lipn.univ-paris13.fr/~mazza/), [Marco Gaboardi](http://www.acsu.buffalo.edu/~gaboardi/), and a few others for lunch.  I learned from Damiano that that their simplification to the definition of linear categories is correct, but this simplification seems to be folklore.  So in this post I am going to write out this simplification, and prove that it is equivalent to the original definition of a linear category. 

Linear Categories
-----------------

Linear categories are one of the first sound and complete categorical models of intuitionistic linear logic proposed in Gavin Bierman's [thesis](https://pdfs.semanticscholar.org/4abd/9b55397235e50c1ea9756626cd54e3ecb353.pdf).  He shows that the linear exponential, $$!A$$, can be modeled as a symmetric monoidal comonad. His original definition ([Definition 35 on p. 140](https://pdfs.semanticscholar.org/4abd/9b55397235e50c1ea9756626cd54e3ecb353.pdf)) is as follows.

<span class="definition"> A *linear category*, $$\cat{C}$$, consists of the following structure:</span>    

1. A symmetric monoidal category, $$\cat{C}$$, with finite products and coproducts,
2. A symmetric monoidal comonad $$(!,\varepsilon, \delta, \m_{A,B}, \m_I)$$ such that

   a. For every free $$!$$-coalgebra $$(!A,\delta_A)$$ there are two distinguished monoidal natural transformations with components:
   
      - (Weakening) $$\w_A : !A \mto I$$
      - (Contraction) $$\c_A : !A \to !A \otimes !A$$

      which form a commutative comonad and are coalgebra morphisms.
      
   b. Whenever $$f : (!A,\delta_A) \mto (!B,\delta_B)$$ is a coalgebra morphism between free coalgebras, then it is also a comonoid morphism.

There is a lot packed into this definition,  but we will expanded it in the next section.

Linear Categories Simplified
----------------------------

Essentially, the simplification amounts to realizing that part b can be proven from the previous parts of the definition of a linear category, but with an additional assumption that is simpler than part b.    The expanded simplified definition is as follows.

<span class="definition"> A *linear category*, $$\cat{A}$$, consists of the following structure:</span>    

1. A is a symmetric monoidal category $$(\mathcal{A},\otimes,I,\lambda,\rho,\alpha,\beta)$$,

2. A linear exponential comonad, $$(!_{-},\delta,\varepsilon)$$, which has the following structure:

   - The endofunctor $$! : \mathcal{A} \mto \mathcal{A}$$ forms comonad on $$\cat{A}$$.  That is, there are two natural transformations $$\delta : ! A \mto !! A$$ and $$\varepsilon : !A \mto A$$ that make the following diagrams commute:
   
     <center><img src="/images/posts/2018-07-24-Linear-Categories-A-Folklore-Simplification/comonad-diags.png" width="75%"></center>

   - Four natural transformations:

     - (Monoidal Map) $$\m_{A,B} : ! A \otimes ! B \mto ! (A \otimes B)$$
     
     - (Monoidal Unit Map) $$\m_I : I \mto ! I$$
     
     - (Contraction) $$\c : !A \mto !A \otimes !A$$
     
     - (Weakening) $$\w : ! A \mto I$$

   - The functor $$! : \mathcal{A} \mto \mathcal{A}$$ is symmetric monoidal.  That is, the following diagrams must commute:

     <center><img src="/images/posts/2018-07-24-Linear-Categories-A-Folklore-Simplification/sym-monoidal-diags.png" width="100%"></center>

   - The functor $$! : \cat{A} \mto \cat{A}$$ is a symmetric monoidal comonad.  That is, the following diagrams must commute:

     <center><img src="/images/posts/2018-07-24-Linear-Categories-A-Folklore-Simplification/smc-comonad-diags.png" width="90%"></center>

   - Weakening must satisfy the following diagrams:

     <center><img src="/images/posts/2018-07-24-Linear-Categories-A-Folklore-Simplification/weakening-diags.png" width="90%"></center>

   - Contraction must satisfy the following diagrams:

     <center><img src="/images/posts/2018-07-24-Linear-Categories-A-Folklore-Simplification/contraction-diags.png" width="100%"></center>

   - Weakening and contraction form a commutative comonoid.  That is, the following diagrams commute:

     <center><img src="/images/posts/2018-07-24-Linear-Categories-A-Folklore-Simplification/comm-comonoid-diags.png" width="100%"></center>

   - Weakening and contraction are coalgebra morphisms.  That is, the following diagrams must commute:

     <center><img src="/images/posts/2018-07-24-Linear-Categories-A-Folklore-Simplification/coalgebra-morphisms.png" width="90%"></center>

   - $$\delta_A : !A \mto !!A$$ is a comonoid morphism between the comonoids $$(!A,\w,\c)$$ and $$(!!A,\w,\c)$$.  That is, the following diagrams must commute:

     <center><img src="/images/posts/2018-07-24-Linear-Categories-A-Folklore-Simplification/delta-comonoid-morphism-diags.png" width="90%"></center>

All of the structure in the previous definition except for the last bullet corresponds to part 1 and part 2.a of the original definition of a linear category.  The last bullet is a simplification of part 2.b.  We now show that we can prove part 2.b from the assumptions in this simplified definition.


<span class="lemma"> Whenever $$f : (!A,\delta_A) \mto (!B,\delta_B)$$ is a coalgebra morphism between free coalgebras, then it is also a comonoid morphism.</span>

<span class="proof"></span>
  Suppose $$f : (!A,\delta_A) \mto (!B,\delta_B)$$ is a coalgebra morphism between free coalgebras.  This assumption amounts to assuming the following diagram commutes:

  <center><img src="/images/posts/2018-07-24-Linear-Categories-A-Folklore-Simplification/f-coalgebra-morph-diag.png" width="20%"></center>

  It suffices to show that $$f : (!A,\delta_A) \mto (!B,\delta_B)$$ is also a comonoid morphism. Hence, we must show that the following diagrams commute:

  <center><img src="/images/posts/2018-07-24-Linear-Categories-A-Folklore-Simplification/must-show-diags.png" width="50%"></center>

  The left diagram commutes, because the following expanded one does:

  <center><img src="/images/posts/2018-07-24-Linear-Categories-A-Folklore-Simplification/weakening-proof.png" width="50%"></center>

  Diagrams $$(1)$$ and $$(4)$$ commute because $$\delta$$ is a comonoid morphism, diagram $$(2)$$ commutes because $$f$$ is assumed to be a coalgebra morphism, and diagram $$(3)$$ commutes by naturality of $$\w$$.  Note that we have numbered the previous diagram in the order of the necessary replacements needed when doing the same proof equationally, and we do the same for the next diagram.  This should make it easier to reconstruct the proof.

  The diagram for contraction commutes (the diagram on the right above), because the following expanded one does:

  <center><img src="/images/posts/2018-07-24-Linear-Categories-A-Folklore-Simplification/contraction-proof.png" width="70%"></center>

  Diagram $$(3)$$ commutes because $$f$$ is assumed to be a coalgebra morphism, diagram $$(4)$$ commutes by naturality of $$\c$$, diagram $$(5)$$ commutes by naturality of $$\m$$, and diagram $$(6)$$ commutes by naturality of $$\varepsilon$$.

  Diagrams $$(1)$$ and $$(8)$$ commute, because the following one does:  

  <center><img src="/images/posts/2018-07-24-Linear-Categories-A-Folklore-Simplification/contaction-diag-one.png" width="50%"></center>

  The left triangle commutes, because $$! : \cat{A} \mto \cat{A}$$ is a comonad, and the bottom diagram commutes by naturality of $$\varepsilon$$.

  Finally, diagrams $$(2)$$ and $$(7)$$ do not actually commute, but are parallel morphisms whose cofork is $$\delta$$.  That is, the following diagram commutes:

  <center><img src="/images/posts/2018-07-24-Linear-Categories-A-Folklore-Simplification/contraction-diag-two.png" width="50%"></center>

  The left diagram commutes because $$\delta : !X \mto !!X$$ is a comonoid morphism, and the right diagram commutes because weakening and contraction are coalgebra morphisms.

  Therefore, the original diagram above corresponds to the following equational proof:

  <center><img src="/images/posts/2018-07-24-Linear-Categories-A-Folklore-Simplification/eq-reasoning.png" width="50%"></center>
  &#9612;


Conclusion
---------

This was a really fun proof, but not at all obvious.  Folklore results hinder scientific progress, and hinder new comers from progressing in our field.  We need to be writing down these types of results so others do not have to!  This is the point of research after all.

If anyone knows of a paper that writes this proof down, then I would like to know about it so I can cite it in future work.  I will update this post with any citations I can find.

**Updates:** Jean-Simon Lemay has communicated to Damiano that this first appeared in a paper by Cocket, Seely, and Blute, but I have not had time to dig through their papers to get the precise citation yet.