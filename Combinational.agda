module Combinational where

open import Data.Bool
open import Data.Nat
open import Data.Vec
open import Data.Product

open import Effect.Monad
open import Effect.Monad.Identity
open import AgateClass
open import BitVec

open import Relation.Binary.PropositionalEquality
  using (_≡_; refl; sym; cong; cong₂; module ≡-Reasoning)

open RawMonad {{...}}

instance
  MonadIdentity = Effect.Monad.Identity.monad
  SimAgate : Agate Identity Bool
  SimAgate = record
     { inv = λ x → pure (not x)
     ; and2 = λ (x ,  y) → pure (x ∧ y)
     ; or2 = λ (x ,  y) → pure (x ∨ y)
     ; xor2 = λ (x ,  y) → pure (x xor y)
     ; add = λ (x ,  y) → pure (toBitVecAlt _ (fromBitVec x + fromBitVec y))
     ; lessThan = λ (x ,  y) → pure (bitVecLessThan x y)
     ; mux = λ (sel , (x ,  y)) → pure (muxBits sel x y)
     }

_ : inv false ≡ pure true
_ = refl

_ : and2 (false , true) ≡ pure false
_ = refl
