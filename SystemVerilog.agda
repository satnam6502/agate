module SystemVerilog where

open import Data.Nat using (ℕ; zero; suc; _≟_)
open import Data.Bool using (Bool; true; false; if_then_else_)
open import Data.Product
open import Data.Nat.Show using (show)
open import Data.String as String using (String; _++_; map; unlines)
open import Data.List hiding (_++_)
open import Data.Vec using (Vec; _∷_; [])
open import Function using (_∘_)
open import Data.Unit.Polymorphic.Base using (⊤)
open import Relation.Nullary

open import Netlist

open NetlistInfo

-- SystemVerilog generation for expressions of type Bit

showBit : Bit → String
showBit (localNet i) = "net" ++ show i
showBit (indexOfVec v i) = "vec" ++ show v ++ "[" ++ show i ++ "]"

sameValue : ℕ → ℕ → Bool
sameValue n m with n ≟ m
... | yes _ = true
... | no _  = false

-- The vec argument should be the vector literal, reversed
vecCollapsable : ℕ → (n : ℕ) → Vec Bit n → Bool
vecCollapsable vecNr 0 vec = true
vecCollapsable vecNr (suc i) (indexOfVec vecNr' i' ∷ rest) with (sameValue vecNr vecNr') | (sameValue i i')
... | true | true = vecCollapsable vecNr i rest
... | _    | _      = false
vecCollapsable _ _ _ = false

showVecAsLiteral' : {n : ℕ} → Vec Bit n → String
showVecAsLiteral' [] = ""
showVecAsLiteral' (x ∷ y ∷ []) = showBit x ++ ", " ++ showBit y
showVecAsLiteral' (x ∷ xs) = showBit x ++ ", " ++ showVecAsLiteral' xs

showVecAsLiteral : {n : ℕ} → Vec Bit n → String
showVecAsLiteral [] = "<BAD VECTOR>"
showVecAsLiteral {n = n} vec@(indexOfVec vecNr _ ∷ vs)
  = if vecCollapsable vecNr n (Data.Vec.reverse vec) then
      "vec" ++ show vecNr
    else
      "'{" ++ showVecAsLiteral' (Data.Vec.reverse vec) ++ "}"
showVecAsLiteral vec = "'{" ++ showVecAsLiteral' (Data.Vec.reverse vec) ++ "}"

-- Functions for writing out SystemVerilog

unarySVprimitive : String → Bit → Bit → String
unarySVprimitive name i o = "  "  ++ name ++ "(" ++ showBit o ++ ", " ++ showBit i ++ ");"

binarySVprimitive : String → Bit → Bit → Bit → String
binarySVprimitive name i₁ i₂ o = "  "  ++ name ++ "(" ++ showBit o ++ ", " ++ showBit i₁ ++ ", " ++ showBit i₂ ++ ");"


showSVNode : CircuitNode → String
showSVNode (invNode i o) = unarySVprimitive "not " i o
showSVNode (and2Node i₁ i₂ o) = binarySVprimitive "and " i₁ i₂ o
showSVNode (or2Node i₁ i₂ o) = binarySVprimitive "or " i₁ i₂ o
showSVNode (xor2Node i₁ i₂ o) = binarySVprimitive "xor " i₁ i₂ o
showSVNode (addNode size v1 v2 lhs) = "  assign vec" ++ show lhs ++ " = " ++ showVecAsLiteral v1 ++ " + " ++ showVecAsLiteral v2 ++ ";"
showSVNode (lessThanNode size v1 v2 lhs) = "  assign " ++ showBit lhs ++ " = " ++ showVecAsLiteral v1 ++ " < " ++ showVecAsLiteral v2 ++ ";"
showSVNode (muxNode size sel v1 v2 lhs) = "  assign vec" ++ show lhs ++ " = " ++ showBit sel ++ " ? " ++ showVecAsLiteral v1 ++ " : " ++  showVecAsLiteral v2 ++ ";"
showSVNode (inputBitNode name i) = "  assign " ++ showBit i ++ " = " ++ name ++ ";"
showSVNode (inputVecNode name n) = "  assign vec" ++ show n ++ " = " ++ name ++ ";"
showSVNode (outputBitNode name o) = "  assign " ++ name ++ " = " ++ showBit o ++ ";"
showSVNode (outputVecNode n name v) = "  assign " ++ name ++ " = " ++ showVecAsLiteral v ++ ";"

showSVNodes : List CircuitNode → List String
showSVNodes = Data.List.map showSVNode

localNets : ℕ → List String
localNets 0 = [ "" ]
localNets (suc n) = ("  logic net" ++ show n ++ ";") ∷ localNets n

inputNameList : List String → String
inputNameList (x ∷ xs) = x ++ ", " ++ inputNameList xs
inputNameList [] = ""

outputNameList : List String → String
outputNameList (x1 ∷ x2 ∷ xs) = x1 ++ ", " ++ outputNameList (x2 ∷ xs)
outputNameList (x1 ∷ []) = x1 ++ ");"
outputNameList [] = ""

showPort : String × NetType → String
showPort (name , BitType) = "logic " ++ name
showPort (name , VectorType (suc size)) = "logic [" ++ show size ++ ":0] " ++ name
showPort (name , VectorType zero) = "<BAD VECTOR>"

showPorts : List (String × NetType) → List (String × NetType) → List String
showPorts (p ∷ []) [] = ("  input " ++ showPort p ++ ");") ∷ []
showPorts (p ∷ []) outputPorts = ("  input  " ++ showPort p ++ ",") ∷ showPorts [] outputPorts
showPorts (p ∷ ps) outputPorts = (  "  input  " ++ showPort p ++ ",") ∷ showPorts ps outputPorts
showPorts [] (p ∷ []) = ("  output " ++ showPort p ++ ");") ∷ []
showPorts [] (p ∷ ps) = ("  output " ++ showPort p ++ ",") ∷ showPorts [] ps
showPorts [] [] = []

declareVec : VecType × ℕ → String
declareVec (vecType (suc size) , vecNr) = "  logic [" ++ show size ++ ":0] vec" ++ show vecNr ++ ";"
declareVec (vecType zero , _) = "<BAD VECTOR>"

declareVecs : List (VecType × ℕ) → List String
declareVecs = Data.List.map declareVec

showSVLines : NetlistInfo → List String
showSVLines netlist
  = ("module " ++  circuitName netlist ++ "(") ∷
    showPorts (Data.List.reverse (inputPorts netlist))
              (Data.List.reverse (outputPorts netlist)) Data.List.++
    (localNets (netCount netlist)) Data.List.++
    (declareVecs (Data.List.reverse (vecDefs netlist))) Data.List.++
    (showSVNodes (nodes netlist)) Data.List.++
    [ "endmodule: " ++ circuitName netlist ]

netlistToSystemVerilog : NetlistInfo → String
netlistToSystemVerilog = unlines ∘ showSVLines

circuitToSystemVerilog :  NetlistState ⊤ → String
circuitToSystemVerilog =  unlines ∘ showSVLines ∘ makeNetlist
