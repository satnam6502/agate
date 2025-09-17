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

module MAlonzo.Code.AgateClass where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Effect.Monad

-- AgateClass.Agate
d_Agate_8 a0 a1 a2 = ()
data T_Agate_8
  = C_Agate'46'constructor_1387 (AgdaAny -> AgdaAny)
                                (MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14 -> AgdaAny)
                                (MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14 -> AgdaAny)
                                (MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14 -> AgdaAny)
                                (Integer -> MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14 -> AgdaAny)
                                (Integer -> MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14 -> AgdaAny)
                                (Integer -> MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14 -> AgdaAny)
-- AgateClass.Agate.inv
d_inv_36 :: T_Agate_8 -> AgdaAny -> AgdaAny
d_inv_36 v0
  = case coe v0 of
      C_Agate'46'constructor_1387 v1 v2 v3 v4 v5 v6 v7 -> coe v1
      _ -> MAlonzo.RTE.mazUnreachableError
-- AgateClass.Agate.and2
d_and2_38 ::
  T_Agate_8 -> MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14 -> AgdaAny
d_and2_38 v0
  = case coe v0 of
      C_Agate'46'constructor_1387 v1 v2 v3 v4 v5 v6 v7 -> coe v2
      _ -> MAlonzo.RTE.mazUnreachableError
-- AgateClass.Agate.or2
d_or2_40 ::
  T_Agate_8 -> MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14 -> AgdaAny
d_or2_40 v0
  = case coe v0 of
      C_Agate'46'constructor_1387 v1 v2 v3 v4 v5 v6 v7 -> coe v3
      _ -> MAlonzo.RTE.mazUnreachableError
-- AgateClass.Agate.xor2
d_xor2_42 ::
  T_Agate_8 -> MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14 -> AgdaAny
d_xor2_42 v0
  = case coe v0 of
      C_Agate'46'constructor_1387 v1 v2 v3 v4 v5 v6 v7 -> coe v4
      _ -> MAlonzo.RTE.mazUnreachableError
-- AgateClass.Agate.add
d_add_46 ::
  T_Agate_8 ->
  Integer -> MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14 -> AgdaAny
d_add_46 v0
  = case coe v0 of
      C_Agate'46'constructor_1387 v1 v2 v3 v4 v5 v6 v7 -> coe v5
      _ -> MAlonzo.RTE.mazUnreachableError
-- AgateClass.Agate.lessThan
d_lessThan_50 ::
  T_Agate_8 ->
  Integer -> MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14 -> AgdaAny
d_lessThan_50 v0
  = case coe v0 of
      C_Agate'46'constructor_1387 v1 v2 v3 v4 v5 v6 v7 -> coe v6
      _ -> MAlonzo.RTE.mazUnreachableError
-- AgateClass.Agate.mux
d_mux_54 ::
  T_Agate_8 ->
  Integer -> MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14 -> AgdaAny
d_mux_54 v0
  = case coe v0 of
      C_Agate'46'constructor_1387 v1 v2 v3 v4 v5 v6 v7 -> coe v7
      _ -> MAlonzo.RTE.mazUnreachableError
-- AgateClass._.add
d_add_58 ::
  T_Agate_8 ->
  Integer -> MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14 -> AgdaAny
d_add_58 v0 = coe d_add_46 (coe v0)
-- AgateClass._.and2
d_and2_60 ::
  T_Agate_8 -> MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14 -> AgdaAny
d_and2_60 v0 = coe d_and2_38 (coe v0)
-- AgateClass._.inv
d_inv_62 :: T_Agate_8 -> AgdaAny -> AgdaAny
d_inv_62 v0 = coe d_inv_36 (coe v0)
-- AgateClass._.lessThan
d_lessThan_64 ::
  T_Agate_8 ->
  Integer -> MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14 -> AgdaAny
d_lessThan_64 v0 = coe d_lessThan_50 (coe v0)
-- AgateClass._.mux
d_mux_66 ::
  T_Agate_8 ->
  Integer -> MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14 -> AgdaAny
d_mux_66 v0 = coe d_mux_54 (coe v0)
-- AgateClass._.or2
d_or2_68 ::
  T_Agate_8 -> MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14 -> AgdaAny
d_or2_68 v0 = coe d_or2_40 (coe v0)
-- AgateClass._.xor2
d_xor2_70 ::
  T_Agate_8 -> MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14 -> AgdaAny
d_xor2_70 v0 = coe d_xor2_42 (coe v0)
