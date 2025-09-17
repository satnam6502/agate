{-# OPTIONS --erasure --guardedness #-}

module Main where

open import IO
open import Examples using (nandGateSV; adder8SV; adder16SV; twoSorter8SV)

main : Main
main = run (do writeFile "nandGate.sv" nandGateSV
               putStrLn "Wrote nandGate.sv"
               writeFile "adder8.sv" adder8SV
               putStrLn "Wrote adder8.sv"
               writeFile "adder16.sv" adder16SV
               putStrLn "Wrote adder16.sv"
               writeFile "twoSorter8.sv" twoSorter8SV
               putStrLn "Wrote twoSorter8.sv"

           )
