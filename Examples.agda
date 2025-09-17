module Examples where

open import Agda.Builtin.Nat
open import Agda.Builtin.FromNat
open import Data.Bool
open import Data.Bool.Properties

open import Data.Fin.Base using (Fin; zero; suc; fromℕ; toℕ; cast; quotRem; _↑ˡ_; _↑ʳ_)
import Data.Fin.Literals; instance finLiterals = λ {n} → Data.Fin.Literals.number n

open import Data.Nat.Base as Nat using (ℕ; zero; suc; _+_; _⊔_; _*_; _^_; _/_; _%_; _≤_; z≤n; s≤s; NonZero)
import Data.Nat.Literals; instance natLiterals = Data.Nat.Literals.number

open import Data.Nat.Properties
  using ( +-comm; +-assoc; +-identityʳ
        ; *-identityˡ; *-identityʳ; *-comm
        ; module ≤-Reasoning
        ; ≤-reflexive; +-monoˡ-≤
        ; ⊔-idem)

open import Data.String
open import Data.Product
open import Data.Vec
open import Effect.Monad
open import Effect.Monad.State
open import Effect.Monad.State.Instances
open import Effect.Monad.Identity.Instances
open import Effect.Monad.Identity
open import Data.Unit.Polymorphic.Base using (⊤)

open RawMonad {{...}}
open RawMonadState {{...}}

open import Data.Unit.Base using (tt)

open import Relation.Binary.PropositionalEquality
  using (_≡_; refl; sym; cong; cong₂; module ≡-Reasoning)

import Relation.Binary.PropositionalEquality as Eq
open Eq using (_≡_; refl; cong; sym)
open Eq.≡-Reasoning using (begin_; step-≡-∣; step-≡-⟩; _∎)

open import AgateClass
open import Combinators
open import Combinational
open import Netlist
open import SystemVerilog
open import BitVec

nandGate : {m : Set → Set} {Bit : Set} ⦃ _ : RawMonad m ⦄  ⦃ _ : Agate m Bit ⦄ → Bit × Bit → m Bit
nandGate = and2 >=> inv

_ : nandGate (true , false) ≡ pure true
_ = refl

nandGateCorrect : ∀ {a b : Bool} → nandGate (a , b) ≡ pure (not (a ∧ b))
nandGateCorrect = refl

nandGateTop : NetlistState ⊤
nandGateTop = do
  setCircuitName "nandGate"
  i1 ← inputBit "i1"
  i2 ← inputBit "i2"
  o ← nandGate (i1 , i2)
  outputBit "o" o

nandGateSV : String
nandGateSV = circuitToSystemVerilog nandGateTop

norGate : {m : Set → Set} {Bit : Set} ⦃ _ : RawMonad m ⦄  ⦃ _ : Agate m Bit ⦄ → Bit × Bit → m Bit
norGate (a , b)
  = do c ← or2 (a , b)
       d ← inv c
       return d

_ : norGate (true , false) ≡ pure false
_ = refl

norGateCorrect : ∀ {a b : Bool} → norGate (a , b) ≡ pure (not (a ∨ b))
norGateCorrect {a} {b}
  = refl

halfAdder : {m : Set → Set} {Bit : Set} ⦃ _ : RawMonad m ⦄  ⦃ _ : Agate m Bit ⦄ → Bit × Bit → m (Bit × Bit)
halfAdder (a , b)
  = do partial_sum ← xor2 (a , b)
       carry ← and2 (a , b)
       return (partial_sum , carry)

halfAdderCorrect : ∀ {a b : Bool} → halfAdder (a , b) ≡ pure (a xor b , a ∧ b)
halfAdderCorrect = refl

fullAdder : {m : Set → Set} {Bit : Set} ⦃ _ : RawMonad m ⦄  ⦃ _ : Agate m Bit ⦄ → Bit × Bit × Bit → m (Bit × Bit)
fullAdder (a , b , carryIn)
  = do (partialSum , partialCarry) ← halfAdder (a , b)            -- (a xor b, a ∧ b)
       (sum , partialCarry2) ← halfAdder (partialSum , carryIn)   -- (a xor b xor carryIn, (a xor b) ∧ carryIn)
       carryOut ← or2 (partialCarry , partialCarry2)              -- a ∧ b ∨ ((a xor b) ∧ carryIn)
       return (sum , carryOut)                                    -- (a xor b xor carryIn, a ∧ b ∨ ((a xor b) ∧ carryIn))

_ : fullAdder (false , true , false) ≡ pure (true , false)
_ = refl

