---
title: "Indexed Operations"
date: 2022-08-25
categories:
  - functional programming  
abstract: "Discusses a very useful combinator that combines folds and maps."
---

I've been working on some practical research projects lately, and so,
I've been doing a ton of programming.  In these projects I've been
working with a lot of different data types and a particular
programming pattern that I've been using over and over again has
emerged.

The types of operations I've been working with have the shape
`a -> D b` which can be viewed as an indexing into the type `D
b`. Let's consider an example, suppose we want to define generalized
union over sets.  That is, given a function `i : a -> Set b` and a
`s : Set a`, then define the union $\bigcup_{x \in s} (i\,x)$.  We can
define this function as follows:

```
indexedUnion :: (a -> Set b) -> Set a -> Set b
indexedUnion i = foldr (\x r -> (i x) `union` r) empty
```

We can see by this definition that we are essentially mapping the
indexed operation over the set and folding, but we do this at the same
time instead of going over the set twice.

Here is another example, suppose we want to take the conjunction of
the application an indexed operation `i : a -> Bool` over the set
`s : Set a`.  Then we can define this function as follows:

```
indexedAnd :: (a -> Bool) -> Set a -> Bool
indexedAnd i = foldr (\x r -> (i x) && r) True
```

So at this point we can see a pattern emerging.  Both of these
functions can be defined by a combinator of type:

```
Foldable s => (b -> b -> b)
           -> b
           -> (a -> b)
           -> s a
           -> b
```

This is an instance of the well known `foldMap` function on monoids:

```
foldMap :: Monoid m => (a -> m) -> t a -> m
```

where we get our examples above if we take the monoid on sets to be
union and the empty set, and conjunction and `True` for the monoid on
booleans.

However, consider a third example where we have an operation `i : a ->
b` and a set `s : Set a`, and we want to map over the set `s`, but
we want to do this using the accumulator pattern.  Then we can define
this function as follows:

```
indexedInsert :: (a -> b) -> Set a -> Set b
indexedInsert i = foldl (\a x -> (i x) `insert` a) empty
```

This uses the same programming pattern, but has a slightly more
general type:

```
indexedOp :: Foldable s
          => (c -> b -> b)
          -> b
          -> (a -> c)
          -> s a
          -> b
indexedOp op start i = foldl (\a x -> (i x) `op` a) start
```

Here we can see that this combinator differs from `foldMap` in that
the binary operation we are using to fold has different types for each
argument, and we index into the first. It's easily defined using
`foldr` as well:

```
indexedOp' :: Foldable s
          => (c -> b -> b)
          -> b
          -> (a -> c)
          -> s a
          -> b
indexedOp' op start i = foldr (\x r -> (i x) `op` r) start
```

We can also define versions where we index into the second argument
as well.  Notice that neither of these require `op` to be commutative,
and in our third example, `insert` is non-commutative.

Every example above can be defined using this combinator, and I've
used this operation to define a ton of programs.  It's a very useful
combinator, and I thought it would make a nice short post.