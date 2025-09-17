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

module MAlonzo.Code.BitVec where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Bool
import qualified MAlonzo.Code.Agda.Builtin.Equality
import qualified MAlonzo.Code.Agda.Builtin.FromNat
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Data.Fin.Base
import qualified MAlonzo.Code.Data.Fin.Literals
import qualified MAlonzo.Code.Data.Nat.Base
import qualified MAlonzo.Code.Data.Nat.Literals
import qualified MAlonzo.Code.Data.Vec.Base

-- BitVec.finLiterals
d_finLiterals_2 ::
  Integer -> MAlonzo.Code.Agda.Builtin.FromNat.T_Number_10
d_finLiterals_2 ~v0 = du_finLiterals_2
du_finLiterals_2 :: MAlonzo.Code.Agda.Builtin.FromNat.T_Number_10
du_finLiterals_2 = coe MAlonzo.Code.Data.Fin.Literals.du_number_8
-- BitVec.natLiterals
d_natLiterals_6 :: MAlonzo.Code.Agda.Builtin.FromNat.T_Number_10
d_natLiterals_6 = coe MAlonzo.Code.Data.Nat.Literals.d_number_6
-- BitVec.fromBit
d_fromBit_8 :: Bool -> Integer
d_fromBit_8 v0
  = if coe v0 then coe (1 :: Integer) else coe (0 :: Integer)
-- BitVec.toBit
d_toBit_10 :: MAlonzo.Code.Data.Fin.Base.T_Fin_10 -> Bool
d_toBit_10 v0
  = case coe v0 of
      MAlonzo.Code.Data.Fin.Base.C_zero_12
        -> coe MAlonzo.Code.Agda.Builtin.Bool.C_false_8
      MAlonzo.Code.Data.Fin.Base.C_suc_16 v2
        -> coe seq (coe v2) (coe MAlonzo.Code.Agda.Builtin.Bool.C_true_10)
      _ -> MAlonzo.RTE.mazUnreachableError
-- BitVec.reshapeForQuotRemProof
d_reshapeForQuotRemProof_14 ::
  Integer -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_reshapeForQuotRemProof_14 = erased
-- BitVec.reshapeForQuotRem
d_reshapeForQuotRem_20 ::
  Integer ->
  MAlonzo.Code.Data.Fin.Base.T_Fin_10 ->
  MAlonzo.Code.Data.Fin.Base.T_Fin_10
d_reshapeForQuotRem_20 v0
  = coe
      MAlonzo.Code.Data.Fin.Base.du_cast_26
      (coe
         MAlonzo.Code.Data.Nat.Base.d__'94'__272 (coe (2 :: Integer))
         (coe addInt (coe (1 :: Integer)) (coe v0)))
-- BitVec.toBitVec
d_toBitVec_26 ::
  Integer ->
  MAlonzo.Code.Data.Fin.Base.T_Fin_10 ->
  MAlonzo.Code.Data.Vec.Base.T_Vec_28
d_toBitVec_26 v0 v1
  = case coe v0 of
      0 -> coe MAlonzo.Code.Data.Vec.Base.C_'91''93'_32
      _ -> let v2 = subInt (coe v0) (coe (1 :: Integer)) in
           coe
             (coe
                MAlonzo.Code.Data.Vec.Base.C__'8759'__38
                (d_toBit_10
                   (coe
                      MAlonzo.Code.Agda.Builtin.Sigma.d_fst_28
                      (coe
                         MAlonzo.Code.Data.Fin.Base.du_quotRem_178 (coe (2 :: Integer))
                         (coe d_reshapeForQuotRem_20 v2 v1))))
                (d_toBitVec_26
                   (coe v2)
                   (coe
                      MAlonzo.Code.Agda.Builtin.Sigma.d_snd_30
                      (coe
                         MAlonzo.Code.Data.Fin.Base.du_quotRem_178 (coe (2 :: Integer))
                         (coe d_reshapeForQuotRem_20 v2 v1)))))
-- BitVec.fromBitVec
d_fromBitVec_40 ::
  Integer -> MAlonzo.Code.Data.Vec.Base.T_Vec_28 -> Integer
d_fromBitVec_40 ~v0 v1 = du_fromBitVec_40 v1
du_fromBitVec_40 :: MAlonzo.Code.Data.Vec.Base.T_Vec_28 -> Integer
du_fromBitVec_40 v0
  = case coe v0 of
      MAlonzo.Code.Data.Vec.Base.C_'91''93'_32 -> coe (0 :: Integer)
      MAlonzo.Code.Data.Vec.Base.C__'8759'__38 v2 v3
        -> coe
             addInt (coe d_fromBit_8 (coe v2))
             (coe mulInt (coe (2 :: Integer)) (coe du_fromBitVec_40 (coe v3)))
      _ -> MAlonzo.RTE.mazUnreachableError
