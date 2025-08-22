---
title: 'Some notes on programming with Linear Haskell'
date: 2025-08-20
categories:
  - programming languages
  - haskell
  - type systems
  - linear types
abstract: "So I'm learning about Linear Haskell for some 
           new project ideas I have brewing, and I thought, 
           why not just add it to a note on the OLD blog!"
toc: true
---

So I'm learning about Linear Haskell for some new project ideas I have brewing,
and I thought, why not just add it to a note on the OLD blog! It took me a day
to get this thing dusted off and building again, but after a few updates to my
hella-hacked Haskell blogging tools I use on the backend, I managed to get this
thing up and running again.

**Warning:** This is really just something for me to use to think and refer back
to later; don't expect greatness or polished writing.

# Using Linear Types in Haskell
Using linear types in GHC is pretty easy; as long as you are using a GHC version
of at least 9.0.1. Simply add the following language extension to the files you
plan on using them in:
```
{-# LANGUAGE LinearTypes #-}
```

One nice features of Cabal is that you can add default language extensions that
will be applied to all files in your project without having to add them to each
file. Add the following to your cabal file under the executable or library (or
both) configurations:
```
-- LANGUAGE extensions used by modules in this package.
default-extensions:     LinearTypes                        
```
You can add others to this field as well (as a comma separated list). 

# Linear Base
There is an ongoing effort to bring linear types to the Haskell Base by Tweag
they are calling 
[Linear Base](https://hackage-content.haskell.org/package/linear-base-0.5.0).
The idea is that it makes programming with linear types easier by importing some
of the basic facilities found in the Haskell standard library into the linear
world by adding linear bounds to the definitions, and adding some new support
for new abstractions based on linear types. 

To make it easier to work with linear base I found it easier to add the
following language extensions.
```
-- LANGUAGE extensions used by modules in this package.
default-extensions:     LinearTypes, 
                        DataKinds,
                        QualifiedDo, 
                        NoImplicitPrelude
```
When using linear base we want to default to it's prelude `Prelude.Linear`.
Thus, having the non-linear prelude qualified we can more easily control when to
use non-linearity. For example, I qualify mine as follows:
```
-- Our Prelude is Linear by default:
import Prelude.Linear
import qualified Prelude as NLPrelude
```
This way I can see in my code when I'm using non-linear features.

# Renaming the linear bound type annotations
I thought this was pretty cool! Because of the choice to make the linear bounds
Haskell datatypes, we can simply alias them to different constructors to give
them names we might like for the project we are using them for:
```
import GHC.Types (Multiplicity(..))

data LNLMult = Linear | Nonlinear

type Linear = One
type NonLinear = Many
```
Now we can annotate our types with the new names:
```
linearId :: a %Linear -> a
linearId x = x
```

# Useful Links
- [GHC Docs: Linear Types Extension](https://ghc.gitlab.haskell.org/ghc/doc/users_guide/exts/linear_types.html)
- [Hackage: Linear Base](https://hackage-content.haskell.org/package/linear-base-0.5.0)
- [Paper: Linear Haskell: practical linearity in a higher-order polymorphic language](https://dl.acm.org/doi/10.1145/3158093)
- [Paper: Linearly qualified types: generic inference for capabilities and uniqueness](https://dl.acm.org/doi/10.1145/3547626)


