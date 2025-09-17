{-# LANGUAGE BangPatterns #-}
{-# LANGUAGE EmptyCase #-}
{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE ExistentialQuantification #-}
{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE ScopedTypeVariables #-}

{-# OPTIONS_GHC -Wno-overlapping-patterns #-}

module MAlonzo.Code.Main where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.IO
import qualified MAlonzo.Code.Examples
import qualified MAlonzo.Code.IO.Base
import qualified MAlonzo.Code.IO.Finite
import qualified MAlonzo.Code.Level

main = coe d_main_2
-- Main.main
d_main_2 ::
  MAlonzo.Code.Agda.Builtin.IO.T_IO_8
    AgdaAny MAlonzo.Code.Level.T_Lift_8
d_main_2
  = coe
      MAlonzo.Code.IO.Base.du_run_122 (coe MAlonzo.Code.Level.d_0ℓ_22)
      (coe
         MAlonzo.Code.IO.Base.du__'62''62'__114
         (coe
            MAlonzo.Code.IO.Finite.d_writeFile_12
            (coe MAlonzo.Code.Level.d_0ℓ_22)
            (coe ("nandGate.sv" :: Data.Text.Text))
            (coe MAlonzo.Code.Examples.d_nandGateSV_96))
         (coe
            MAlonzo.Code.IO.Base.du__'62''62'__114
            (coe
               MAlonzo.Code.IO.Finite.d_putStrLn_28
               (coe MAlonzo.Code.Level.d_0ℓ_22)
               (coe ("Wrote nandGate.sv" :: Data.Text.Text)))
            (coe
               MAlonzo.Code.IO.Base.du__'62''62'__114
               (coe
                  MAlonzo.Code.IO.Finite.d_writeFile_12
                  (coe MAlonzo.Code.Level.d_0ℓ_22)
                  (coe ("adder8.sv" :: Data.Text.Text))
                  (coe MAlonzo.Code.Examples.d_adder8SV_252))
               (coe
                  MAlonzo.Code.IO.Base.du__'62''62'__114
                  (coe
                     MAlonzo.Code.IO.Finite.d_putStrLn_28
                     (coe MAlonzo.Code.Level.d_0ℓ_22)
                     (coe ("Wrote adder8.sv" :: Data.Text.Text)))
                  (coe
                     MAlonzo.Code.IO.Base.du__'62''62'__114
                     (coe
                        MAlonzo.Code.IO.Finite.d_writeFile_12
                        (coe MAlonzo.Code.Level.d_0ℓ_22)
                        (coe ("adder16.sv" :: Data.Text.Text))
                        (coe MAlonzo.Code.Examples.d_adder16SV_262))
                     (coe
                        MAlonzo.Code.IO.Base.du__'62''62'__114
                        (coe
                           MAlonzo.Code.IO.Finite.d_putStrLn_28
                           (coe MAlonzo.Code.Level.d_0ℓ_22)
                           (coe ("Wrote adder16.sv" :: Data.Text.Text)))
                        (coe
                           MAlonzo.Code.IO.Base.du__'62''62'__114
                           (coe
                              MAlonzo.Code.IO.Finite.d_writeFile_12
                              (coe MAlonzo.Code.Level.d_0ℓ_22)
                              (coe ("twoSorter8.sv" :: Data.Text.Text))
                              (coe MAlonzo.Code.Examples.d_twoSorter8SV_344))
                           (coe
                              MAlonzo.Code.IO.Finite.d_putStrLn_28
                              (coe MAlonzo.Code.Level.d_0ℓ_22)
                              (coe ("Wrote twoSorter8.sv" :: Data.Text.Text))))))))))
