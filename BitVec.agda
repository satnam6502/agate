module BitVec where

open import Agda.Builtin.FromNat
open import Data.Bool
open import Data.Product
open import Data.Vec

open import Data.Fin.Base using (Fin; zero; suc; fromℕ; toℕ; cast; quotRem; _↑ˡ_; _↑ʳ_)
import Data.Fin.Literals; instance finLiterals = λ {n} → Data.Fin.Literals.number n

open import Data.Nat.Base as Nat using (ℕ; zero; suc; _+_; _⊔_; _*_; _^_; _/_; _%_; _≤_; _≤ᵇ_; z≤n; s≤s; NonZero)
import Data.Nat.Literals; instance natLiterals = Data.Nat.Literals.number

open import Data.Nat.Properties using ( *-comm)
open import Data.Unit.Base using (tt)

open import Relation.Binary.PropositionalEquality
  using (_≡_; refl; sym; cong; cong₂; module ≡-Reasoning)

import Relation.Binary.PropositionalEquality as Eq
open Eq using (_≡_; refl; cong; sym)
open Eq.≡-Reasoning using (begin_; step-≡-∣; step-≡-⟩; _∎)


fromBit : Bool → ℕ
fromBit false = 0
fromBit true = 1

toBit : Fin 2 → Bool
toBit zero = false
toBit (suc zero) = true

reshapeForQuotRemProof : ∀ (n : ℕ) → 2 ^ (suc n) ≡ 2 ^ n * 2
reshapeForQuotRemProof n =
  begin
     2 ^ (suc n) ≡⟨⟩
     2 * 2 ^ n   ≡⟨ *-comm 2 (2 ^ n) ⟩
     2 ^ n * 2
  ∎


reshapeForQuotRem : ∀ (n : ℕ) → Fin (2 ^ (suc n)) → Fin (2 ^ n * 2)
reshapeForQuotRem n = Data.Fin.Base.cast (reshapeForQuotRemProof n)

toBitVec : {n : ℕ} → Fin (2 ^ n) → Vec Bool n
toBitVec {n = 0} _ = []
toBitVec {n = suc n} i = let (lsb , rest) = quotRem 2 (reshapeForQuotRem n i) in
                         toBit lsb ∷ toBitVec {n = n} rest

_  : toBitVec 25 ≡ (true ∷ false ∷ false ∷ true ∷ true ∷ [])
_ = refl


-- Non-Fin versions

fromBitVec : {n : ℕ} → Vec Bool n → ℕ
fromBitVec [] = 0
fromBitVec (x ∷ xs) = fromBit x + 2 * fromBitVec xs

_ : fromBitVec (true ∷ false ∷ false ∷ []) ≡ 1
_ = refl

_ : fromBitVec (true ∷ false ∷ false ∷ true ∷ true ∷ []) ≡ 1 + 8 + 16
_ = refl

toBitAlt : ℕ → Bool
toBitAlt zero = false
toBitAlt _ = true

toBitVecAlt : (n : ℕ) → ℕ → Vec Bool n
toBitVecAlt zero _ = []
toBitVecAlt (suc n) x = toBitAlt (x % 2) ∷ toBitVecAlt n (x / 2)

toFromBit : ∀ (b : Bool) → toBitVecAlt (suc zero) (fromBit b) ≡ b ∷ []
toFromBit true = refl
toFromBit false = refl

lessThanNat : ℕ → ℕ → Bool
lessThanNat x y with Nat.compare x y
...        | Nat.less _ _ = true
...        | _            = false


lessThanFin : {n : ℕ} → (Fin n) → (Fin n) → Bool
lessThanFin x y with Data.Fin.Base.compare x y
...        | Data.Fin.Base.less _ _ = true
...        | _                      = false


_ : (3 ≤ᵇ 7) ≡ true
_ = refl

bitVecLessThan : {n : ℕ} → Vec Bool n → Vec Bool n → Bool
bitVecLessThan x y = lessThanNat (fromBitVec x) (fromBitVec y)

muxBits : {n : ℕ} → Bool → Vec Bool n → Vec Bool n → Vec Bool n
muxBits true a b  = a
muxBits false a b = b
 