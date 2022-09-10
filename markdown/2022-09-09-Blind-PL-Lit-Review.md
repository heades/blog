---
title: "Open Questions in the Accessibility of Programming with Vision Impairments"
date: 2022-09-09
categories:
  - accessibility
  - HCI
  - programming
abstract: "I collect open questions of interest in the area of accessibility of programming with vision impairments.  The questions are extracted from the paper: 'Addressing Accessibility Barriers in Programming for People  with Visual Impairments: A Literature Review'."

toc: true  
---

As I've mentioned before on this blog my student and I are working on
new development tools for people with vision impairments.  One thing
we found ourselves asking is what are the open questions in this area,
and what has already been done? Luckily, Mountapmbeme et al. have
written a really great literature review:

```
Aboubakar Mountapmbeme, Obianuju Okafor, and Stephanie Ludi. 2022.
"Addressing Accessibility Barriers in Programming for People with
Visual Impairments: A Literature Review." ACM Trans. Access. Comput.
15, 1, Article 7 (March 2022), 26 pages. doi: 10.1145/3507469
```
<p style="text-align: right"> 
Find it here: 
[Mountapmbeme et. al. 2022](https://doi.org/10.1145/3507469)
</p>

The purpose of this post is to be a short note that really just
extracts these questions out of the literature review.   I'm going to
break up the set of questions into two sets: replication questions and
new research questions.

## Replication Questions

These are questions that can be found in existing studies, but that
could be replicated due to them being more than two years old, not
having a diverse population, etc.

1. Difficulty finding information within a code base without losing
   position of focus.

2. Difficulty quickly returning to a previous focal point when
   reviewing code or seeking information at another location or file
   in a large code base.  This is known as *backtracking*.   

3. How often do programmers use keyword search within their existing
   development tools to find information? 

4. How often do programmers enter information at incorrect or
   unintended locations due to loosing track of their focal point?

5. Navigation in to and out of nested structures can be challenging
   for blind programmers.

6. Blind programmers focus on types and return to re-read types more
   often than the method bodies.

7. Blind programmers focus less on method invocations to comprehend
   code. 

## New Research Questions

1. How popular are braille displays among programmers?  In addition,
   how common is it for programmers to combine braille displays with
   screen readers?

2. Challenges associated with code debugging or the process of finding
   errors in source code needs to be studied.

3. Accessible debugging tools need to be investigated.

4. Code editing by people with visual impairments needs to be
   investigated; most prefer out-of-context editing rather than
   editing in place.        

5. Code skimming is understudied, and is usually lumped together into
   code navigation, but a proper focused study needs to be done.

6. We need to better understand how people with vision impariments
   debug code, and the challenges they experience.

7. The tools and toolkits we develop need to be more reachable and
   marketed better so they are actually used by real people.