-- BitVec.toBitAlt
d_toBitAlt_50 :: Integer -> Bool
d_toBitAlt_50 v0
  = let v1 = coe MAlonzo.Code.Agda.Builtin.Bool.C_true_10 in
    coe
      (case coe v0 of
         0 -> coe MAlonzo.Code.Agda.Builtin.Bool.C_false_8
         _ -> coe v1)
-- BitVec.toBitVecAlt
d_toBitVecAlt_54 ::
  Integer -> Integer -> MAlonzo.Code.Data.Vec.Base.T_Vec_28
d_toBitVecAlt_54 v0 v1
  = case coe v0 of
      0 -> coe MAlonzo.Code.Data.Vec.Base.C_'91''93'_32
      _ -> let v2 = subInt (coe v0) (coe (1 :: Integer)) in
           coe
             (coe
                MAlonzo.Code.Data.Vec.Base.C__'8759'__38
                (d_toBitAlt_50
                   (coe
                      MAlonzo.Code.Data.Nat.Base.du__'37'__326 (coe v1)
                      (coe (2 :: Integer))))
                (d_toBitVecAlt_54
                   (coe v2)
                   (coe
                      MAlonzo.Code.Data.Nat.Base.du__'47'__314 (coe v1)
                      (coe (2 :: Integer)))))
-- BitVec.toFromBit
d_toFromBit_62 ::
  Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_toFromBit_62 = erased
-- BitVec.lessThanNat
d_lessThanNat_64 :: Integer -> Integer -> Bool
d_lessThanNat_64 v0 v1
  = let v2
          = MAlonzo.Code.Data.Nat.Base.d_compare_460 (coe v0) (coe v1) in
    coe
      (case coe v2 of
         MAlonzo.Code.Data.Nat.Base.C_less_444 v4
           -> coe MAlonzo.Code.Agda.Builtin.Bool.C_true_10
         _ -> coe MAlonzo.Code.Agda.Builtin.Bool.C_false_8)
-- BitVec.lessThanFin
d_lessThanFin_84 ::
  Integer ->
  MAlonzo.Code.Data.Fin.Base.T_Fin_10 ->
  MAlonzo.Code.Data.Fin.Base.T_Fin_10 -> Bool
d_lessThanFin_84 ~v0 v1 v2 = du_lessThanFin_84 v1 v2
du_lessThanFin_84 ::
  MAlonzo.Code.Data.Fin.Base.T_Fin_10 ->
  MAlonzo.Code.Data.Fin.Base.T_Fin_10 -> Bool
du_lessThanFin_84 v0 v1
  = let v2
          = coe
              MAlonzo.Code.Data.Fin.Base.du_compare_470 (coe v0) (coe v1) in
    coe
      (case coe v2 of
         MAlonzo.Code.Data.Fin.Base.C_less_454 v4
           -> coe MAlonzo.Code.Agda.Builtin.Bool.C_true_10
         _ -> coe MAlonzo.Code.Agda.Builtin.Bool.C_false_8)
-- BitVec.bitVecLessThan
d_bitVecLessThan_106 ::
  Integer ->
  MAlonzo.Code.Data.Vec.Base.T_Vec_28 ->
  MAlonzo.Code.Data.Vec.Base.T_Vec_28 -> Bool
d_bitVecLessThan_106 ~v0 v1 v2 = du_bitVecLessThan_106 v1 v2
du_bitVecLessThan_106 ::
  MAlonzo.Code.Data.Vec.Base.T_Vec_28 ->
  MAlonzo.Code.Data.Vec.Base.T_Vec_28 -> Bool
du_bitVecLessThan_106 v0 v1
  = coe
      d_lessThanNat_64 (coe du_fromBitVec_40 (coe v0))
      (coe du_fromBitVec_40 (coe v1))
-- BitVec.muxBits
d_muxBits_114 ::
  Integer ->
  Bool ->
  MAlonzo.Code.Data.Vec.Base.T_Vec_28 ->
  MAlonzo.Code.Data.Vec.Base.T_Vec_28 ->
  MAlonzo.Code.Data.Vec.Base.T_Vec_28
d_muxBits_114 ~v0 v1 v2 v3 = du_muxBits_114 v1 v2 v3
du_muxBits_114 ::
  Bool ->
  MAlonzo.Code.Data.Vec.Base.T_Vec_28 ->
  MAlonzo.Code.Data.Vec.Base.T_Vec_28 ->
  MAlonzo.Code.Data.Vec.Base.T_Vec_28
du_muxBits_114 v0 v1 v2 = if coe v0 then coe v1 else coe v2
