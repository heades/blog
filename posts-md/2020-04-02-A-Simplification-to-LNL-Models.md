---
layout: blog
title: "A Simplification to LNL Models"
date: 2020-04-10
categories:
 - linear/non-linear models
 - logic
 - linear logic
 - monoidal categories
 - category theory
---

<div id="divCheckbox" style="display: none;">
$$
\newcommand{\cat}[1]{\mathcal{#1}}
\newcommand{\func}[1]{\mathsf{#1}}
\newcommand{\Lin}[0]{\func{Lin}}
\newcommand{\Mny}[0]{\func{Mny}}
\newcommand{\Forget}[0]{\func{Forget}}
\newcommand{\Free}[0]{\func{Free}}
\newcommand{\mto}[0]{\to}
\newcommand{\Hom}[3]{\mathsf{Hom}_{\cat{#1}}(#2,#3)}
\newcommand{\interp}[1]{[\negthinspace[#1]\negthinspace]}
$$
</div>

This is a known result that I'm using in some recent work I am writing
up, and so I figured why not write a post about it.

In this post I am going to explain a simplification to [Benton's
beautiful LNL
models](http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.36.5454&rep=rep1&type=pdf)
that reduces their complexity, but retains their expressive power.  I
learned of this simplification from [Paul-André
Melliès'](https://www.irif.fr/~mellies/) writings.  First, let's take
a look at the original definition of LNL models, and how they relate
to linear categories.

LNL Models
---

A **Linear/Non-Linear (LNL) model** is an symmetric monoidal adjunction $$\cat{C} : \Lin \dashv \Mny : \cat{M}$$, where:
- $$\cat{C}$$ is a cartesian closed category,
- $$\cat{M}$$ is a symmetric monoidal closed category,
- (Linear) $$\Lin : \cat{C} \mto \cat{M}$$ is a symmetric monoidal functor, and
- (Many)   $$\Mny : \cat{M} \mto \cat{C}$$ is a symmetric monoidal functor.

Intuitively, we can think of $$\cat{C}$$ as a model of intuitionistic
logic (or the simply-typed $$\lambda$$-calculus), $$\cat{M}$$ as a
model of intuitionistic linear logic, and the functors $$\Lin$$ and
$$\Mny$$ as modalities that allows one to translate formulas on one
side to the other.  The adjunction $$\cat{C} : \Lin \dashv \Mny :
\cat{M}$$ ensures that these translations are well behaved.

LNL models are equivalent to Bierman's linear categories.  In fact, I
wrote a [blog
post](/2018/07/24/Linear-Categories-A-Folklore-Simplification.html) in
2018 on a simplification to linear categories, so check that post out
if you are unfamiliar with linear categories.  The of-course modality
of linear logic, denoted by $$!A$$, is characterized in linear
categories by a symmetric monoidal comonad on a symmetric monoidal
closed category.  Benton showed that we can define the of-course
modality as $$!A = \Lin(\Mny\,A) : \cat{M} \mto \cat{M}$$, and hence,
is the comonad induced by the adjunction.  Furthermore, since the
adjunction is monoidal and between two symmetric monoidal functors,
the induced comonad is symmetric monoidal as well.

An extremely useful result shown by Benton is that the functor $$\Lin :
\cat{C} \mto \cat{M}$$ is strong monoidal; e.g., the following
isomorphisms hold:

$$
\begin{array}{ll}
\Lin \perp = I\\
\Lin\,(X \times Y) = \Lin\,X \otimes \Lin\,Y
\end{array}
$$

This is enough to ensure that the category $$\cat{M}$$ with the
induced comonad of the adjunction forms a linear category.  Thus, LNL
models imply linear categories, but the other direction is more
interesting.

Given a linear category $$(\cat{L}, !, \varepsilon, \delta)$$ we need
to find a cartesian closed category and a symmetric monoidal closed
category that form an LNL model.  It is well known that for any comonad
$$c : \cat{A} \mto \cat{A}$$ on some category $$\cat{A}$$, there are
two adjunctions $$\cat{A}^c : \Forget \dashv \Free : \cat{A}$$ and
$$\cat{A}_c : \Forget \dashv \Free : \cat{A}$$ between the category
$$\cat{A}$$ and the coEilenberg-Moore category -- the category of
$$c$$-coalgebras -- and the Kleisli category -- the category of free
$$c$$-coalgebra respectively, where $$\Forget(A,h_A) = A$$ and
$$\Free(A) = (!A,\delta_A)$$ are the forgetful and free functors.
Benton showed that $$\cat{L}^!$$ is cartesian, but it is not the case
in general that $$\cat{L}_!$$ is, because the product of two free
coalgebras may not be free.  Furthermore, neither of these are
closed in general.

To remedy these issues Benton found that the free coalgebras have an
internal hom between them which is also free, and thus, by taking the
full subcategory of $$\cat{L}^!$$ of all the exponential objects --
objects with an internal hom -- then we get a cartesian closed
category, and this full subcategory contains $$\cat{L}_!$$.  Then he
identifies a second cartesian closed category of all of the finite
products of free coalgebras in the category of exponential objects. We
can use either of these to form a LNL model.

This is a lot of work to get an internal hom, but is it worth the
work?  Is it possible to ask for the category $$\cat{C}$$ in the
definition of LNL model to be simply cartesian, and then finding such
a category from a linear category is easy, it's $$\cat{L}^!$$.  The
answer turns out to be positive.

The Simplified Model
---

Taking the following simplified model we show that it implies a linear
category, we do not show the opposite, because it follows as a
corollary from the original proof summarized above.

A **Simplified Linear/Non-Linear (LNL) model** is an **adjunction** $$\cat{C} : \Lin \dashv \Mny : \cat{M}$$, where:
- $$\cat{C}$$ is a **cartesian category**,
- $$\cat{M}$$ is a symmetric monoidal closed category,
- (Linear) $$\Lin : \cat{C} \mto \cat{M}$$ is a strong symmetric monoidal functor, and
- (Many)   $$\Mny : \cat{M} \mto \cat{C}$$ **is functor**.

In the above I highlight the simplifications which are actually
generalizations.  We can see that this definition removes the
requirements that $$\cat{C}$$ be closed, the adjunction be symmetric
monoidal, and the functor $$\Mny$$ be monoidal.  This is nice, because
generalizing the definition makes finding LNL models easier.

The requirement that $$\Lin$$ be strong symmetric monoidal paired with
an adjunction is a particularly strong property.  First, suppose
$$\cat{A} : \func{F} \dashv \func{G} : \cat{B}$$ is an adjunction
between monoidal categories; so $$\func{F}$$ and $$\func{G}$$ are plan
functors. The there are two really nice results:

1. [(p. 108, Proposition 12)](https://www.irif.fr/~mellies/mpri/mpri-ens/biblio/categorical-semantics-of-linear-logic.pdf)
Every lax monoidal structure, $$m : \func{F}X \otimes \func{F}Y \mto
\func{F}(X \bullet Y)$$ on $$\func{F} : \cat{A} \mto \cat{B}$$,
induces an oplax monoidal structure $$n : \func{G}A \bullet \func{G}B
\mto \func{G}(A \otimes B)$$ on $$\func{G} : \cat{B} \mto \cat{A}$$,
and conversely.  Furthermore, these mappings from $$m$$ to $$n$$ and
back define an isomorphism giving a one-to-one relationship between
the lax monoidal structure on one side of the adjunction and the
other.

2. [(p. 112, Proposition 14)](https://www.irif.fr/~mellies/mpri/mpri-ens/biblio/categorical-semantics-of-linear-logic.pdf)
Suppose $$(\func{F},m)$$ is lax monoidal.  Then the adjunction
$$\cat{A} : \func{F} \dashv \func{G} : \cat{B}$$ lifts to a monoidal adjunction
$$(\cat{A},m) : \func{F} \dashv \func{G} : (\cat{B},p)$$ iff
the lax monoidal functor $$\func{F}$$ is strong.  In the right-to-left
case, the lax structure $$p$$ is associated with $$\func{G}$$ using
part 1 and setting $$n = m^{-1}$$.

We can add symmetry to the above properties, and they still hold.
Thus, the second result above gives us a means of recovering a lax
monoidal structure on the functor $$\Mny : \cat{M} \mto \cat{C}$$.
Therefore, simplified LNL models imply the following definition:

A **Semi-simplified Linear/Non-Linear (SSLNL) model** is an symmetric monoidal adjunction $$\cat{C} : \Lin \dashv \Mny : \cat{M}$$, where:
- $$\cat{C}$$ is a **cartesian category**,
- $$\cat{M}$$ is a symmetric monoidal closed category,
- (Linear) $$\Lin : \cat{C} \mto \cat{M}$$ is a strong symmetric monoidal functor, and
- (Many)   $$\Mny : \cat{M} \mto \cat{C}$$ is a symmetric monoidal functor.

Showing that this definition implies a linear category is easy, we can
just use [Benton's proof (p. 16, Section
2.2.1)](http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.36.5454&rep=rep1&type=pdf). Thus,
the simplified definition of a LNL model implies linear category.

At this point the only question left is, but what about non-linear
implications / functions?  In the original model the cartesian closed
category is a model of non-linear logic / simply-type
$$\lambda$$-calculus and on the other side we have a model of linear
logic.  Can we still obtain an encoding of non-linear logic using the
simplified definition?

We can indeed by first exploiting the adjunction and the fact that
$$\cat{M}$$ is closed.  Let $$X$$ and $$B$$ be objects in $$\cat{C}$$
and $$\cat{M}$$ respectively.  Then define the object:

$$X \Rightarrow B := \Lin\,X \multimap B$$

Then there is a bijection:

$$
\begin{array}{llll}
\Hom{C}{X \bullet Y}{\Mny\,B}
& \cong & \Hom{M}{\Lin(X \bullet Y)}{B} \\
& \cong & \Hom{M}{\Lin\,X \otimes \Lin\,Y)}{B} \\
& \cong & \Hom{M}{\Lin\,X}{\Lin\,Y \multimap B} \\
& = & \Hom{M}{\Lin\,X}{Y \Rightarrow B} \\
& \cong & \Hom{C}{X}{\Mny\,(Y \Rightarrow B)}
\end{array}
$$

This is a kind of currying, and is enough to interpret non-linear
logic where we encode the formulas in the form of $$\Mny\,A$$ for
linear formulas $$A$$ in $$\cat{M}$$. In more detail, the
interpretation is in the form of a faithful functor defined on types
as follows:

$$
\begin{array}{ll}
\interp{\top} = I\\
\interp{A \times B} = \interp{A} \otimes \interp{B}\\
\interp{A \Rightarrow B} = (\Lin\,\Mny\,\interp{A} \multimap \interp{B})
\end{array}
$$

Then sequents $$x_1 : A_1, \cdots, x_i : A_i \vdash t : b$$ are
interpreted as morphisms from $$\Mny\,\interp{A_1} \bullet \cdots \bullet
\Mny\,\interp{A_i}$$ to $$\Mny\,\interp{B}$$.

Using this we can show that every equation in the theory is preserved
by the interpretation.  This proves that the interpretation soundly
models the theory in an LNL model.  Faithfulness ensures that every
proof is caputed by our model.

This simplifies the model a lot, but how does it affect the syntactic
side of things?  Well, we get to remove the rules for non-linear
implication, and derieve them which is appealing both theoretically
and practically.