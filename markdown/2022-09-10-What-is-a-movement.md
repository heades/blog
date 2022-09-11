---
title: "Fitness: What is a movement?"
date: 2022-09-10
categories:
  - HCI
  - fitness
abstract: "On the abstract characterization of fitness-training movements."
toc: false
---

I'm currently studying the best way to design and develop
remote-training tools for athletic training.  The first question I
asked myself is what are the similarities of training protocols across
sports and fitness training.  Surprisingly, they all use the same
basic concepts!  

In this post I'm going to lay out an abstract characterization of the
most important basic element found in every training protocol, a
**movement**.  When we think of fitness training we first think of a
workout, and depending on the level of ones training, this might be a
twenty-minute workout, or it could be larger with multiple workouts in
a day.  Despite which one we follow, at their core workouts consist
mainly of training movements.  Thus, before we can even define what a
workout is formally, we need a formal definition of a training
movement.

Movements can take on many forms, for example:

- 10 pushups
- 200m swim (moderate pace)
- 5 snatches @115lbs
- 5000m run, but every 2min do 5 burpees

This list of movements captures nearly all of the properties one finds
in a movement.  We can see that we have:

- Descriptions (pushups, swim, snatches, run)
- Repetitions (10, 5)
- Pacing (moderate pace)
- Weight (115lbs)
- Distances (200m, 5000m)
- Submovements (burpees)
- Timing (2min)

Just in those few examples we have a lot of structure.  It was when I
realized that movements could have submovements that movements didn't
seem so simple anymore. An abstract characterization must account for
all this structure, and be amendable to creativity capable of
capturing newly create movements. 

## Movements

A movement is described by several attributes akin to how we describe
a table in a database. The following table describes each attribute.

<table summary="This data table describes the attributes associated with a movement: description, labels, notes, increment, scalars, measures, submovements.">
    <caption>
      Movement Attributes
    </caption>    
  <thead>
    <tr>
      <th scope="col">Description</th>      
      <th scope="col">Notes</th>
      <th scope="col">Labels</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>A simple explanation of the movement.</td>      
      <td>Useful information about the movement.</td>
      <td>One or more tags for organizing and searching for movements.</td>
    </tr>
  </tbody>
  <thead>
    <tr>      
      <th scope="col">Iteration</th>
      <th scope="col">Scalars</th>
      <th scope="col">Measures</th>      
      <th scope="col">Submovements</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>A quantitative total describing the amount of work the athlete must do to complete the movement.</td>
      <td>One or more additional factors that affects the difficulty of completing each iteration.</td>
      <td>One or more inputs the athlete must record after completing the movement.</td>
      <td>One or more movements that must be completed at some point during the parent movement.</td>
    </tr>
  </tbody>
</table>  

The set of attributes is broken up into two levels: the top level
describes the movement via the description, notes, and labels
attributes, and the bottom level describes the set of attributes that
make up the core of the movement: iteration, scalars, measures, and
submovements. The bottom level is perhaps the most interesting, and so
we concentrate on that. 

**Iteration**. The iteration tells the athlete how to successfully
complete the movement.  For example, an iteration can be the total
number of reps, or a distance they must run or swim, or the number of
calories to complete, or an amount of time they must continually do
the movement without stopping.

**Scalars**.  Now scalars modify a movements difficulty in some way.
For example, specifying a weight for an olympic weightlifting
movement, or requiring the athlete to wear a weighted vest during GHD
situps, or requiring a moderate pace during a run, or even a slow pace
during a run, or scaling handstand pushups to make them easier by
placing their head under an abmat. Thus, scalars can make a movement
more difficult or they can make them easier.

**Measures**.  During training an athletes performance must be
*measured* against some aspect of the movements they complete.
Therefore, measures are one or more inputs the athlete must record
after completing the movement.  For example, they might be asked to
record their pace while doing a run or swim, or the total time it took
them to complete the movement, or the number of reps they were able to
finish. Then we can compare measures against multiple completions of
the movement over time and assess the athletes performance.

**Submovements**.  During a particular movement an athlete might be
asked to complete some additional movements at some point in time. For
example, having to complete 5 burpees every 2min during a 5K run, or
having to row 50 calories if they fail to complete 50 toes to bar. As
we can see submovements consist of a movement as described above, but
also an additional property we call a **modality** which describes at
which point the athlete must do the submovement.  The modality can be
linked to the iteration or can be independent; e.g., in the former
case, completing 3 push-ups every 10 reps of 50 pull ups (the
iteration is 50 reps), or in the latter case, completing 5 burpees
every 2 min during the 5K run (the iteration is 5K meters).

## Conclusion

As we can see movements are actually quite interesting.  Now that we
can formally define a movement we can build and design tools that can
track, query, and analyze every aspect of a movement.  In a future
post I'll describe how we can put movements together to form workouts
and complete training programs.