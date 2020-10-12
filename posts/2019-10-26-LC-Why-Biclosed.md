---
layout: blog
title: "Lambek Calculus: What? Two lambdas?"
date: 2019-10-24
categories:
 - linear logic
 - lambek calculus
 - non-commutativity
 - granule project
 - category theory
---

<div id="divCheckbox" style="display: none;">
$$\newcommand{\cat}[1]{\mathcal{#1}}
\newcommand{\func}[1]{\mathsf{#1}}
\newcommand{\catop}[1]{\cat{#1}^{\mathsf{op}}}
\newcommand{\Hom}[3]{\mathsf{Hom}_{\cat{#1}}(#2,#3)}
\newcommand{\limp}[0]{\multimap}
\newcommand{\rhimp}[0]{\rightharpoonup}
\newcommand{\lhimp}[0]{\leftharpoonup}
\newcommand{\rimp}[0]{\to_r}
\newcommand{\limp}[0]{\to_l}
\newcommand{\before}[0]{\rhd}
\newcommand{\obj}[1]{\mathsf{Obj}(#1)}
\newcommand{\mor}[1]{\mathsf{Mor(#1)}}
\newcommand{\id}[0]{\mathsf{id}}
\newcommand{\lett}[0]{\mathsf{let}\,}
\newcommand{\inn}[0]{\,\mathsf{in}\,}
\newcommand{\cur}[1]{\mathsf{curry}(#1)}
\newcommand{\rcurry}[0]{\mathsf{curry}_r}
\newcommand{\lcurry}[0]{\mathsf{curry}_l}
\newcommand{\reval}[0]{\mathsf{eval}_r}
\newcommand{\leval}[0]{\mathsf{eval}_l}
\newcommand{\mto}[0]{\to}
$$
</div>

The Lambek calculus (LC) is named after its inventor Joachim Lambek  and goes back to his work in 1958 on [studying linguistics from a mathematical perspective](https://www.jstor.org/stable/pdf/2310058.pdf?casa_token=E5fNUzpAW3UAAAAA:cQ41fpQ2mUSjBNivyZlaBLSiJu0_vSUwoLj5k-KKqfo6Q_6IGOS89RCZuuF3k1OelbA7ZA8xsTFligAlkLlPI35JG8RWzcvKch8zHm0HYhPoGrV92-k). Since its inception LC has been used to study linguistics, philosophy, mathematics, and computer science.  It can viewed -- and this is how I view it -- as non-commutative linear logic, and I feel that non-commutativity is under studied in the area of the foundations of programming languages.  Thus, over the years I have been studying it more and more seriously; (shameless plug) see my two papers on the subject [here](https://arxiv.org/abs/1904.06847v1) and [here](http://metatheorem.org/includes/pubs/LFCS18.pdf).  In fact, it is an open question on to formulate a practical programming language based on LC.  In this post I am going to introduce LC using Lambek's original formulation, but then I'll reformulate LC using a more modern and intuitive syntax.  One interesting aspect of LC is that it comes with not one, but two $$\lambda$$-abstractions and function applications, and a natural question is, why?  Following introducing LC, I am going to answer this question using the semantics of LC, and pinpoint exactly why we need two, and what goes wrong when we restrict LC to only one.  Finally, I am going to conclude with a new formalization of LC using some ideas from the logic of bunched implications that is closer to a programming language and give some ideas on why we want do to this.

Every system I introduce here will be formulated as sequent calculi, because this keeps the complexity down to a minimum, but I will try and relate each concept to typing to make this post more accessible to programming language folks. I begin with Lambek's original 1958 specification of LC.  The syntax of formulas and contexts are defined by the following grammars:

<center><img src="/blog/images/posts/2019-10-26-LC-Why-Biclosed/LC-1958-syntax.png" width="30%"></center>

The syntax consists of a non-commutative tensor product denoted by $$A > B$$ -- this is usually denoted by $$A \otimes B$$ in linear logic -- but Lambek used the tensor product to juxtapose linguistic structures, and so, his notation makes a lot of sense; then there are two implications, a right-implication denoted by $$B/A$$ and left-implication denoted by $$A \backslash B$$.  These can be used to define functions that are required to be applied to their arguments in a particular order.  We will discuss more about how these can be used from a computational perspective below.

We now have several inference rules that give the above syntax meaning.  The basic sequent calculus rules for identity, tensors, and cut are given below:

<center><img src="/blog/images/posts/2019-10-26-LC-Why-Biclosed/LC-1958-id-cut-ten.png" width="55%"></center>

One thing we have to be sure of when we design non-commutative systems is that no two formulas a context ever get commuted pass each other.  This will open the door for proving exchange.  For example, consider the rule for cut (the last rule above), the second premises context is split, and then in the conclusion $$\Gamma_2$$ is inserted directly into the same place $$A$$ was.  This ensures that the ordering of the context is preserved.  All of $$\Gamma_1$$ is before $$\Gamma_3$$, and $$\Gamma_2$$ should be in between, because that's were $$A$$ was.  The second and third rules are for tensors, and they are basically the same rules as linear tensors from linear logic.  But, keep in mind, LC was introduced in 1958, 39 years before Girard introduced linear logic!  I am of the opinion that linear logic would have been discovered one way or another.

The next four rules handle introducing and using left and right implication:

<center><img src="/blog/images/posts/2019-10-26-LC-Why-Biclosed/LC-1958-bi-imp.png" width="50%"></center>

The first rule says that to introduce a right-implication $$B/A$$ the hypothesis $$A$$ must be on the right side of the context. Now compare this to left-implication, to introduce $$A\backslash B$$ the hypothesis $$A$$ must be on the left side of the context.  This explains why Lambek choose this syntax, the slashes lean towards the location of the hypothesis in the context, and the hypothesis is on the side of the conclusion $$B$$ that corresponds to its location in the context. The left rules for each implication are quite similar, but notice the placement of the context $$\Gamma_2$$ that entails the hypothesis $$A$$, it's location in the conclusion agrees with each of the implications; that is, it's to the right of the implication for right-implication and to the left of the implication for left-implication.

When it comes to type theory I find the syntax of LC to be difficult to use.  For example, consider the type $$F(a)\backslash (F(b)/(b/a))$$ where $$F$$ is some functor.  This is the usual map function for functors, but it is somewhat hard to understand, at least I think so.  In addition, it is hard to relate back to someone's existing knowledge who is not up on LC and non-commutativity.  Thus, in my papers on LC, I have used a different syntax which I introduce now.  This syntax was a result of working with Valeria de Paiva, and so I cannot take all the credit.

<center><img src="/blog/images/posts/2019-10-26-LC-Why-Biclosed/LC-dePaiva-Eades-full.png" width="98%"></center>

We call this version of LC DE-LC for dePavia:Eades LC.  Here is the mapping of the syntax changes:

$$
\begin{array}{ccc}
                  & \text{LC:1958} & \text{dePaiva:Eades}\\
  \text{(Tensor)} & AB & A \before B\\
  \text{(Right-Implication)} & B/A & A \rhimp B\\
  \text{(Left-Implication)} & A\backslash B & B \lhimp A\\
\end{array}
$$

The biggest change is, the positions of the hypotheses in right and left implication have been swapped.  This turns the rules for right-implication into the usual rules for commutative implication in linear logic; and thus, in type theory will correspond to usual introduction and elimination rules for $$\lambda$$-abstractions.  For example, here is a side-by-side comparison of the the right rule for right-implication in DE-LC and implication in linear logic:

<center><img src="/blog/images/posts/2019-10-26-LC-Why-Biclosed/LC-dePaiva-Eades-impr-comp.png" width="35%"></center>

As we can see the rules match exactly.  The arrow also points to the side of the context the hypothesis goes on.  The rules for left implication are similar to what they were before, and again, the arrow points to the left which is the location the hypothesis goes in the context.

At this point I think it would be good to answer the question, "what does it mean to be non-commutative?".  Non-commutativity refers to the restriction that no hypothesis in a sequent can be swapped.  Meaning, if you know $$\Gamma,A,B \vdash C$$, then you do not know $$\Gamma,B,A \vdash C$$.  From a type theory perspective the type of flip $$(a \to b \to c) \to (b \to a \to c)$$ is not inhabited.  Saying it another way, this means that the order of your inputs to a program matter, and are not allowed to be altered. In fact, if you do, then the program will not type check.

Commutativity can be added to a system by adding the exchange rule:

<center><img src="/blog/images/posts/2019-10-26-LC-Why-Biclosed/LC-dePaiva-Eades-ex.png" width="23%"></center>

We can see that this rule does not exist in either formulation of LC given above.  Thus, the absence of this rules entails that one cannot prove sequents like $$(A \before B) \vdash (B \before A)$$, $$(A \rhimp B \rhimp C) \vdash (B \rhimp A \rhimp C) $$, etc.  In fact, if we add exchange to LC, then we can prove the following:

<center><img src="/blog/images/posts/2019-10-26-LC-Why-Biclosed/limp-iff-rimp.png" width="70%"></center>

Therefore, in the presence of exchange both implications degenerate into a single implication, because ordering no longer matters.

However, there is this really cool result that might give one the impression that we can get away with only a single implication in non-commutative logics like LC.  I figured this out, because I convinced myself that we only need a single implication as long as we are very careful with our inputs, but we will see that while this result is interesting we really do need two implications.

I use the semantics of DE-LC in biclosed monoidal categories to give the result I have in mind.  A *biclosed monoidal category* is a [monoidal category](https://ncatlab.org/nlab/show/monoidal+category) $$(\cat{C}, I, \before, \lambda, \rho)$$ with two internal-homs we denote by $$A \rimp B$$ and $$A \limp B$$ defined by the following bijections on homsets:

$$
\begin{array}{l}
\rcurry : \Hom{C}{X \rhd A}{B} \cong \Hom{C}{X}{A \rimp B}\\
\lcurry : \Hom{C}{A \rhd X}{B} \cong \Hom{C}{X}{A \limp B}\\
\end{array}
$$

We can see that the internalhoms model right and left implication, but instead of changing the arrow we annotate the arrow with $$r$$ for right and $$l$$ for left.  A sequent $$A_1,\ldots,A_i \vdash B$$ corresponds to a morphism $$A_1 \before \cdots \before A_i \mto B$$.  Using the internal-homs we turn any morphism $$A_1 \before \cdots \before A_i \to B$$ into a morphism $$I \mto (A_1 \to_{a_i} ( \cdots (A_{i-1} \to_{a_{i-1}} (A_i \to_{a_i} B))\cdots))$$ where $$a_j \in \{l,r\}$$ for $$1 \leq j \leq i$$.  Programmaticly, this corresponds to taking a program with free variables and closing it producing a closed program.

At this point we can state the cool result which is that we can define a bijection:

$$
\begin{array}{rl}
      & \Hom{C}{I}{A_1 \to_{a_1} ( \cdots (A_{i-1} \to_{a_{i-1}} (A_i \to_{a_i} B))\cdots)}\\
\cong & \Hom{C}{I}{A_{p(1)} \to_{r} ( \cdots (A_{p(i-1)} \to_{r} (A_{p(i)} \to_{r} B))\cdots)}
\end{array}
$$

where $$p$$ is a permutation of the indices.  The object $$(A_1 \to_{a_1} ( \cdots (A_{i-1} \to_{a_{i-1}} (A_i \to_{a_i} B))\cdots)$$ gives us a sequence $$(a_1,\ldots,a_i))$$ and a starting permutation $$p = \id$$.  Each $$a_j$$ can be seen as a move in the permutation which correspond to the use of $$\rcurry$$ or $$\lcurry$$.  We define an operation $$p \mathbin{\#} (a_1,\ldots,a_i)$$ that computes our desired permutation as follows:

- If $$a_j = l$$, then

  $$

  \begin{array}{l}
  p \mathbin{\#} (-,\ldots,-,a_j,a_{j+1},\ldots,a_i) = p' \mathbin{\#} (-,\ldots,-,-,a_{j+1},\ldots,a_i)
  \end{array}

  $$

  where

  $$
  \begin{array}{l}
  p'(j) = 1\\
  p'(i) = p(i) + 1\text{, if }i \neq j
  \end{array}
  $$

- If $$a_j = r$$, then

  $$
  \begin{array}{l}
  p \mathbin{\#} (-,\ldots,-,a_j,a_{j+1},\ldots,a_i) = p \mathbin{\#} (-,\ldots,-,-,a_{j+1},\ldots,a_i)
  \end{array}
  $$

The final permutation now gives us a sequence $$(p(1),\ldots,p(i))$$ that corresponds to the correct order of the tensor product $$A_{p(1)} \before \cdots \before A_{p(i)}$$ which can then be used to obtain our desired morphism in $$\Hom{C}{I}{A_{p(1)} \to_{r} \cdots A_{p(i)} \to_{r} B}$$.

To construct the desired bijection we simply use $$\rcurry$$ or $$\lcurry$$ based on what each $$a_j$$ is to arrive at the tensor product $$A_{p(1)} \before \cdots \before A_{p(i)}$$, and then iterate applying $$\rcurry$$ until we obtain our desired morphism.


I think at this point it might be good to take a step back and go through a few examples.

- Example 1: Consider proving that there exists a permutation $$p$$ such that the following holds:

  $$
  \begin{array}{rl}
        & \Hom{C}{I}{A_1 \to_r (A_2 \to_l (A_3 \to_r B))}\\
  \cong & \Hom{C}{I}{A_{p(1)} \to_r (A_{p(2)} \to_r (A_{p(3)} \to_r B))}
  \end{array}
  $$

  We claim that we can compute the desired permutation as follows:

  $$
  \begin{array}{lll}
    & (1,2,3) \mathbin{\#} (r,l,r)\\
  = & (1,2,3) \mathbin{\#} (-,l,r)\\
  = & (2,1,3) \mathbin{\#} (-,-,r)\\
  = & (2,1,3) \mathbin{\#} (-,-,-)\\
  \end{array}
  $$

  Thus, $$(2,1,3)$$ is our final permutation.  Notice that this is the same permutation we get using $$\rcurry$$ and $$\lcurry$$:

  $$
  \begin{array}{lll}
        & \Hom{C}{I}{A_1 \to_r (A_2 \to_l (A_3 \to_r B))}\\
  \cong & \Hom{C}{I \before A_1}{A_2 \to_l (A_3 \to_r B)}\\
  \cong & \Hom{C}{A_1}{A_2 \to_l (A_3 \to_r B)}\\
  \cong & \Hom{C}{A_2 \before A_1}{A_3 \to_r B}\\
  \cong & \Hom{C}{A_2 \before A_1 \before A_3}{B}
  \end{array}
  $$

  We can then finish the bijection off using only $$\rcurry$$:

  $$
  \begin{array}{lll}
        & \Hom{C}{A_2 \before A_1 \before A_3}{B}\\
  \cong & \Hom{C}{A_2 \before A_1}{A_3 \to_r B}\\
  \cong & \Hom{C}{A_2}{A_1 \to_r A_3 \to_r B}\\
  \cong & \Hom{C}{I \before A_2}{A_1 \to_r A_3 \to_r B}\\
  \cong & \Hom{C}{I}{A_2 \to_r A_1 \to_r A_3 \to_r B}\\
  \end{array}
  $$

- Example 2: Consider proving that there exists a permutation $$p$$ such that the following holds:

  $$
  \begin{array}{rl}
        & \Hom{C}{I}{A_1 \to_l (A_2 \to_l (A_3 \to_r (A_4 \to_l B)))}\\
  \cong & \Hom{C}{I}{A_{p(1)} \to_l (A_{p(2)} \to_l (A_{p(3)} \to_r (A_{p(4)} \to_r B)))}
  \end{array}
  $$

  We claim that we can compute the desired permutation as follows:

  $$
  \begin{array}{lll}
      & (1,2,3,4) \mathbin{\#} (l,l,r,l)\\
    = & (1,2,3,4) \mathbin{\#} (-,l,r,l)\\
    = & (2,1,3,4) \mathbin{\#} (-,-,-,l)\\
    = & (4,2,1,3) \mathbin{\#} (-,-,-,-)\\    
  \end{array}
  $$

  Thus, $$(4,2,1,3)$$ is our final permutation.  So starting with a left-implication does not change the permutation, because the first element is already the in the first position.  The same permutation can again be computed using the internal-homs:

  $$
  \begin{array}{lll}
        & \Hom{C}{I}{A_1 \to_l (A_2 \to_l (A_3 \to_r (A_4 \mto_l B)))}\\
  \cong & \Hom{C}{A_1 \before I}{A_2 \to_l (A_3 \to_r (A_4 \mto_l B))}\\
  \cong & \Hom{C}{A_1}{A_2 \to_l (A_3 \to_r (A_4 \mto_l B))}\\
  \cong & \Hom{C}{A_2 \before A_1}{A_3 \to_r (A_4 \mto_l B)}\\
  \cong & \Hom{C}{A_2 \before A_1 \before A_3}{A_4 \mto_l B}\\
  \cong & \Hom{C}{A_4 \before A_2 \before A_1 \before A_3}{B}\\
  \end{array}
  $$
  
We can also git the same result for left-implication. 

we can define a bijection:

$$
\begin{array}{rl}
      & \Hom{C}{I}{A_1 \to_{a_1} ( \cdots (A_{i-1} \to_{a_{i-1}} (A_i \to_{a_i} B))\cdots)}\\
\cong & \Hom{C}{I}{A_{p(i)} \to_{l} ( \cdots (A_{p(2)} \to_{l} (A_{p(1)} \to_{l} B))\cdots)}
\end{array}
$$

However, the sequence is reversed on the right due to using left-implication.

So what does this tell us?  It says that at the top level, we can define a function using only right-implication or only left-implication.  Thus, this gives us the impression that perhaps we can get away with a single notion of implication (or function types), but alas this is not the case.

Putting things another way, the previous proof shows that we can take a sequence of right rules for one implication and turn it into a sequence of right rules for the other implication, but what about the left rules?

In our semantics the left rules correspond to the morphisms:

$$
\begin{array}{l}
\reval : (A \rimp B) \before A \mto B\\
\leval : A \before (A \limp B) \mto B
\end{array}
$$

These are called the evaluators of the internal-homs.  Thus, if we could replace $$A \rimp B$$ with $$A \limp B$$ or vice versa, then we have to be able to derive both of the previous evaluators in order to keep both notions of left rules. Suppose we only had right implication, then we would need to be able to define:

$$
\begin{array}{l}
\reval : (A \rimp B) \before A \mto B\\
\leval : A \before (A \rimp B) \mto B
\end{array}
$$

The former we have by assumption, but the latter is impossible to derive using $$\reval$$ and $$\rcurry$$.  In fact, it would require the use of exchange.



This tells us something important about the differences between right and left implication.  They differ primarily on how we use functions.   This point shows up best when thinking about binary operators. Binary operators come in two isomorphic forms:

$$
\begin{array}{l}
\Hom{C}{I}{a \rimp b \rimp c} \cong \Hom{C}{I}{(a \before b) \rimp c}\\
\Hom{C}{I}{a \rimp b \limp c} \cong \Hom{C}{I}{(b \before a) \rimp c}
\end{array}
$$

Suppose we have variables $$x : a$$ and $$y : b$$.  If we have a binary operator $$op : a \rimp b \rimp c$$, then applying it to $$x$$ and $$y$$ yields $$x op y$$ corresponding to the first case, but if we have $$op : a \rimp b \limp c$$, then we apply it to obtain $$y op x$$, because the left implication swaps the ordering.

This does indeed affect programming.  Consider the following types for zipWith:



These are all vaild zipWith types, but they are not all isomorphic because the ordering of the arguments yield potentially different outputs, because the input operation is a non-commutative operator and the types encode this.

Suppose we have two lists $$[1,2,3]$$ and $$[4,5,6]$$.  Then we apply the zipWith corresponding to each type above as follows:

$$
\begin{array}{rl}
1. & zipWith [1,2,3] [4,5,6] = [1 > 4, 2 > 5, 3 > 6] = [False, False, False]\\
2. & zipWith [1,2,3] [4,5,6] = [1 > 4, 2 > 5, 3 > 6] = [False, False, False]\\ 
3. & zipWith [1,2,3] [4,5,6] = [4 > 1, 5 > 2, 6 > 3] = [True, True, True]\\ 
4. & zipWith [1,2,3] [4,5,6] = [4 > 1, 5 > 2, 6 > 3] = [True, True, True]\\  
5. & zipWith [1,2,3] [4,5,6] = [4 > 1, 5 > 2, 6 > 3] = [True, True, True]\\
6. & zipWith [1,2,3] [4,5,6] = [4 > 1, 5 > 2, 6 > 3] = [True, True, True]\\ b \rimp (a \rimp b \limp c) \rimp [a] \rimp [c]\\
\end{array}
$$