module AgateClass where

open import Data.Nat
open import Data.Product
open import Data.Vec
open import Effect.Monad

record Agate (m : Set → Set) ⦃ _ : RawMonad m ⦄ (Bit : Set) : Set where
  field
     b0 : Bit
     inv : Bit -> m Bit
     and2 : Bit × Bit -> m Bit
     or2 : Bit × Bit -> m Bit
     xor2 : Bit × Bit -> m Bit
     add : {n : ℕ} -> Vec Bit n × Vec Bit n -> m (Vec Bit (n + 1))
     lessThan : {n : ℕ} -> Vec Bit n × Vec Bit n -> m Bit
     mux :  {n : ℕ} -> Bit × (Vec Bit n × Vec Bit n) -> m (Vec Bit n)
open Agate {{...}} public

