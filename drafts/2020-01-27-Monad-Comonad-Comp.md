---
layout: blog
title: "Why compose a monad and a comond? What's up with this weird distributive thingy?"
date: 2020-01-27
categories:
 - monads
 - comonads
 - category theory
 - categorical models
 - distributive law
 - algebras
---

We all know that monads are like vegan burritos, and comonads are like the ingredients used to craft the burrito, which make sure not to forget that wonderful seitan. In this tutorial....

So that may have been a bad joke, but let's press on.

Monads and comonads are used to capture various effects in functional programming.  The former correspond to effects on the output of a program, and the latter correspond to effects on the input of a program (often called coeffects, but honestly, why?  They are effects, just in a different spot).  Very often we want monads and comonads to get along within the same system or even the same type.  This post is about this combination.  First, a few examples to wet our appetite.

We can define the powerset monad and the product comonad as follows:

- The Powerset Monad $$\mathcal{P} : \mathsf{Set} \rightsquigarrow \mathsf{Set}$$:

$$
\begin{array}{l}
\eta_A(x) = \{x\} : A \rightsquigarrow \mathcal{P}(A)\\
\mu_A(X) = \bigcup_{Y \in X} Y : \mathcal{P}(\mathcal{P}(A)) \rightsquigarrow \mathcal{P}(A)
\end{array}
$$

- The Product Comonad  $$E \times - : \mathsf{Set} \rightsquigarrow \mathsf{Set}$$, for some fixed set $$E \in \mathsf{Set}$$:

$$
\begin{array}{l}
\varepsilon_A(e,a) = a : E \times A \rightsquigarrow A\\
\delta_A(e,a) = (e,(e,a)) : E \times A \rightsquigarrow E \times (E \times A)
\end{array}
$$

We can now ask what happens when we combine the two?  Well, based on the fact that [composing monads and comonads]() yield monads and comonads respectively, one might intuitively guess that we get a monad:

$$
\begin{array}{l}
\mathcal{P}(E \times -) : \mathsf{Set} \rightsquigarrow \mathsf{Set}\\
\eta'_A : A \rightsquigarrow \mathcal{P}(E \times A)\\
\mu'_A : \mathcal{P}(E \times \mathcal{P}(E \times A)) \rightsquigarrow \mathcal{P}(E \times A)
\end{array}
$$

and a comonad:

$$
\begin{array}{l}
E \times \mathcal{P}(-) : \mathsf{Set} \rightsquigarrow \mathsf{Set}\\
\varepsilon'_A : E \times \mathcal{P}(A) \rightsquigarrow A\\
\delta'_A : E \times \mathcal{P}(A) \rightsquigarrow E \times \mathcal{P}(E \times \mathcal{P}(A))
\end{array}
$$

However, this turns out to be wrong.  What we do get are instantiations of the powerset monad and the product comonad from above:

$$
\begin{array}{l}
\mathcal{P}(E \times -) : \mathsf{Set} \rightsquigarrow \mathsf{Set}\\
\eta_A : E \times A \rightsquigarrow \mathcal{P}(E \times A)\\
\mu_A : \mathcal{P}(\mathcal{P}(E \times A)) \rightsquigarrow \mathcal{P}(E \times A)
\end{array}
$$

and a comonad:

$$
\begin{array}{l}
E \times \mathcal{P}(-) : \mathsf{Set} \rightsquigarrow \mathsf{Set}\\
\varepsilon_A : E \times \mathcal{P}(A) \rightsquigarrow \mathcal{P}(A)\\
\delta_A : E \times \mathcal{P}(A) \rightsquigarrow E \times (E \times \mathcal{P}(A))
\end{array}
$$

If we think about what these two instantiations do we see that they capture the same set of effects.