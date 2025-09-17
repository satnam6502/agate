module Combinators where

open import Data.List
open import Data.Product
open import Effect.Monad
open import AgateClass

open RawMonad {{...}}

-- Parallel composition combinator.
-- Circuit c1 is applied to input i1, in parallel with circuit c2 being applied o input i2.

_||_ : ∀ {A B C D : Set} {m : Set → Set} ⦃ _ : RawMonad m ⦄  → (A → m B) → (C → m D) → A × C → m (B × D)
_||_ c1 c2 (i1 , i2)
  = do o1 ← c1 i1
       o2 ← c2 i2
       pure (o1 , o2)
