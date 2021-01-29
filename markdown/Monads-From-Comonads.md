---
title: "From monads to comonads and back"
date: 2021-01-29
categories:
 - monads
 - comonads
 - category theory
 - semantics
 - adjunctions
 - paper-review
abstract: "A brief review of the paper 'Monads from Comonads, Comonads from Monads' by Ralf Hinze."
twitter-post: ""
---


I was recently recommended the paper [Monads from Comonads, Comonads
from Monads: An exercise in program
transformation](http://www.cs.ox.ac.uk/ralf.hinze/WG2.8/28/slides/Comonad.pdf
) by Ralf Hinze. It's a nice read, and I love the results.  

I was taken aback by the title, because I thought that this couldn't
be true in general. I mean, due to the duality between monads and
comonads for every monad there is a comonad and vice versa, but they
will not be equivalent necessarily.

One example where a monad and a comonad differ can be found in linear
logic. Take the of-course modality $!A$ which is a comonad $! :
\cat{M} \mto{} \cat{M}$ on a symmetric monoidal category which adds
the structural rules to linear logic.  Take it's dual and we arrive at
the why-not modality $? : \cat{M} \mto{} \cat{M}$. These two are not
equivalent. I don't know of any monad that is equivalent to $!$ nor a
comonad that is equivalent to $?$; and I suspect there aren't any. So
in order for the results of this paper to work, there must be an
additional assumption on the monad/comonad.

It turns out that there is an additional assumption. Hinze shows that
given an adjunction $\cat{A} : \func{F} \dashv \func{G} : \cat{A}$
where $\func{G} : \cat{A} \mto{} \cat{A}$ is also a monad, then
$\func{F} : \cat{A} \mto{} \cat{A}$ is also a comonad. The first thing
to notice is that this is not a general adjunction, because the
functors must be endo-functors in order for the adjuncts to be a monad
and a comonad respectively. So this is not true for every monad and
comonad, but only those of which have left and right adjoints
respectively.  This means that for the of-course comonad there is no
equivalent monad, because it does not have a right adjoint. The case
is similar for the why-not monad.

But, if your monad or comonad can be shown to have left and right
adjoints, then those adjoints are an equivalent--in terms of
expressivity--comonad or monad respectively. This is a nice result.
In addition, Hinze shows that the adjunction induces program
transformations that translate the monad to its equivalent comonad and
vice versa. Thus allowing one to program using which ever structure is
easiest, and then obtaining the other through a transformation that
could be automated.

I recommend reading the paper for the details.
