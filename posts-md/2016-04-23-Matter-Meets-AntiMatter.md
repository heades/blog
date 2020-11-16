---
layout: blog
title: "The Collapse: When Matter Meets Antimatter"
date: 2016-04-23
categories:
 - category theory
 - duality
 - co-implication
 - co-internal hom
---

\\(
\newcommand{\cat}[1]{\mathbf{#1}}
\newcommand{\homs}[2]{\mathsf{Hom}(#1,#2)}
\newcommand{\imor}[0]{\bigtriangledown}
\newcommand{\tmor}[0]{\bigtriangleup}
\\)
One characteristic which sets category theory apart from other theories is that for any concept there exists a dual. This makes category theory an obvious choice when setting out on an investigation of a dual concept.  In this post we take a look at the less well-known dual of implication which we call coimplication, but is also known as <a href="http://www.sciencedirect.com/science/article/pii/S0304397599001243">subtraction</a> or <a href="http://www.aiml.net/volumes/volume7/Gore-Postniece-Tiu.pdf">exclusion</a>.

Implication corresponds to the right adjoint of the cartesian product.  That is, a cartesian category \\(\cat{C}\\) models implication if the functor \\(A \times (-) : \cat{C} \to \cat{C}\\) has a right adjoint, which we denote \\(A \Rightarrow B\\) for objects \\(A\\) and \\(B\\).  By the functor \\(A \times (-) : \cat{C} \to \cat{C}\\) having a right adjoint we mean that there is a natural bijection \\(\mathsf{cur} : \homs{A \times B}{C} \cong \homs{A}{B \Rightarrow C}\\).  This gives rise to the necessary tools for working with implication like currying, which is given by the bijection itself, and evalution \\(\mathsf{eval} : (A \Rightarrow B) \times A \to B\\).  As an example using these morphisms along with the associator, \\(\alpha : (A \times B) \times C \to A \times (B \times C)\\), and the symmetry, \\(\beta : A \times B \to B \times A\\), of the cartesian product we can prove \\(\mathsf{cur}(\alpha;(\mathsf{id} \times \beta);\alpha^{-1};(\mathsf{eval} \times \mathsf{id});\beta;\mathsf{eval}) : (A \Rightarrow B) \times (B \Rightarrow C) \to (A \Rightarrow C)\\).  A category with products, a terminal object, and the right adjoint to the product functor is called a <strong>cartesian closed category (CCC)</strong>, and the right adjoint to the product is often called the interal hom, because it can be seen as a bifunctor: \\((-) \Rightarrow (-) : \cat{C}^{\mathsf{op}} \times \cat{C} \to \cat{C}\\) which is an internalization of the homspace functor.

Now coimplication corresponds to the left adjoint of the coproduct functor.  This is dual to that of implication.  Thus, we have a bijection \\(\mathsf{cocur} : \homs{B}{C + A} \cong \homs{A - B}{C}\\).  We also have the coevaluator \\(\mathsf{coeval} : B \to (A - B) + A\\).  The left adjoint to the coproduct functor is called the co-internal hom, and a category with coproducts, an initial object, and a co-internal hom is called a <strong>cocartesian coclosed category (coCCC)</strong>.

The question this post gives an answer to is "does it make sense to have a category that is both cartesian closed and cocartesian co-closed?"  The answer happens to be negative and is due to <a href="http://www.sciencedirect.com/science/article/pii/S0304397599001243">Tristan Crolard</a>.  The main result that we will need is due to <a href="https://en.wikipedia.org/wiki/André_Joyal">Andr&eacute; Joyal</a>.  We will show that any category which is both cartesian closed and cocartesian coclosed is degenerative in the sense that it is a preorder, that is, for any two objects \\(A\\) and \\(B\\) the homspace \\(\homs{A}{B}\\) has at most one element.  We call a category that is both a CCC and a coCCC a <strong>bi-cartesian closed categories (biCCC)</strong>.

First, we need some basic results.  
<span class="lemma"> In any CCC \\(\cat{C}\\), if \\(\perp\\) is an initial object in \\(\cat{C}\\) and \\(\homs{A}{\perp}\\) is non-empty, then \\(A \cong A \times \perp\\).</span>
<span class="proof">
  This follows easily from the universial mapping property for products. &#9612;
</span>

<span class="lemma"> In any CCC \\( C \\), if \\(\perp\\) is an initial object in \\(\cat{C}\\), then so is \\(\perp \times A\\) for any object \\(A\\) of \\(\cat{C}\\).</span>
<span class="proof">
  We know that the universal morphism for the initial object is unique, and hence, the homspace \\(\homs{\perp}{A \Rightarrow B}\\) for any object \\(B\\) of \\(\cat{C}\\).  Then using the right adjoint to the product functor we know that \\(\homs{\perp}{A \Rightarrow B} \cong \homs{\perp \times A}{B}\\), and hence, there is only one arrow between \\(\perp \times A\\) and \\(B\\). &#9612;
</span>

<span class="lemma"> In any CCC \\(\cat{C}\\), if \\(\top\\) is a terminal object in \\(\cat{C}\\), then for any object \\(A\\), \\(\top \times A \cong A \cong A \times \top\\).</span>
<span class="proof">
  This follows easily from the universial mapping property for products. &#9612;
</span>

Observe the following.
<span class="lemma"> A biCCC is a CCC whose dual is also a CCC.</span>
<span class="proof">
  Follows from a straightforward use of duality. &#9612;
</span>
Thus, the three basic results we gave apply to any biCCC.

We have now arrived at the main result by Joyal.
<span class="theorem">
  In any CCC \\(\cat{C}\\), if \\(\perp\\) is an initial object in \\(\cat{C}\\) and \\(\homs{A}{\perp}\\) is non-empty, then \\(A\\) is an initial object in \\(\cat{C}\\).</span>
<span class="proof">
  Suppose \\(\cat{C}\\) is a CCC such that \\(\perp\\) is an initial object in \\(\cat{C}\\), and \\(A\\) is an arbitrary object in \\(\cat{C}\\).  Furthermore, suppose \\(\homs{A}{\perp}\\) is non-empty.  By the first basic lemma above we know that \\(A \cong A \times \perp\\), and by the second \\(A \times \perp\\) is initial, thus \\(A\\) is initial. &#9612;
</span>

Notice that the proof of the previous lemma hinges on the fact that the universal morphism is unique.  If we took the initial object to be weak instead, then the previous result would not hold.

Finally, we have the main result of this post due to Crolard.
<span class="theorem">
  If \\(\cat{C}\\) is a biCCC, then for any two object \\(A\\) and \\(B\\) of \\(\cat{C}\\), \\(\homs{A}{B}\\) has at most one element.
</span>  
<span class="proof">
  Suppose \\(\cat{C}\\) is a biCCC, and \\(A\\) and \\(B\\) are objects of \\(\cat{C}\\).  We know from above that \\(B \cong \top \times B\\). Thus, we know that \\(\homs{B}{A} \cong \homs{\top \times B}{A}\\). Using the internal hom adjunction we know the following:
  <br>
  \\(\homs{B}{A} \cong \homs{\top \times B}{A} \cong \homs{\top}{B \Rightarrow A}\\)
  <br>
  Taking the dual of this chain of isomorphisms yields:
  <br>
  \\(\homs{A}{B} \cong \homs{A}{\perp + B} \cong \homs{B - A}{\perp}\\)
  <br>
  Therefore, by Joyal's theorem above \\(\homs{A}{B}\\) has at most one element. &#9612;
</span>

Again, the previous result hinges on Joyal's result, but can be prevented by using weak initial objects.

So, what are the repercussions of all of this?  We do not have a categorical proof theory for languages consisting of implication and coimplication.  For example, the logics: <a href="http://www.sciencedirect.com/science/article/pii/S0304397599001243">subtractive logic</a>, <a href="http://www.aiml.net/volumes/volume7/Gore-Postniece-Tiu.pdf">L</a>, and <a href="http://metatheorem.org/wp-content/papers/dual-tt.pdf">dualized intutionistic logic</a>.  This is not desirable.

Are there anyways around this?  Well, taking weak initial objects is one way.  Interestingly enough, the structural rules are causing havoic here.  If we take instead of cartesian closed categories and cocartesian coclosed categories we use monoidal closed and monoidal coclosed categories we do not have any issues.  The internal hom then would be a right adjoint to the tensor product, and the cointernal hom would be the left adjoint of par.  So an option is to work with linear logic instead.  In fact, Lambek used the cointernal hom in his work on categorical grammars.  Another option is to split the atom and keep the cartesian closed part separate from the co-cartesian closed part.  This is the direction I am working on right now.  I plan to talk more about this in a future post.
