---
layout: blog
title: "NIST Workshop on Computational Category Theory: Day 1 and Day 2"
date: 2015-09-30
categories:
 - conference
 - category theory
---



This is the continuation of a previous <a href="http://blog.metatheorem.org/?p=2661">post</a>.  The schedule for the workshop can be found <a href="http://blog.metatheorem.org/wp-content/uploads/2015/09/Computational-Category-Theory-Workshop-Sept.-28-29-Schedule.pdf">here.</a>  In addition, the slides can be found <a href="http://www.appliedcategorytheory.org/slides-from-the-cct-workshop/">here</a>.  This post is broken up into the repsective days of the workshop.  I will give some take aways that I thought were interesting.

<h2>Day 1</h2>

Upon arriving at the NIST campus for the first time we had to first visit the visitors center to obtain passes for the workshop.  There we would just stand in line and wait.  There I noticed a few people hanging around and realized that they were attending the workshop.  I offered them a ride from there to the main building.  So we all piled in my small rental car and made our way over.

The workshop had a really good turn out.  I think there were around twenty people.  The group was a nice mix of both academics and people from industry.  I found it very interesting to here what kind of problems the industry folks thought that category theory (CT) could help solve.  An even more interesting aspect of talking with everyone was the people like me who already love CT do not need much convincing, but getting engineers and other practioners to see that CT is a worthy theory to learn for their job.

CT can be very intimidating, and there is an initial startup cost of learning it.  There were a number of proposals for trying to fix this problem.  For example, using different language.  That is, do not call it CT, but something else, because it seems that some words are scary to people, for example, monad, pull back, functor, Kan extension, etc.  I do not think this is good idea personally.  A better idea, that was also mentioned at the workshop, is to get better at teaching CT, especially in the U.S.  There are many universities that do not even teach it at the graduate level, but we really need it at the undergraduate level.  This would be a huge gain if we could introduce people to CT earlier.  Then they learn the proper way to think earlier on as opposed to having to unlearn some things.  Any teaching researchers out there, you are up!

The first talk was by Spencer Breiner and it was called "Structural Mathematics for Complex Systems".  This talk was a "why are we here?" talk.  It tried to explain just what Computational Category Theory (CCT) is.  CCT is to be a another tool in the tool box for applied problem solving.  For example, calculus came out of Newton studying the world around him, and by wanting to explain his world using the language of mathematics.  The same is hoped for CCT.  This new tool is to be very computational which means we want to actually implement categorical phenomenon.   We would like to be able to compute with them, for example, we might want to compute a pull back as opposed to just knowing that one exists.

Some interests pointed out by Spencer that CCT could potentially contribute to are Software Security and Specification, Cyberphysical systems, Data Integration, and interfacing several databases -- think healthcare.gov.

He went on to really do a good job outlining why CT, and even why not CT, but I will not be able to do his talk justice here.  David Spivak did recommend that he record the talk and put it on YouTube, and so if he does I will add a link here.

David Spivak gave the second talk of the day filling in for Jacques Carette who could not make the workshop.  David talked about his work using <a href="http://ncatlab.org/nlab/show/operad">operads</a> to model modular thinking.  The idea is that a concept is an operad, and more advanced concepts can be constructed using various operators on operads.  Check out <a href="http://math.mit.edu/~dspivak/informatics/grants/AFOSR--Proposal.pdf">his proposal</a> for more information.

The forth talk of the day is another I liked a lot.  It was on the "Functorial Query Language (FQL)" which is a new database description and query language.  The presenter was Ryan Wisnesky a colleague of David Spivak's.   FQL is an implementation of the notion that any database can be given a semantics in CT.

A database scheme is a category where the objects are tables and the morphisms are columns.  Suppose \\(T\\) is an object, then the morphism \\(c : T \to T'\\) is a column of \\(T\\) valued in \\(T'\\).  Now an instance of a database schema (category) is a set-valued functor \\(F : D \to \mathsf{Set}\\) where \\(D\\) is the schema.  An interesting point about this semantics is that data migration from one DB, \\(D\\), to another, \\(D'\\), is simply a functor \\(M : D \to D'\\).  This idea goes back to Bob Rosebrugh and Michael Johnson's work in 1996, but was expanded on by David Spivak.  See the paper <a href="http://math.mit.edu/~dspivak/informatics/FunctorialDataMigration.pdf">Functorial Data Migration</a> by David Spivak for more on how DB's can be designed using categories.

Ryan presented his work on implementing FQL, and hence, implementing categories and operations on categories such as pull backs.   He ran into some issues, because he wants to be able to implement categories and then fully automatically prove properties about these categories.  For example, any constraints that must be satisifed to get the pull back needs to be automatically discharged.  A more simple issue is, any particluar category might have a morphism \\(m : A \to A\\) which provides a means to create an infinite number of morphisms, \\(m\\), \\(m;m\\), \\(m;m\\), \\(\ldots\\), through composition.  So how do we concreately implement this?  He is using Java, which I think is a bad idea, because just as he notes he runs into problems implementing these.  I however would have used a lazy language with corecursion to implement the infinte stream of compositions. Then we only compute what we need when we need it.

Someone posed the question of why they did not use a functional programming lanugage like Haskell for implementing FQL.  Ryan's response was that Haskell corresponds to the Hask category, and hence, is only usebable for working within one category and not suitable for implementing general categories.  I think this is a narrow view.  First, this is only one view of the semantics of a functional language, but it happens to be very useful one.  I could could argue that Java has a semantics in coalgebras using the work of Bart Jacobs, and hence, by Ryan's argument Java is only good for working in a coalgebra. 

Check out more about FQL <a href="http://categoricaldata.net/fql.html">here</a>.

<h2>Day 2</h2>

The second day was much shorter due to it being the last day.  Bob Rosebrugh gave the opening talk on his and Mike Johnson's work on a functorial semantics of DBs.  He also demoed a tool his students and he implemented to construct databases in a categorial way called <a href="http://www.mta.ca/~rrosebru/project/Easik/">Entity Attribute Sketch (EAS)</a>. He also has a few other categorical goodies such as a graphical database for category theory <a href="http://www.mta.ca/~rrosebru/project/gdct/">GDCT</a> which has a number of things one could use to study category theory.  Lastly, he also started a project to implement a database of categories <a href="http://www.mta.ca/~rrosebru/project/dbc/">DBC</a>.  It was really cool to meet him and Mike they are both really nice people.

There were a few other talks as well, but this post is getting long enough.

The day ended with a discussion session led by David Spivak on where the project should go next.  One of the milestones decided on was the creation of a new website <a href="http://www.appliedcategorytheory.org">http://www.appliedcategorytheory.org</a> for collecting information on the project.  Go and check it out!

I found the workshop to be a lot of fun, and I am glad I went.  I got a number of useful research ideas from it.