_ : fullAdder (true , true , false) ≡ pure (false , true)
_ = refl

fullAdderCorrect : ∀ {a b carryIn : Bool} → fullAdder (a , b , carryIn)
                  ≡ let sum = (a xor b) xor carryIn
                        cout = a ∧ b ∨ ((a xor b) ∧ carryIn) in
                    pure (sum , cout)
fullAdderCorrect = refl

adder : {m : Set → Set} {Bit : Set} (n : ℕ) ⦃ _ : RawMonad m ⦄  ⦃ _ : Agate m Bit ⦄ → Bit × (Vec Bit n × Vec Bit n) → m (Vec Bit n × Bit)
adder zero (carryIn , ([] , [])) = return ([] , carryIn)
adder (suc n) (carryIn , x ∷ xs , y ∷ ys)
  = do (sum0 , carryOut0) ← fullAdder (x , y , carryIn)
       (zs , carryOut) ← adder n (carryOut0 , (xs , ys))
       return (sum0 ∷ zs , carryOut)

--                    001                           010                                 011
_ : adder 3 (false , (true ∷ false ∷ false ∷ []) , (false ∷ true ∷ false ∷ [])) ≡ pure (true ∷ true ∷ false ∷ [] , false)
_ = refl


adder8Top : NetlistState ⊤
adder8Top
  = do setCircuitName "adder8"
       cin ← inputBit "cin"
       x ← inputVec "x" 8
       y ← inputVec "y" 8
       (sum , cout) ← adder 8 (cin , (x , y))
       outputVec "sum" sum
       outputBit "cout" cout

adder8SV : String
adder8SV = circuitToSystemVerilog adder8Top


adderN : {m : Set → Set} {Bit : Set} (n : ℕ) ⦃ _ : RawMonad m ⦄  ⦃ _ : Agate m Bit ⦄ → (Vec Bit n × Vec Bit n) → m (Vec Bit (1 + n))
adderN n (a , b) = do (s , c) ← adder n (b0 , (a , b))
                      return (s ∷ʳ c)

postulate
  adderCorrect : ∀ (n : ℕ) (carryIn : Bool) (a b : Vec Bool n) → adderN n (a , b) ≡ pure (toBitVecAlt (1 + n) (fromBitVec a + fromBitVec b))
 

-- An adder using the SystemVerilog +
adder16Top : NetlistState ⊤
adder16Top
  = do setCircuitName "adder16"
       x ← inputVec "x" 16
       y ← inputVec "y" 16
       sum ← add (x , y)
       outputVec "sum" sum

adder16SV : String
adder16SV = circuitToSystemVerilog adder16Top

twoSorter : {m : Set → Set} {Bit : Set} (n : ℕ) ⦃ _ : RawMonad m ⦄  ⦃ _ : Agate m Bit ⦄ → Vec Bit n × Vec Bit n → m (Vec Bit n × Vec Bit n)
twoSorter n (x , y)
  = do lt ← lessThan (x , y)
       lower ← mux (lt , (x , y))
       higher ← mux (lt , (y , x))
       return (lower , higher)


twoSorterCorrect : ∀ (n : ℕ) (x y : Vec Bool n) → twoSorter n (x , y) ≡ pure ((if bitVecLessThan x y then x else y) , (if bitVecLessThan x y then y else x))
twoSorterCorrect n x y with bitVecLessThan x y
... | true = refl
... | false = refl

twoSorter8 : {m : Set → Set} {Bit : Set} ⦃ _ : RawMonad m ⦄  ⦃ _ : Agate m Bit ⦄ → Vec Bit 8 × Vec Bit 8 → m (Vec Bit 8 × Vec Bit 8)
twoSorter8 = twoSorter 8

_ : twoSorter8 (toBitVecAlt 8 17 , toBitVecAlt 8 9) ≡ pure (toBitVecAlt 8 9 , toBitVecAlt 8 17)
_ = refl

_ : twoSorter8 (toBitVecAlt 8 14 , toBitVecAlt 8 52) ≡ pure (toBitVecAlt 8 14 , toBitVecAlt 8 52)
_ = refl

twoSorter8Top : NetlistState ⊤
twoSorter8Top
  = do setCircuitName "twoSorter8"
       x ← inputVec "x" 8
       y ← inputVec "y" 8
       (lower , higher) ← twoSorter8 (x , y)
       outputVec "lower" lower
       outputVec "higher" higher

twoSorter8SV : String
twoSorter8SV = circuitToSystemVerilog twoSorter8Top
