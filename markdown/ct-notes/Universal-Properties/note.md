---
title: 'Universal Properties'
abstract: 'A note on universal properties and the Yoneda lemma.'
author: 'Harley Eades III'
contact: 'harley.eades@gmail.com'
---

- __Cartesian Products.__ Given sets $A$ and $B$ their cartesian
  product $A \times B$ induces two functions $\pi_1 : A \times B \mto
  A$ and $\pi_2 : A \times B \mto B$ called the __projection
  maps__. Using these projections we can state a useful property of
  cartesian products.  Suppose we have functions $f : C \mto A$ and $g
  : C \mto B$ for some arbitrary set $C$.  Then there is a unique
  function $\langle f,g \rangle : C \mto A \times B$ such that the
  following hold:

  $$
  \begin{array}{lll}
    \langle f,g \rangle;\pi_1 = f\\
    \langle f,g \rangle;\pi_2 = g
  \end{array}
  $$
  
  This property can be summed up as the following diagram:

  ```{.latex-disp-img src="foo" cap="bar"}
  \bfig
        \dtriangle|ama|/->`-->`<-/<500,500>[C`A`A \times B;f`\langle f,g \rangle!`\pi_1]
        \btriangle(500,0)|maa|/-->`->`->/<500,500>[C`A \times B`B;\langle f,g \rangle!`g`\pi_2]
  \efig
  ```

  The dotted line stands for *there exists* and the bang (exclamation
  mark) stands for *unique*.

  Notice that we have not given the definition of $\langle f,g \rangle$,
  but only its defining property, but this property
  implies that $\langle f,g \rangle$ must be defined to be:
  
  $$
  \begin{array}{lll}
    \langle f,g \rangle : C \mto A \times B\\
    \langle f,g \rangle(c) = (f(c),g(c))
  \end{array}
  $$

  Thus, this property gives us a way to pair functions with a common
  domain, and this pairing acts the way we expect it to act when we
  run it on some elements.

- __Meets in Preorders.__ Suppose we have a preorder $(P,\leq)$.  Then
  we say that the preorder $(P,\leq)$ has __meets__ if given two
  elements $p,q \in P$, there is an element $p \land q \in P$ such
  that:
  
  - $(p \land q) \leq p$
  - $(p \land q) \leq q$
  - If $r \leq p$ and $r \leq q$, then $r \leq (p \land q)$
  
  Recall that if we treat the preorder $(P,\leq)$ as a category then
  we take $P$ as the set of objects, and there is a morphism $p \mto^f
  q$ if and only if $p \leq q$.  Thus, every homset $\Hom{P}{p}{q}$
  has at most one morphism in it.  Using this perspective we can
  recast the definition of meets in categorical terms.  It says, for
  any two objects $p$ and $q$ there is an object $p \land q$ with two
  projection maps $(p \land q) \mto^{\pi_1} p$ and $(p \land q)
  \mto^{\pi_2} q$ such that for any object $r$, if there are morphisms
  $r \mto^f p$ and $r \mto^g q$ there is a unique morphism $r
  \mto^{\langle f,g \rangle} p \land q$\footnote{Note here that if
  these morphisms exists then the latter is guaranteed to be unique,
  because at most one morphism exists between any two objects.}.

  Using this definition of meets we can prove two facts:

  1. Given morphisms $r \mto^f p$ and $r \mto^g q$, $\langle f,g \rangle;\pi_1 = f$.
     \begin{proof}
      Suppose we have morphisms $r \mto^f p$ and $r \mto^g q$.  Thus,
      we know that $r \leq p$ and $r \leq q$.  Then we know by the
      definition of meets that there are morphisms $(p \land q)
      \mto^{\pi_1} p$ and $r \mto^{\langle f,g \rangle} p \land q$
      which both imply that $(p\land q) \leq p$ and $r \leq (p\land
      q)$.  We must show that $\langle f,g \rangle;\pi_1 = f$, but
      $\langle f,g \rangle;\pi_1$ is defined to be $r \leq (p \land q)
      \leq p$ which holds by transitivity, and is exactly $r \leq p$ or $r \mto^f p$.
      \end{proof}
      
  2. Given morphisms $r \mto^f p$ and $r \mto^g q$, $\langle f,g \rangle;\pi_2 = g$.
     \begin{proof}
        Left as an exercise.
     \end{proof}

  We can sum all of this up into the following diagram.  A preorder,
  $(P,\leq)$, has meets if for any two objects $p,q \in P$, there is
  an object $(p \land q) \in P$ such that the following diagram commutes:

  ```{.latex-disp-img src="foo" cap="bar"}
  \bfig
    \dtriangle|ama|/->`-->`<-/<500,500>[r`p`p \land q;f`\langle f,g \rangle!`\pi_1]
    \btriangle(500,0)|maa|/-->`->`->/<500,500>[r`p \land q`q;\langle f,g \rangle!`g`\pi_2]
  \efig
  ```

  This is the same digram as the first example!  Thus, meets in a
  preorder have the same __defining property__ as cartesian
  products in sets!
