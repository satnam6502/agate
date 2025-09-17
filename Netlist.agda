module Netlist where

open import Data.Bool
open import Data.Nat
open import Data.String
open import Data.List
open import Data.Vec
open import Data.Product
open import Data.Unit.Polymorphic.Base using (⊤)
open import Effect.Monad
open import Effect.Monad.State
open import Effect.Monad.State.Instances
open import Effect.Monad.Identity.Instances

open import AgateClass

open RawMonad {{...}}
open RawMonadState {{...}}

data VecType : Set where
   vecType : ℕ → VecType -- For now just the size, assume only bit-vectors for now.

data Bit : Set where
  localNet : ℕ → Bit
  indexOfVec : ℕ → ℕ → Bit
  zeroV : Bit

data NetType : Set where
  BitType : NetType
  VectorType : ℕ → NetType -- Just bit-vectors for now.

data CircuitNode : Set where
  inputBitNode : String → Bit → CircuitNode
  inputVecNode : String → ℕ → CircuitNode
  outputBitNode : String → Bit → CircuitNode
  outputVecNode : (n : ℕ) → String → Vec Bit n → CircuitNode
  invNode  : Bit → Bit → CircuitNode
  and2Node : Bit → Bit → Bit → CircuitNode
  or2Node  : Bit → Bit → Bit → CircuitNode
  xor2Node : Bit → Bit → Bit → CircuitNode
  addNode : ∀ (n : ℕ) → Vec Bit n → Vec Bit n → ℕ → CircuitNode
  lessThanNode : ∀ (n : ℕ) → Vec Bit n → Vec Bit n → Bit → CircuitNode
  muxNode : ∀ (n : ℕ) → Bit → Vec Bit n → Vec Bit n → ℕ → CircuitNode

record NetlistInfo : Set where
  field
    circuitName : String
    netCount : ℕ
    vecCount : ℕ
    vecDefs : List (VecType × ℕ)
    inputPorts : List (String × NetType)
    outputPorts : List (String × NetType)
    nodes : List CircuitNode
open NetlistInfo

NetlistState = State NetlistInfo

setCircuitName : String → NetlistState ⊤
setCircuitName name = do
  s ← get
  put (record s {circuitName = name})

mkNewBitNet : NetlistState Bit
mkNewBitNet
  = do s ← get
       let newNet = localNet (netCount s)
       put (record s {netCount = netCount s + 1})
       return newNet

explode' : ∀ (vecNr i : ℕ) → Vec Bit i
explode' vecNr 0 = []
explode' vecNr (suc i) = indexOfVec vecNr i ∷ explode' vecNr i

explode : ∀ (vecNr i : ℕ) → Vec Bit i
explode vecNr i = Data.Vec.reverse (explode' vecNr i)

mkNewVecNet : (n : ℕ) → NetlistState (ℕ × Vec Bit n)
mkNewVecNet size
  = do s ← get
       let vc = vecCount s
           vDefs = vecDefs s
           newVecDef = vecType size
       put (record s {vecCount = vc + 1; vecDefs = (newVecDef , vc) ∷ vDefs})
       return (vc , explode vc size)


inputBit : String → NetlistState Bit
inputBit name = do
  newNet ← mkNewBitNet
  s ← get
  put (record s {inputPorts = (name , BitType) ∷ inputPorts s; nodes = inputBitNode name newNet ∷ nodes s})
  return newNet

inputVec : String → (n : ℕ) → NetlistState (Vec Bit n)
inputVec name n = do
  (vecNr , newVecNet) ← mkNewVecNet n
  s ← get
  put (record s {inputPorts = (name , VectorType n) ∷ inputPorts s; nodes = inputVecNode name vecNr ∷ nodes s})
  return newVecNet

outputBit : String → Bit → NetlistState ⊤
outputBit name i = do
  s ←  get
  put (record s {outputPorts = (name , BitType) ∷ outputPorts s; nodes = outputBitNode name i ∷ nodes s})

outputVec : {n : ℕ} → String → (Vec Bit n) → NetlistState ⊤
outputVec {n = n} name v = do
  s ←  get
  put (record s {outputPorts = (name , VectorType n) ∷ outputPorts s; nodes = outputVecNode n name v ∷ nodes s})

invNL : Bit → NetlistState Bit
invNL i = do
  newNet ← mkNewBitNet
  s ←  get
  put (record s {nodes = invNode i newNet ∷ nodes s})
  return newNet

binaryNetNode : (Bit → Bit → Bit → CircuitNode) → Bit × Bit → NetlistState Bit
binaryNetNode op (i₁ , i₂) = do
  newNet ← mkNewBitNet
  s ←  get
  put (record s {nodes = op i₁ i₂ newNet ∷ nodes s})
  return newNet

and2NL : Bit × Bit → NetlistState Bit
and2NL = binaryNetNode and2Node

or2NL : Bit × Bit → NetlistState Bit
or2NL = binaryNetNode or2Node

xor2NL : Bit × Bit → NetlistState Bit
xor2NL = binaryNetNode xor2Node

addNL : {n : ℕ} → Vec Bit n × Vec Bit n → NetlistState (Vec Bit (n + 1))
addNL {n = n} (v1 , v2) =
  do (vi , newVecNet) ← mkNewVecNet (n + 1)
     s ← get
     put (record s {nodes = addNode n v1 v2 vi ∷ nodes s})
     return newVecNet

lessThanNL : {n : ℕ} → Vec Bit n × Vec Bit n → NetlistState Bit
lessThanNL {n = n} (v1 , v2) =
  do newNet ← mkNewBitNet
     s ← get
     put (record s {nodes = lessThanNode n v1 v2 newNet ∷ nodes s})
     return newNet

muxNL : {n : ℕ} → Bit × (Vec Bit n × Vec Bit n) → NetlistState (Vec Bit n)
muxNL {n = n} (sel , (v1 , v2)) =
  do (vi , newVecNet) ← mkNewVecNet n
     s ← get
     put (record s {nodes = (muxNode n sel v1 v2 vi) ∷ nodes s})
     return newVecNet

instance
  NetlistAgate : Agate NetlistState Bit
  NetlistAgate = record
     { b0 = zeroV
     ; inv = invNL
     ; and2 = and2NL
     ; or2 = or2NL
     ; xor2 = xor2NL
     ; add = addNL
     ; lessThan = lessThanNL
     ; mux = muxNL
     }

initialState : NetlistInfo
initialState = record
  { circuitName = ""
  ; netCount = 0
  ; vecCount = 0
  ; vecDefs = []
  ; inputPorts = []
  ; outputPorts = []
  ; nodes = []
  }

makeNetlist : NetlistState ⊤ → NetlistInfo
makeNetlist circuit = execState circuit initialState

