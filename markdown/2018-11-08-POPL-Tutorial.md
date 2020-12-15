---
layout: blog
title: "POPL Tutorial: Linear and Graded Modal Types for Fine-Grained Program Reasoning"
date: 2018-11-08
categories:
 - POPL
 - conferences
 - granual
---

I am pleased to announce that the [Granule Project](https://granule-project.github.io/) will have a [tutorial](https://popl19.sigplan.org/event/popl-2019-tutorialfest-t3-linear-and-graded-modal-types-for-fine-grained-program-reasoning) during the [POPL 2019 TutorialFest](https://popl19.sigplan.org/track/POPL-2019-TutorialFest) this year in Portugal.  The purpose of the tutorial is to give an in-depth look at everything the Granule Project is trying to accomplish and it will cover what results we have now, and what we are working on for the future.

The abstract is:

"Linear types have long been heralded as a mechanism for enforcing strict adherence to resource-based protocols, e.g., file handles, operation system APIs, and communication protocols in concurrency. Recent work has seen linear types become an increasingly popular topic in our community, with the rise in the work on session types, with new proposed extensions to Haskell for linear types, and with languages such as Rust and ATS. This tutorial provides an introduction to linear types and a look at the state-of-the-art in type systems extending linear types with graded modal types as a basis for more fine-grained program reasoning as embodied by the Granule programming language. Granule combines linear types with lightweight dependent types and graded modal types, providing a rich type system for enforcing fine-grained resource constraints on top of a functional language in the style of Haskell/ML. This tutorial will cover both the theoretical and practical aspects of linear and graded modal types, with an opportunity to try Granule via exercises as well an introduction to the research context and recent work in the literature."

The schedule for our tutorial will look something along the lines of the following:

1. (40 minutes) Introduction to linear types (Orchard)
   - Basics of how linear type systems work and are defined;
   - Examples using Granule and Linear Haskell.
2. (10 minutes) Tinkering session and help installing Granule (all)
   - Small set of linear typing exercises.
3. (40 minutes) Fine-grained reasoning via graded modal types and lightweight dependent types (Orchard & Liepelt)
   - Graded modal type theory;
   - GADTs and indexed types and their interaction with linearity and grading; Examples uses Granule.
4. (30 minutes) Coffee break + tinkering session (all)
   - More comprehensive set of exercises, exploring some of Granule’s standard Prelude library.
5. (15 minutes) Feedback on tinkering session, solutions, and further examples. (Liepelt)
6. (45 minutes) The future: challenges of adding full dependent types to linear, graded modal type systems (Eades).

Prerequisite knowledge:

   - Some basic functional programming experience, e.g., ML, OCaml, Haskell, F#.
   - Basic understanding of type systems, e.g., simple typed lambda-calculus.


If you are interested in the next generation programming languages firmly based on substructural logics, then please come to the tutorial, and tell your friends!

I am looking forward to seeing you there.

