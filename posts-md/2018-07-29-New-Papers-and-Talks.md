---
layout: blog
title: "New Papers and Talks"
date: 2018-07-29
categories:
 - papers
 - talks
---

This summer I went to [FLOC 2018](http://www.floc2018.org/) where I gave two talks related to a paper and an extended abstract, but the week before I had the pleasure to visit [Dominic Orchard](https://www.cs.kent.ac.uk/people/staff/dao7/) at the [University of Kent](https://www.cs.kent.ac.uk) where I gave a talk during the  [PLAS](https://www.cs.kent.ac.uk/research/groups/plas/) seminar.  In this short post I summarize each of these recent contributions.

The abstract and title for my PLAS talk are as follows:

  - **Title**: _Advancing Programming-Language Based Formal Methods Research and Education_
       
  - **Abstract**:
      In this talk I will introduce my work in both research and CS education. First, I will present a project applying substructural logics and functional programming to the theory of threat analysis using attack trees. This will include an overview of a new domain-specific programming language called Lina for conducting threat analysis. Then I will present a new project developing substructural dependent type systems that treat modeling resources as a first-class feature of the language.  Finally, I will conclude with three new projects in CS education: an overview of a new community outreach program called the Pull CS Back Initiative for primary and secondary CS educators, an overview of a new education programming language called Disco that is used to teach functional programming and formal methods in discrete mathematics, and finally, an overview of a new auto-grading system for the Haskell programming language.

The slides for this talk can be found [here](http://metatheorem.org/includes/talks/PLAS-Kent-2018/).

Following my amazing week at Kent I gave a talk presenting my coauthors, Jiaming Jiang and Aubrey Bryant, and my new paper at the [Fifth International Workshop on Graphical Models for Security](http://gramsec.uni.lu/):

  - **Title**: _On Linear Logic, Functional Programming, and Attack Trees_
       
  - **Abstract**:
      This paper has two main contributions. The first is a new linear logical semantics of causal attack trees in four-valued truth tables. Our semantics is very simple and expressive, supporting specializations, and supports the ideal semantics of causal attack trees, and partially supporting the filter semantics of causal attack trees. Our second contribution is Lina, a new embedded, in Haskell, domain specific functional programming language for conducting threat analysis using attack trees. Lina has many benefits over existing tools; for example, Lina allows one to specify attack trees very abstractly, which provides the ability to develop libraries of attack trees, furthermore, Lina is compositional, allowing one to break down complex attack trees into smaller ones that can be reasoned about and analyzed incrementally. Furthermore, Lina supports automatically proving properties of attack trees, such as equivalences and specializations, using Maude and the semantics introduced in this paper.

The paper can be found [here](http://metatheorem.org/includes/pubs/GraMSec18.pdf) and the slides for my talk [here](http://metatheorem.org/includes/talks/GraMSec-2018/).

Finally, I had to fill in for Jiaming at the [Joint Workshop on Linearity & TLLA](), because her flight got delayed, but she is the first author and lead of the following paper that is joint work with myself and [Valeria de Paiva](http://www.valeriadepaiva.org/):

  - **Title**: _On the Lambek Calculus with an Exchange Modality_
       
  - **Abstract**:
      In this paper we introduce Commutative/Non-Commutative Logic (CNC logic) and two categorical models for CNC logic. This work abstracts Benton’s Linear/Non-Linear Logic [4] by removing the existence of the exchange structural rule. One should view this logic as composed of two logics; one sitting to the left of the other. On the left, there is intuitionistic linear logic, and on the right is a mixed commutative/non-commutative formalization of the Lambek calculus. Then both of these logics are connected via a pair of monoidal adjoint functors. An exchange modality is then derivable within the logic using the adjunction between both sides. Thus, the adjoint functors allow one to pull the exchange structural rule from the left side to the right side. We then give a categorical model in terms of a monoidal adjunction, and then a concrete model in terms of dialectica Lambek spaces.

The paper can be found [here](http://metatheorem.org/includes/pubs/LINEARITY-TLLA18.pdf) and the slides [here](http://metatheorem.org/includes/talks/LINEARITY-TLLA-2018.pdf).

I am particularly proud of the last two contributions above.  They are the first contributions I have produced in collaboration with both undergraduate students at Augusta University and also visiting Ph.D. students.  Jiaming Jiang is a very talented Ph.D. student at North Carolina State University and Aubrey Bryant is also a very talented undergraduate research assistant.  I am very lucky to get the chance to work with them.  These are also contributions that were produced as a result of my first NSF award which ends in March.  I am really happy to be ending that award on a high note.