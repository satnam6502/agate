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

module MAlonzo.Code.Data.Fin.Literals where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.FromNat
import qualified MAlonzo.Code.Data.Fin

-- Data.Fin.Literals.number
d_number_8 ::
  Integer -> MAlonzo.Code.Agda.Builtin.FromNat.T_Number_10
d_number_8 ~v0 = du_number_8
du_number_8 :: MAlonzo.Code.Agda.Builtin.FromNat.T_Number_10
du_number_8
  = coe
      MAlonzo.Code.Agda.Builtin.FromNat.C_Number'46'constructor_55
      (\ v0 v1 -> coe MAlonzo.Code.Data.Fin.du_'35'__10 (coe v0))
