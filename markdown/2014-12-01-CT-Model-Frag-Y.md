---
layout: blog
title: "On the Categorical Model of Fragmented Y"
date: 2014-12-01
categories: 
 - category theory
 - trellys
 - Y combinator
---

<script type="text/x-mathjax-config">
  MathJax.Hub.Config({ TeX: { extensions: ["AMSsymbols.js"] }});
</script>

\\(\newcommand{\interp}[1]{\unicode{x27e6} #1 \unicode{x27e7}}\\)

I recently published a <a href="?">post</a> on the categorical model of fragmented system T.  Aaron Stump -- my Ph.D. advisor -- asked a very good question.  One property the Trellys team wants in a PL is a non-terminating fragment to conduct general purpose programming.  However, as Aaron pointed out fragmented system T has a terminating programmatic fragment, but what if we make it non-terminating? He asked particularly about adding the Y combinator.
My response was that I did not know how to add just the Y combinator, but I argued that the programmatic fragment could be non-terminating by making it uni-typed.

I took his question as a challenge to figure out how to add just the Y combinator, and then obtain a categorical model.  One thing had to be true of our model, it must have a cartesian closed subcategory to model the logical fragment in.  Adding the Y combinator to STLC is simple enough, and since STLC is modeled by cartesian closed categories, then there should be an extension of cartesian closed categories with fixpoint operators. Keeping this idea in mind I did some thinking, and looked into the literature.  It turns out that we can extend a cartesian closed category with fixpoint operators to obtain a model for the Y combinator.  This post describes how this is done.

<h3>Fragmented Y</h3>
First thing is first.  We need to define the functional PL we will be analyzing. 
<img width="90%" height="130%" src="/images/posts/2014-12-01-CT-Frag-Y/def-Y.png"><br>
Just as we did in the previous post the programmatic fragment contains all typable terms using the rules annotated with \\(\mathsf{Y}\\), and the logical fragment contains all typable terms using the rules annotated with \\(\mathsf{S}\\).  We can easily see that the programmatic fragment is non-terminating. Clearly, \\(\cdot \vdash_{\mathsf{Y}} \mathsf{Y}\,(\lambda x:T.x) : T\\), and
<center>\\(\mathsf{Y}\,(\lambda x:T.x) \leadsto (\lambda x:T.x)\,(\mathsf{Y}\,(\lambda x:T.x)) \leadsto \mathsf{Y}\,(\lambda x:T.x)\\)</center>
In addition, it is well known that the logical fragment is terminating.  Thus, the logical fragment is the isolation of a terminating subtheory of a non-terminating theory.


<h3>Categorical Model</h3>
The idea is to argue how we can model the theory in a cartesian closed category with some additional structure.  Just as we have said above the logical fragment can be modeled by a cartesian closed category.  The subtheory rule \\({\rm Y\_{\small sub}}\\) can be modeled by  functor from the model of the logical fragment to the model of the programmatic fragment. This is the same as it was for fragmented system T.  In addition, it is easy to handle \\(\mathsf{zero}\\) and \\(\mathsf{suc}\\). So the most interesting question here is how do we model the programmatic fragment?  The answer is well known, and can be found <a href="http://www.di.ens.fr/users/longo/files/CategTypesStructures/book.pdf">here</a> -- this book has a lot of great things in it, but lacks in presentation and the omission of details in some of the equational reasoning.

We model the programmatic fragment in a cartesian closed category extended with fixpoints for each object.
<img width="95%" src="/images/posts/2014-12-01-CT-Frag-Y/comm-diag.png"><br>
In any cartesian closed category we have the morphism \\( \pi\_2 : \Gamma \times (T \Rightarrow T) \to (T \Rightarrow T) \\). Using this morphism we can define the following morphism in a cartesian closed category with fixpoint operators:
<center>
\\(\mathsf{cur}(\pi\_2;\mathsf{fix}\_T) : \Gamma \to (T \Rightarrow T) \Rightarrow T\\)
</center>
This morphism is the \\(\mathsf{Y}\\) combinator.  That is, we can define
<center>
\\( \interp{\Gamma \vdash_{\mathsf{Y}} Y : (T \to T) \to T}\,=\,\mathsf{cur}(\pi\_2;\mathsf{fix}\_{\interp{T}}) \\)        
</center>

A categorical model must have enough structure to model every typable term, but it must also model the reduction rules.  That is, for any \\(\Gamma \vdash\_{\theta} t\_1 : T\\) and \\(\Gamma \vdash\_{\theta} t\_2 : T\\), if \\(t\_1 \leadsto t\_2\\), then \\(\interp{\Gamma \vdash\_{\theta} t\_1 : T} = \interp{\Gamma \vdash\_{\theta} t\_2 : T}\\), where \\(\theta \in \{\mathsf{S},\mathsf{Y}\}\\). It is well-known that if \\(\theta = \mathsf{S}\\), then the reduction rules of STLC can be modeled by a cartesian closed category. In fact, we have \\(\beta\\)-equality in the model: 
<center>
(\\(\beta\\)-cat) \\( \langle \mathsf{cur}(f),g \rangle;\mathsf{app} = \langle \mathsf{id},g \rangle;(\mathsf{cur}(f) \times id);\mathsf{app} = \langle \mathsf{id},g\rangle;f \\)
</center>
Using \\(\beta\\)-cat we can prove the following:
<center>
<img width="50%" src="/images/posts/2014-12-01-CT-Frag-Y/Y-cat.png">
</center>
We call the previous fact \\(\mathsf{Y}\\)-cat.  Now we can show that a cartesian closed category with fixpoint operators models the reduction rule for the \\(\mathsf{Y}\\)-combinator:
<center>
 <img width="90%" src="/images/posts/2014-12-01-CT-Frag-Y/Y-eq.png">
</center>
It took me the better part of the weekend to get the equational reasoning right, so hopefully I did not make any mistakes.

The way we model the Y combinator is slightly different from the book <a href="http://www.di.ens.fr/users/longo/files/CategTypesStructures/book.pdf">here</a>.  There the authors use the morphism \\( !\_{\Gamma};\mathsf{cur}(\pi\_2;\mathsf{fix}\_T) : \Gamma \to (T \Rightarrow T) \Rightarrow T \\), where \\(!\_\Gamma : \Gamma \to \top\\) is the terminal morphism, but I do not see a reason to use the terminal morphism when we can just use \\(\pi\_2\\). We obtain the same result here, but I might be missing something.

Finally, we arrive at the following main theorem:
<div class="theorem">   Suppose that \\(\mathcal{S}\\) is cartesian closed category (a model of the logical fragment of fragmented Y), and that \\(\mathcal{Y}\\) is a cartesian closed category with fixpoint operators (a model of the programmatic fragment of fragmented Y).  Then \\( (\mathcal{S}, S, \mathcal{Y}) \\) is a  model of fragmented Y, where  \\( S : \mathcal{S} \to \mathcal{Y} \\) is a full and faithful functor.</div>

It was a lot of fun figuring this out!