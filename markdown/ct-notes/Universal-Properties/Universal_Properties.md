---
title: 'Universal Properties'
date: 02-01-2021
abstract: 
    'A note on universal properties and the Yoneda lemma.<br>
     Updates: Added example showing representability for adjoint functors.'
author: 'Harley Eades III'
contact: 'harley.eades@gmail.com'
bibliography: ref.bib
link-citations: true
---

\renewcommand{\ottnt}[1]{#1}
\newcommand{\Fun}[2]{\Hom{[[Set]]}{#1}{#2}}

# Introduction

- __Cartesian Products.__ Given sets $A$ and $B$ their cartesian
  product $A \times B$ induces two functions $\pi_1 : A \times B \mto{}
  A$ and $\pi_2 : A \times B \mto{} B$ called the __projection
  maps__. Using these projections we can state a useful property of
  cartesian products.  Suppose we have functions $f : C \mto{} A$ and $g
  : C \mto{} B$ for some arbitrary set $C$.  Then there is a unique
  function $\langle f,g \rangle : C \mto{} A \times B$ such that the
  following hold:
  
  $$
  \begin{array}{lll}
    \langle f,g \rangle;\pi_1 = f\\
    \langle f,g \rangle;\pi_2 = g
  \end{array}
  $$
  
  This property can be summed up as the following diagram:

  ```{.latex-disp-img width="30%"
                      src="/images/posts/ct-notes/Universal-Properties/prod-uniprop.png"
                      cap="Commutative diagram of the universal property for products in the category of sets and functions."}
  \bfig
  \dtriangle|ama|/->`-->`<-/<500,500>[C`A`A \times B;f`\langle f,g \rangle!`\pi_1]
  \btriangle(500,0)|maa|/-->`->`->/<500,500>[C`A \times B`B;\langle f,g \rangle!`g`\pi_2]
  \efig
  ````
  
  The dotted line stands for *there exists* and the bang (exclamation
  mark) stands for *unique*.

  Notice that we have not given the definition of $\langle f,g \rangle$,
  but only its defining property, but this property
  implies that $\langle f,g \rangle$ must be defined to be:
  
  $$
  \begin{array}{lll}
    \langle f,g \rangle : C \mto{} A \times B\\
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
  we take $P$ as the set of objects, and there is a morphism $p \mto{f}
  q$ if and only if $p \leq q$.  Thus, every homset $\Hom{P}{p}{q}$
  has at most one morphism in it.  Using this perspective we can
  recast the definition of meets in categorical terms.  It says, for
  any two objects $p$ and $q$ there is an object $p \land q$ with two
  projection maps $(p \land q) \mto{\pi_1} p$ and $(p \land q)
  \mto{\pi_2} q$ such that for any object $r$, if there are morphisms
  $r \mto{f} p$ and $r \mto{g} q$ there is a unique morphism $r
  \mto{\langle f,g \rangle} p \land q$\footnote{Note here that if
  these morphisms exists then the latter is guaranteed to be unique,
  because at most one morphism exists between any two objects.}.

  Using this definition of meets we can prove two facts:

  1. Given morphisms $r \mto{f} p$ and $r \mto{g} q$, $\langle f,g \rangle;\pi_1 = f$.
     \begin{proof}
      Suppose we have morphisms $r \mto{f} p$ and $r \mto{g} q$.  Thus,
      we know that $r \leq p$ and $r \leq q$.  Then we know by the
      definition of meets that there are morphisms $(p \land q)
      \mto{\pi_1} p$ and $r \mto{\langle f,g \rangle} p \land q$
      which both imply that $(p\land q) \leq p$ and $r \leq (p\land
      q)$.  We must show that $\langle f,g \rangle;\pi_1 = f$, but
      $\langle f,g \rangle;\pi_1$ is defined to be $r \leq (p \land q)
      \leq p$ which holds by transitivity, and is exactly $r \leq p$ or $r \mto{f} p$.
      \end{proof}
      
  2. Given morphisms $r \mto{f} p$ and $r \mto{g} q$, $\langle f,g \rangle;\pi_2 = g$.
     \begin{proof}
        Left as an exercise.
     \end{proof}

  We can sum all of this up into the following diagram.  A preorder,
  $(P,\leq)$, has meets if for any two objects $p,q \in P$, there is
  an object $(p \land q) \in P$ such that the following diagram commutes:

  ```{.latex-disp-img width="30%"
                      src="/images/posts/ct-notes/Universal-Properties/preorder-prod-uniprop.png"
                      cap="Commutative diagram of the universal property for binary products in a preorder treated as a category."}
  \bfig
  \dtriangle|ama|/->`-->`<-/<500,500>[r`p`p \land q;f`\langle f,g \rangle!`\pi_1]
  \btriangle(500,0)|maa|/-->`->`->/<500,500>[r`p \land q`q;\langle f,g \rangle!`g`\pi_2]
  \efig
  ```

  This is the same digram as the first example!  Thus, meets in a
  preorder have the same __defining property__ as cartesian
  products in sets!

# Set-Valued Functors

A functor $F : \cat{C} \mto{} \sets$ from some category $\cat{C}$ to the
category of sets is called a __set-valued functor__.  It relates
objects to sets and morphisms to functions.  One can think of them as
an interpretation of an abstract category to a concrete category; that
is, we can interpret a category without a notion of elements into one
with such a notion, and one that we understand quite well.

We give several example set-valued functors below.

- Suppose $\cat{C}$ has objects $\{0,1\}$ and the following
  morphisms:

  ```{.latex-disp-img width="20%"
                      src="/images/posts/ct-notes/Universal-Properties/direted-graph-morph.png"
                      cap="The source and target morphisms defining a directed graph."}
  1 \two<500> 0
  ```
  
  Then a functor $F : \cat{C} \to \sets$ maps $1$ to a set $E$ and $0$
  to a set $N$, and the two arrows to functions $s : E \to N$ and $t :
  E \to N$.  A graph is a tuple $(N,E,s,t)$ where $N$ is the set of
  nodes, $E$ is the set of edge labels, $s : E \to N$ assigns edges
  their source nodes, and $t : E \to N$ assigns edges their target
  nodes.  Therefore, $F$ represents a graph!  In addition, natural
  transformations between functors like $F$ correspond to graph
  homomorphisms [@awodey2006category].  Notice that this functor
  is definable for any category at all, and thus, we can think of a
  category as an abstraction of a directed graph with a monoid
  structure given by composition.

- A monoid $([[M]], [[e]], [[(x)]])$ can be thought of as a set-valued functor
  $[[M : 1 -> Set]]$ with two natural transformations:

  $$
  \begin{array}{lll}
    \text{(Identity)} & [[e : {*} -> M]]\\
    \text{(Multiplication)} & [[ [(x)] : M * M -> M]]
  \end{array}
  $$
  
  with the following commutative diagrams:

  ```{.latex-disp-img width="40%"
                      src="/images/posts/ct-notes/Universal-Properties/monoid-identity-axioms.png"
                      cap="Commutative diagram for the left and right identity axioms for a monoid."}
  \bfig
  \qtriangle|ama|/<-`->`->/<1000,400>[ [[M * M]]`[[{*} * M]]`[[M]];[[e * id M]]`[[ [(x)] ]]`[[pi2]] ]
  \btriangle|ama|/<-`->`->/<1000,400>[ [[M * M]]`[[M * {*}]]`[[M]];[[h{id M} * e]]`[[ [(x)] ]]`[[pi1]] ]
  \efig
  ```

  ```{.latex-disp-img width="60%"
                      src="/images/posts/ct-notes/Universal-Properties/monoid-assoc-axiom.png"
                      cap="Commutative diagram for associativity axiom for a monoid."}
  \bfig
  \square|amma|/->`=`->`/<1900,400>[ [[{M * M} * M]]`[[M * M]]`[[M * {M * M}]]`[[M]];[[ [(x)] * id M]]``[[ [(x)] ]]`]
  \morphism<950,0>[ [[M * {M * M}]]`[[M * M]];[[h{id M} * [(x)] ]] ]
  \morphism(950,0)<950,0>[ [[M * M]]`[[M]];[[ [(x)] ]] ]
  \efig
  ```
  
  The left diagram corresponds to the identity axioms of the monoid,
  and the right diagram corresponds to associativity of
  multiplication.
  In this example, we made use of the following functors:

  $$
  \begin{array}{lllllll}
    \begin{array}{lll}
      \text{(Singleton Set)}\\
      \begin{array}{lll}
        [[{*} : 1 -> Set]]\\
        [[{*}]](\bullet) = [[{*}]]\\
        [[{*}]]([[id bullet]]) = [[id {*}]]
      \end{array}
    \end{array}
    & \quad & 
    \begin{array}{lll}
      \text{(Product Functor)}\\
      \begin{array}{lll}
        [[M * M : 1 -> Set]]\\
        [[{M * M}(bullet,bullet)]] = [[M(bullet) * M(bullet)]]\\
        [[{M * M}(id bullet,id bullet)]] = [[id {M(bullet) * M(bullet)}]]\\
      \end{array}
    \end{array}
  \end{array}
  $$
  
  These are also both examples of set-valued functors.  The left
  functor is essentially the singleton set, and the right functor is
  the cartesian product of the underlying set of the monoid with
  itself.  Thus, a set-valued functor, $[[X : 1 -> Set]]$, is
  a set $[[X]]$ lifted up a level to functors.

- Suppose we have a monoid $([[M]], [[e]], [[(x)]])$.
  A __graded monoid__ is a set-valued functor $[[G : M -> Set]]$ with two natural transformations:
  
  $$
  \begin{array}{lll}
    \text{(Identity)} & [[i : {*} -> G(e)]]\\
    \text{(Multiplication)} & [[ [(*)] : G(r1) * G(r2) -> G(r1 (x) r_2)]]
  \end{array}
  $$
  
  with the following commutative diagrams:  
        
  ```{.latex-disp-img width="70%"
                      src="/images/posts/ct-notes/Universal-Properties/graded-monoid-identity-axioms.png"
                      cap="Commutative diagram for the left-identity axiom for a graded monoid."}
  \begin{array}{cc}
  \bfig
  \square|amma|/->`->`=`->/<1000,500>[ [[G(r) * {*}]]`[[G(r)]]`[[G(r) * G(e)]]`[[G(r (x) e)]];[[pi1]]`[[h{id h{G(r)}} * i]]``[[ [(*)] ]] ]
  \efig
  &
  \bfig
  \square|amma|/->`->`=`->/<1000,500>[ [[{*} * G(r)]]`[[G(r)]]`[[G(e) * G(r)]]`[[G(e (x) r)]];[[pi2]]`[[i * h{id h{G(r)}}]]``[[ [(*)] ]] ]
  \efig    
  \end{array}
  ```

  ```{.latex-disp-img width="80%"
                      src="/images/posts/ct-notes/Universal-Properties/graded-monoid-assoc-axiom.png"
                      cap="Commutative diagram for the associativity axiom for a graded monoid."}
  \bfig
  %% Top
  \morphism|a|/->/<1400,0>[ [[{G(r1) * G(r2)} * G(r3)]]`[[G(r1 (x) r2) * G(r3)]];[[ [(*)] * h{id h{G(r3)}}]] ]
  \morphism(1400,0)|a|/->/<1200,0>[ [[G(r1 (x) r2) * G(r3)]]`[[G({r1 (x) r2} (x) r3)]];[[ [(*)] ]] ]

  %% Sides
  \morphism/=/<0,-500>[ [[{G(r1) * G(r2)} * G(r3)]]`[[G(r1) * {G(r2) * G(r3)}]];]
  \morphism(2600,0)/=/<0,-500>[ [[G({r1 (x) r2} (x) r3)]]`[[G(r1 (x) {r2 (x) r3})]];]
  %% Bottom
  \morphism(0,-500)|a|/->/<1400,0>[ [[G(r1) * {G(r2) * G(r3)}]]`[[G(r1) * G(r2 (x) r3)]];[[ h{id h{G(r1)}} * [(*)] ]] ]
  \morphism(1400,-500)|a|/->/<1200,0>[ [[G(r1) * G(r2 (x) r3)]]`[[G(r1 (x) {r2 (x) r3})]];[[ [(*)] ]] ]
  \efig
  ```
  
  The diagrams on top correspond to the identity axioms of the graded
  monoid, and the diagram on bottom corresponds to associativity of
  graded multiplication.

  An example graded monoid can be found in formal language theory.
  Take $\Sigma^n$ to be all the words of length $n$ over an alphabet
  $\Sigma$.  Then $\Sigma^0$ contains only the empty word, and can be
  lifted to a map $\varepsilon : [[{*}]] \mto{} \Sigma^0$, and
  composition of words lifts to a map $\cdot : \Sigma^m \times
  \Sigma^n \mto{} \Sigma^{m + n}$. Thus, since the empty word is the
  identity of composition of words, and composition is associative up
  to associativity of addition we have a graded monoid
  $(\Sigma^{-},\varepsilon, \cdot)$ over the additive natural number
  monoid $([[Nat]],0, +)$.  Using this graded monoid we can define the
  Kleene-star of an alphabet $\Sigma$ to be
  $\Sigma^* = \bigcup_{n \in [[Nat]]} \Sigma^n$.

- There is one very important set-valued functor we have seen
  several times.  Suppose $A$ is an object of the category $\cat{C}$.
  Then we can define the __covariant hom-set functor__:
  
  $$
  \begin{array}{lll}
    \Hom{C}{A}{-} : \cat{C} \to \sets\\
    \Hom{C}{A}{B} = \{f : A \to B \mid f \in \mor{C}\}\\
    \Hom{C}{A}{h}(g) = g;h
  \end{array}
  $$
  
  The proof that this is indeed a functor is left as an exercise. In
  addition, prove that this functor is natural in $B$.

- Suppose $B$ is an object of the category $\cat{C}$.  Then we can
  define the __contravariant hom-set functor__:
  
  $$
  \begin{array}{lll}
    \Hom{C}{-}{B} : \catop{C} \to \sets\\
    \Hom{C}{A}{B} = \{f : A \to B \mid f \in \mor{C}\}\\
    \Hom{C}{f}{B}(g) = f;g
  \end{array}
  $$
  
  The proof that this is indeed a functor is left as an exercise. In
  addition, prove that this functor is natural in both $A$.

- Suppose $A$ and $B$ are objects of the category $\cat{C}$.  Then
  we can define the __hom-set functor__:
  
  $$
  \begin{array}{lll}
    \Hom{C}{-}{-} : \catop{C} \times \cat{C} \to \sets\\
    \Hom{C}{A}{B} = \{f : A \to B \mid f \in \mor{C}\}\\
    \Hom{C}{f}{h}(g) = f;g;h
  \end{array}
  $$
  
  The proof that this is indeed a functor is left as an exercise. In
  addition, prove that this functor is natural in both $A$ and $B$.

The last three examples are of particular importance, because they
underly the definition of a very important class of functors called
representable functors.

# Representable Functors

Simply put, universal properties are what are called
__representable functors.__  These correspond to set-valued
functors with a special property that states that they can be
completely captured by a collection of morphisms.  An example may help
make this informal explanation more clear.

Suppose $X$ is a set.  Then we can define the following functions
between $X$ and the set of functions $\Hom{[[Set]]}{[[{*}]]}{X}$ from
the singleton set $[[{*}]]$ to $X$:

$$
\begin{array}{lll}
  \begin{array}{lll}
    [[phi]] : [[X]] \mto{} \Hom{[[Set]]}{[[{*}]]}{X}\\
    [[phi]](x) = \lambda \_.x\\
  \end{array}
  &
  \begin{array}{lll}
    [[phi]]^{-1} : \Hom{[[Set]]}{[[{*}]]}{X} \mto{} [[X]]\\
    [[phi]]^{-1}(f) = f(\star)\\
  \end{array}
\end{array}
$$

The function $\phi$ is the constant function always returning $x$, and
its inverse takes in a function from $[[{*}]]$ to $X$, and simply
applies it to its only input.  We can easily see that this forms a
bijection.  Thus, every set $X$ is in bijection with the set of
functions $\Hom{[[Set]]}{[[{*}]]}{X}$.  Now consider the functor 
$[[id Set : Set -> Set]]$.  Using the above argument we can define a
natural isomorphism 
$\alpha : \Hom{[[Set]]}{[[{*}]]}{-} \mto{} [[id Set]]$ by setting $\alpha_X = [[phi]]^{-1}$.  
Functors like $[[id Set]]$ that have such an object like $[[{*}]]$ that induces a
natural isomorphism like $\alpha$ are called __representable functors__.

:::{.definition label="def:rep-funct"} 
  A set-valued functor $F : \cat{C} \mto{} \sets$ is called
  __representable__ if and only if there is an object $A \in
  \Obj{C}$ and a natural isomorphism $\alpha : F \mto{} \Hom{C}{A}{-}$.
  We call the pair $(A,\alpha)$ a __representation__ of $F$.
:::

The definition just given can be recast into a definition for
contravariant set-valued functors $F : \catop{C} \mto{} \sets$, called
presheafs, by proving it naturally isomorphic to the contravariant hom
functor.

:::{.definition label="def:rep-contra-funct"}
  A set-valued contravariant functor (presheaf) $F : \catop{C} \mto{}
  \sets$ is called __representable__ if and only if there is an
  object $B \in \Obj{C}$ and a natural isomorphism $\beta : F \mto{}
  \Hom{\catop{C}}{-}{B}$.  We call the pair $(B,\beta)$ a
  __representation__ of $F$.
:::

Let's consider some example representable functors.

- The prototypical example of a representable functor is the
  powerset functor $\mathcal{P} : \sets^{\mathsf{op}} \mto{} \sets$
  defined by

  $$
  \begin{array}{lll}
    \mathcal{P}(X) & = & \{Y \mid Y \subseteq X\}\\
    \mathcal{P}(f : B \mto{} A) & = & \lambda X \subseteq A.\{x \in B \mid f(x) \in X\} : \mathcal{P}(A) \mto{} \mathcal{P}(B)\\
  \end{array}
  $$
  
  We should check that this defines a functor.  First we check that identities are preserved:
  
  $$
  \begin{array}{lll}
    \pow{\id : A \mto{} A}
        & = & \lambda X \subseteq A.\{x \in A \mid \id(x) \in X\}\\
        & = & \lambda X \subseteq A.\{x \in A \mid x \in X\}\\
        & = & \lambda X \subseteq A.X\\
  \end{array}
  $$

  Next we check that compositions are preserved.  Suppose $f \in
  \Hom{\sets^{\mathsf{op}}}{B}{A}$ and $g \in \Hom{\sets^{\mathsf{op}}}{C}{B}$.  Then
  
  $$
  \begin{array}{lll}
    \pow{g;f : C \mto{} A}
        & = & \lambda X \subseteq A.\{x \in C \mid f(g(x)) \in X\}\\
        & = & \lambda X \subseteq A.\{x \in C \mid f(g(x)) \in X\}\\
        & = & \lambda X \subseteq A.\{x \in C \mid g(x) \in \{y \in B \mid f(y) \in X\}\}\\
        & = & (\lambda Y \subseteq A.\{y \in B \mid f(y) \in Y\});(\lambda X \subseteq B.\{x \in C \mid g(x) \in X\})\\
        & = & \pow{f};\pow{g}
  \end{array}
  $$
  
  To prove that the powerset functor is representable we need to find
  a representation of it.  Thus, we must find a set $B$ together with
  a natural isomorphism $\alpha : \Hom{\sets^{\mathsf{op}}}{-}{B} \mto{} \mathcal{P}$.  The
  most difficult part is finding $B$.  To do this it is helpful to
  consider how $\mathcal{P}$ is defined.  Suppose we have such a $B$.
  Then we must define the component of $\alpha$, $\alpha_A :
  \Hom{\sets^{\mathsf{op}}}{A}{B} \mto{} \mathcal{P}(A)$, and the only thing we have to work
  with is the powerset functor.  To define the component $\alpha_A$ we
  are given a morphism $f : A \mto{} B$, and then the only sensible thing
  we can do is apply the powerset functor to it yielding $\pow{f} :
  \pow{B} \mto{} \pow{A}$, which by definition computes the inverse image
  of $f$ with respect to the input subset of $B$.  Now we need a
  subset of $A$, and the only way to get it is by finding a subset of
  $B$ in addition to $B$ itself.  Choose $B = \{0,1\}$, then we define
  $\alpha_A(f : A \mto{} B) = \pow{f}(\{1\})$.  This construction uses
  the characteristic function on $A$ to determine which subset to
  choose.

  It is easy to see that we can also define the component
  $\alpha^{-1}_A : \pow{A} \mto{} \Hom{\sets^{\mathsf{op}}}{A}{B}$ by

  $$
  \alpha^{-1}_A(X)  = \lambda x \in A.\left\{
  \begin{array}{lr}
      1 & : x \in X\\
      0 & : x \notin X
    \end{array}
    \right.
  $$
  
  We can see that $\alpha_A;\alpha^{-1}_A = \id =
  \alpha^{-1}_A;\alpha_A$.  Hence, each $\alpha_A$ is an 
  isomorphism.

  Last but not least, we must show that $\alpha$ is a natural
  transformation.  Thus, we must prove that the following diagram
  commutes for any $f : A' \mto{} A$:

  ```{.latex-disp-img width="30%"
                      src="/images/posts/ct-notes/Universal-Properties/diag-nat-rep-powerset-funct.png"
                      cap="Naturality diagram for the representation of the powerset functor."}
  \bfig
  \square<700,500>[\Hom{\sets^{\mathsf{op}}}{A}{B}`\pow{A}`\Hom{\sets^{\mathsf{op}}}{A'}{B}`\pow{A'};\alpha_A`\Hom{\sets^{\mathsf{op}}}{f}{B}`\pow{f}`\alpha_{A'}]
  \efig
  ```
  
  This follows from straightforward equational reasoning using
  the definitions of the respective functions in play.  

- Suppose $A,B \in \Obj{C}$. What is a representation of the
  functor $\Hom{\cat{C}}{-}{A} \times \Hom{\cat{C}}{-}{B}$? It must be
  a pair $(P,\beta)$ such that $\beta : (\Hom{\cat{C}}{-}{A} \times
  \Hom{\cat{C}}{-}{B}) \mto{} \Hom{C}{-}{P}$ is natural isomorphism.
  The structure of $\beta$ tells us that given a pair $(f,g)$ of
  morphisms $f : X \mto{} A$ and $g : X \mto{} B$ we must produce a
  morphism $h : X \mto{} P$.  We have seen this pattern before in the
  universal property of binary products given in the introduction.  Suppose
  $\cat{C}$ has binary products, then take $P = A \times B$.  Then the
  universal property of binary products implies that $\beta :
  (\Hom{\cat{C}}{-}{A} \times \Hom{\cat{C}}{-}{B}) \mto{} \Hom{C}{-}{A
    \times B}$ is defined to be $\beta_{X}(f,g) = \langle f,g\rangle$.
  That is, the universal map of the binary product.  In the opposite,
  we have $\beta^{-1}_X(h) = (h;\pi_1,h;\pi_2)$.  The universal
  property of binary products implies that these are mutual inverses.

  The previous example assumes $\cat{C}$ has binary products, but
  representablity is more general than that.  It actually gives a
  formal means of describing the universal property of binary
  products, and when a category has binary products.  Given a category
  $\cat{C}$ requiring that the functor $\Hom{\cat{C}}{-}{A} \times
  \Hom{\cat{C}}{-}{B}$ is representable implies there is a
  representation $(P,\beta)$ that can be used to define the following
  morphisms:
  
  $$
  \begin{array}{lll}
    \pi_1 = [[fst]](\beta^{-1}_{P}(\id_P)) \in \Hom{\cat{C}}{P}{A}\\
    \pi_2 = [[snd]](\beta^{-1}_{P}(\id_P)) \in \Hom{\cat{C}}{P}{B}\\
    \langle f,g \rangle = \beta_{X}(f,g) \in \Hom{\cat{C}}{X}{P}\\
  \end{array}
  $$

  Here $[[fst]]$ and $[[snd]]$ are the projections for the cartesian
  product in $[[Set]]$.  Now we must show the following equations
  hold:
  
  $$
  \begin{array}{lll}
    \langle f,g \rangle;[[pi1]] = f : P \mto{} A\\
    \langle f,g \rangle;[[pi2]] = g : P \mto{} B\\
  \end{array}
  $$

  By definition, these are equivalent to the following fully spelled
  out equations:

  $$
  \begin{array}{lll}
    \beta_{X}(f,g);[[fst]](\beta^{-1}_{P}(\id_P)) = f : P \mto{} A\\
    \beta_{X}(f,g);[[snd]](\beta^{-1}_{P}(\id_P)) = g : P \mto{} B\\
  \end{array}
  $$

  Let's consider the former and the latter will follow similarly.  Consider
  the naturality condition for $[[fst]]$.

  ```{.latex-disp-img width="60%"
                      src="/images/posts/ct-notes/Universal-Properties/diag-nat-fst.png"
                      cap="Naturality the first project of the cartesian product in Set."}
  \bfig
    \square|amma|<1500,1000>[
    \Hom{[[Cat C]]}{P_1}{A} \times \Hom{[[Cat C]]}{P_1}{B}`
    \Hom{[[Cat C]]}{P_1}{A}`
    \Hom{[[Cat C]]}{P_2}{A} \times \Hom{[[Cat C]]}{P_2}{B}`
    \Hom{[[Cat C]]}{P_2}{A};
    [[fst]]`
    \Hom{[[C]]}{h}{[[id A]]} \times \Hom{[[C]]}{h}{[[id B]]}`
    \Hom{[[C]]}{h}{[[id A]]}`
    [[fst]] ]
  \efig
  ```
  
  This diagram states the following:

  $$
  h;[[fst]](f,g) = f = [[fst]](h;f,h;g)
  $$

  Let's pair this diagram up with the naturality diagram for
  $\beta^{-1}_P$, because we apply $[[fst]]$ to this in our equation:
  
  ```{.latex-disp-img width="90%"
                      src="/images/posts/ct-notes/Universal-Properties/diag-nat-rep-fst.png"
                      cap="Naturality of the representation of the product functor."} 
    \bfig
      \square|amma|<1500,1000>[
        \Hom{[[Cat C]]}{P}{P}`
      \Hom{[[Cat C]]}{P}{A} \times \Hom{[[Cat C]]}{P}{B}`
      \Hom{[[Cat C]]}{X}{P}`
      \Hom{[[Cat C]]}{X}{A} \times \Hom{[[Cat C]]}{X}{B};
      \beta^{-1}`
      \Hom{[[Cat C]]}{h}{\id_P}`
      \Hom{[[Cat C]]}{h}{[[id A]]} \times \Hom{[[Cat C]]}{h}{[[id B]]}`
      \beta^{-1}]
      
      \square(1500,0)|amma|<1500,1000>[
        \Hom{[[Cat C]]}{P}{A} \times \Hom{[[Cat C]]}{P}{B}`
      \Hom{[[Cat C]]}{P}{A}`
      \Hom{[[Cat C]]}{X}{A} \times \Hom{[[Cat C]]}{X}{B}`
      \Hom{[[Cat C]]}{X}{A};
      [[fst]]`
      \Hom{[[Cat C]]}{h}{[[id A]]} \times \Hom{[[Cat C]]}{h}{[[id B]]}`
      \Hom{[[Cat C]]}{h}{[[id A]]}`
      [[fst]] ]
    \efig  
  ```  

  Since we know that both of these diagrams commute we know that the
  outer diagram commutes.  Thus, we know the following:

  $$
  h;[[fst]](\beta^{-1}(p)) = [[fst]](\beta^{-1}(h;p))
  $$

  This equation is exactly what we need, because our original equation
  we set out to prove:

  $$
  \beta_{X}(f,g);[[fst]](\beta^{-1}_{P}(\id_P)) = f : P \mto{} A
  $$

  fits the form of $h;[[fst]](\beta^{-1}(p))$ where we replace $h$
  with $\beta_{X}(f,g)$ and $p$ with $[[id P]]$.  Thus, we may conclude
  that:

  $$
  \beta_{X}(f,g);[[fst]](\beta^{-1}([[id P]])) 
    = [[fst]](\beta^{-1}(\beta_{X}(f,g);[[id P]])) = [[fst]](\beta^{-1}(\beta_{X}(f,g)))
  $$

  But, we also know that $\beta$ and $\beta^{-1}$ are mutual inverses
  because they form a representation with $P$, and thus, we know that:

  $$
  [[fst]](\beta^{-1}(\beta_{X}(f,g))) = [[fst]](f,g))) = f
  $$

  therefore proving the equation we set out to prove.  The case for $[[pi2]]$ is similar.

  What we have shown is that to require that a category $[[Cat C]]$
  has binary products we merely ask that for every pair of objects
  $(A,B) \in [[obj(C)]]$, the contravariant functor $\Hom{[[Cat
        C]]}{-}{A} \times \Hom{[[Cat C]]}{-}{B} : [[Catop C -> Set]]$
  is representable which as we have shown implies the universal
  property of binary products.  In fact, we can say that each
  representable functor __is__ the universal property for the binary
  product the representable functor witnesses.

  A final interesting point is that the representable functor can also
  be seen as an interpretation of the binary products in $[[Cat C]]$
  into the cartesian product in $[[Set]]$.  We move from a universe
  without elements into a universe with elements.

- Suppose we have a functor $[[F : Cat A -> Cat B]]$. Now ask the
  question, what universal property arises from requiring the
  following functor to be representable?
    
  $$
  \Hom{[[CAT]]}{[[F(hole)]]}{[[b]]} : [[Catop A -> Set]]
  $$
  
  Representablity states that there must be a representation $(\alpha,
  X)$ such that:

  $$
  \alpha : \Hom{[[CAT]]}{[[F(hole)]]}{[[b]]} \mto{} \Hom{[[Cat A]]}{-}{X} : [[Catop A -> Set]]
  $$
  
  is a natural isomorphism.  This implies that for any morphism $[[f :
  F(a) -> b]]$ there is a unique morphism $\alpha(f) : [[a -> X]]$.
  One thing that our previous examples have shown is that we get
  interesting arrows when we apply the representation bijection to the
  identity morphism.  We can do this only for $\alpha^{-1}$ here,
  which gives a morphism $\alpha^{-1}([[id X]]) : [[F(X) -> b]]$; the
  morphisms arising from the application of the representation
  bijection to the identity are called *universal arrows*.  
  
  The universal arrow $[[alphai(id X) : F(X) -> b]]$ implies that
  $[[X]]$ must depend on the object $[[b]]$. However, $[[X in obj(A)]]$ and
  $[[b in obj(B)]]$, this leads us to think of $[[X]]$
  as $[[G(b)]]$ for some functor $[[G : Cat B -> Cat A]]$. Thus, we have a
  bijection:
  
  $$
  \alpha : \Hom{[[B]]}{[[F(hole)]]}{[[b]]} \mto{} \Hom{[[Cat A]]}{-}{G(b)} : [[Catop A -> Set]]
  $$
  
  such that there is an universal arrow $[[alphai(id h{G(b)}) : F(G(b)) ->
  b]]$, and for any morphism $[[f : F(a) -> b]]$ we have a unique
  morphism $[[alpha(f) : a -> G(b)]]$. But, how are these morphisms
  related?  That is, what is the universal property implied by
  $\alpha$?  This is where the naturality property comes in.
  
  ```{.latex-disp-img width="70%"
                      src="/images/posts/ct-notes/Universal-Properties/diag-nat-rep-left-adjoint.png"
                      cap="Naturality diagram for the representation of the left-adjoint functor."}
  %% \bfig
  %% \square|amma|<1000,500>[
  %%   [[Hom[B](F(a1),b)]]`
  %%   [[Hom[B](a1,G(b))]]`
  %%   [[Hom[B](F(a2),b)]]`
  %%   [[Hom[B](a2,G(b))]];
  %%   [[alpha]]`
  %%   [[Hom[B](h,id b)]]`
  %%   [[Hom[B](F(h),id h{G(b)})]]`
  %%   [[alpha]]
  %% ]
  %% \efig
  \bfig
  \square|amma|<1200,500>[
    [[Hom[B](G(b),G(b))]]`
    [[Hom[B](F(G(b)),b)]]`
    [[Hom[B](a,G(b))]]`
    [[Hom[B](F(a),b)]];
    [[alphai]]`
    [[Hom[B](alpha(f),id h{G(b)})]]`
    [[Hom[B](F(alpha(f)),id b)]]`
    [[alphai]]
  ]
  \efig
  ```

  Following the previous example we plug $[[alpha(f)]]$ into the
  naturality diagram for the universal arrow $[[alphai(id h{G(b)})]]$.
  Tracing the identity arrow around this diagram implies that the
  following equation holds:

  $$
  [[F(alpha(f));alphai(id h{G(b)});h{id b}]] = [[alphai(alpha(f);h{id h{G(b)}};h{id h{G(b)}})]]
  $$
  
  and as we can see we can drop all the identity compositions to obtain:
  
  $$
  [[F(alpha(f));alphai(id h{G(b)})]] = [[alphai(alpha(f))]] = [[f]]
  $$

  This is equivalent to the diagram:

  ```{.latex-disp-img width="50%"
                      src="/images/posts/ct-notes/Universal-Properties/diag-left-adjoint-prop-rep.png"
                      cap="Universal property for a left-adjoint functor using the representation."}
  \bfig
  \btriangle|mma|<1300,500>[F(a)`F(G(b))`b;[[F(alpha(f))]]`f`[[alphai(id h{G(b)})]] ]
  \efig
  ```

  We can now capture this line of reasoning as an abstract universal property:

  - For a functor $[[F : Cat A -> Cat B]]$, there is a functor $[[G : Cat B -> Cat A]]$ where for any object $[[b in obj(B)]]$,
    there is a universal arrow $\varepsilon_{b} : [[F(G(b)) -> b]]$ such that
    for every morphism $[[f : F(a) -> b]]$ there is a unique morphism $[[g : a -> G(b)]]$
    making the following diagram commute:

    ```{.latex-disp-img width="50%"
                      src="/images/posts/ct-notes/Universal-Properties/diag-left-adjoint-prop.png"
                      cap="Universal property for a left-adjoint functor."}
    \bfig
    \btriangle|mma|/-->`->`->/<1300,500>[F(a)`F(G(b))`b;[[F(g)]]`f`[[vep b]] ]
    \efig
    ```

  If for a functor $[[F : Cat A -> Cat B]]$ there is a functor $[[G : Cat B -> Cat A]]$
  satisfying the previous universal property we say __$F$ is left adjoint to the functor $[[G]]$__.
  This is often denoted by $[[F -| G]]$.

  Given there are left adjoints you might ask if there are right
  adjoints.  In fact there are, and they have the following universal
  property:

  - For a functor $[[G : Cat B -> Cat A]]$, there is a functor $[[F : Cat A -> Cat B]]$ where for any object $[[a in obj(A)]]$,
    there is a universal arrow $\eta_{a} : [[a -> G(F(a))]]$ such that
    for every morphism $[[g : a -> G(b)]]$ there is a unique morphism $[[f : F(a) -> b]]$
    making the following diagram commute:

    ```{.latex-disp-img width="50%"
                      src="/images/posts/ct-notes/Universal-Properties/diag-right-adjoint-prop.png"
                      cap="Universal property for a right-adjoint functor."}
    \bfig
    \btriangle|mma|/<--`<-`<-/<1300,500>[G(b)`G(F(a))`a;[[G(f)]]`g`[[vep b]] ]
    \efig
    ```

    We leave deriving the previous universal property as an exercise.
    If for a functor $[[G : Cat B -> Cat A]]$ there is a functor $[[F
        : Cat A -> Cat B]]$ satisfying the previous universal property
    we say __$G$ is right adjoint to the functor $[[F]]$__. Again, we
    denote this by $[[F -| G]]$.

  There is a lot we can say about adjoint functors (or adjunctions for
  short), but we leave that for a later time.
  
- Suppose we have a partially-ordered monoid $(M,*, e, \leq)$. Then
  what is a representable action on $[[Set]]$? First, an action is a
  functor $\odot : [[M * Set -> Set]]$ with the following data:
  
  - Natural transformations:
    - $u : e \odot a \mto{} a$, for any $[[a in obj(Set)]]$
    - $d : m_1 \odot (m_2 \odot a) \mto{} (m_1 * m_2) \odot a$
  - The following coherence diagrams hold:

  ```{.latex-disp-img width="50%"
                      src="/images/posts/ct-notes/Universal-Properties/action-diag-unit.png"
                      cap="Unit Diagrams for Actions on Set"}
  \begin{array}{lll}
    \begin{array}{lll}
    \bfig
    \btriangle|mma|/->`->`=/<1300,500>[e \odot (m \odot a)`(e * m) \odot a`m \odot a;d_{e,m,a}`u_{m \odot a}`[[id]] ]      
    \efig
    &
    \bfig
    \btriangle|mma|/->`->`=/<1300,500>[m \odot (e \odot a)`(m * e) \odot a`m \odot a;d_{m,e,a}`u_{m \odot a}`[[id]] ]
    \efig
  \end{array}\\
  \\
  \begin{array}{lll}
    \bfig
    \square|amma|/->`->`->`/<3000,500>[m_1 \odot (m_2 \odot (m_3 \odot a))`m_1 \odot ((m_2 * m_3) \odot a)`(m_1 * m_2) \odot (m_3 \odot a)`(m_1 * (m_2 * m_3)) \odot a;[[id]]_{m_1} \odot d_{m_2,m_3,a}`d_{m_1,m_2,(m_3 \odot a)}`d_{m_1,(m_2 * m_3),a}`]
    \morphism<1500,0>[(m_1 * m_2) \odot (m_3 \odot a)`((m_1 * m_2) * m_3) \odot a;d_{(m_1 * m_2),m_3,a}]
    \morphism(1500,0)/=/<1500,0>[((m_1 * m_2) * m_3) \odot a`(m_1 * (m_2 * m_3)) \odot a;[[id]] ]
    \efig
    \end{array}
  \end{array}
  ```

  A representable action $\odot : [[M * Set -> Set]]$ is one in which
  there is an object $[[P in obj(M * Set)]]$ such that the following
  is a natural isomorphism:

  $$
  \alpha : \odot \mto{} [[Hom[ M * Set ](P, hole)]]
  $$

  We can refine this, notice that $[[P]]$ is a pair $(m,r) \in [[M * Set]]$, so we obtain:
  
  $$
  \alpha : \odot \mto{} [[Hom[ M * Set ]((m,r), hole)]]
  $$

  Then given any pair $(m',a) \in [[M * Set]]$, the following must be an isomorphism:

  $$
  \alpha_{m',a} : m' \odot a \mto{} [[Hom[ M * Set ]((m,r), (m',a))]]
  $$

  

# References

::: {#refs}
:::
