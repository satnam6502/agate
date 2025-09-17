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

module MAlonzo.Code.Combinational where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.AgateClass
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.BitVec
import qualified MAlonzo.Code.Data.Bool.Base
import qualified MAlonzo.Code.Effect.Monad
import qualified MAlonzo.Code.Effect.Monad.Identity

-- Combinational.MonadIdentity
d_MonadIdentity_54 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Effect.Monad.T_RawMonad_24
d_MonadIdentity_54 v0
  = coe MAlonzo.Code.Effect.Monad.Identity.du_monad_36
-- Combinational.SimAgate
d_SimAgate_56 :: MAlonzo.Code.AgateClass.T_Agate_8
d_SimAgate_56
  = coe
      MAlonzo.Code.AgateClass.C_Agate'46'constructor_1387
      (coe
         (\ v0 ->
            coe
              MAlonzo.Code.Effect.Monad.Identity.C_mkIdentity_22
              (coe MAlonzo.Code.Data.Bool.Base.d_not_22 (coe v0))))
      (coe
         (\ v0 ->
            coe
              MAlonzo.Code.Effect.Monad.Identity.C_mkIdentity_22
              (coe
                 MAlonzo.Code.Data.Bool.Base.d__'8743'__24
                 (coe MAlonzo.Code.Agda.Builtin.Sigma.d_fst_28 (coe v0))
                 (coe MAlonzo.Code.Agda.Builtin.Sigma.d_snd_30 (coe v0)))))
      (coe
         (\ v0 ->
            coe
              MAlonzo.Code.Effect.Monad.Identity.C_mkIdentity_22
              (coe
                 MAlonzo.Code.Data.Bool.Base.d__'8744'__30
                 (coe MAlonzo.Code.Agda.Builtin.Sigma.d_fst_28 (coe v0))
                 (coe MAlonzo.Code.Agda.Builtin.Sigma.d_snd_30 (coe v0)))))
      (coe
         (\ v0 ->
            coe
              MAlonzo.Code.Effect.Monad.Identity.C_mkIdentity_22
              (coe
                 MAlonzo.Code.Data.Bool.Base.d__xor__36
                 (coe MAlonzo.Code.Agda.Builtin.Sigma.d_fst_28 (coe v0))
                 (coe MAlonzo.Code.Agda.Builtin.Sigma.d_snd_30 (coe v0)))))
      (coe
         (\ v0 v1 ->
            coe
              MAlonzo.Code.Effect.Monad.Identity.C_mkIdentity_22
              (coe
                 MAlonzo.Code.BitVec.d_toBitVecAlt_54
                 (coe addInt (coe (1 :: Integer)) (coe v0))
                 (coe
                    addInt
                    (coe
                       MAlonzo.Code.BitVec.du_fromBitVec_40
                       (coe MAlonzo.Code.Agda.Builtin.Sigma.d_snd_30 (coe v1)))
                    (coe
                       MAlonzo.Code.BitVec.du_fromBitVec_40
                       (coe MAlonzo.Code.Agda.Builtin.Sigma.d_fst_28 (coe v1)))))))
      (coe
         (\ v0 v1 ->
            coe
              MAlonzo.Code.Effect.Monad.Identity.C_mkIdentity_22
              (coe
                 MAlonzo.Code.BitVec.du_bitVecLessThan_106
                 (coe MAlonzo.Code.Agda.Builtin.Sigma.d_fst_28 (coe v1))
                 (coe MAlonzo.Code.Agda.Builtin.Sigma.d_snd_30 (coe v1)))))
      (coe
         (\ v0 v1 ->
            coe
              MAlonzo.Code.Effect.Monad.Identity.C_mkIdentity_22
              (coe
                 MAlonzo.Code.BitVec.du_muxBits_114
                 (coe MAlonzo.Code.Agda.Builtin.Sigma.d_fst_28 (coe v1))
                 (coe
                    MAlonzo.Code.Agda.Builtin.Sigma.d_fst_28
                    (coe MAlonzo.Code.Agda.Builtin.Sigma.d_snd_30 (coe v1)))
                 (coe
                    MAlonzo.Code.Agda.Builtin.Sigma.d_snd_30
                    (coe MAlonzo.Code.Agda.Builtin.Sigma.d_snd_30 (coe v1))))))
