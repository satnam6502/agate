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

module MAlonzo.Code.Examples where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.AgateClass
import qualified MAlonzo.Code.Agda.Builtin.Equality
import qualified MAlonzo.Code.Agda.Builtin.FromNat
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Agda.Builtin.String
import qualified MAlonzo.Code.Agda.Builtin.Unit
import qualified MAlonzo.Code.BitVec
import qualified MAlonzo.Code.Data.Fin.Literals
import qualified MAlonzo.Code.Data.Nat.Literals
import qualified MAlonzo.Code.Data.Vec.Base
import qualified MAlonzo.Code.Effect.Applicative
import qualified MAlonzo.Code.Effect.Monad
import qualified MAlonzo.Code.Effect.Monad.Identity.Instances
import qualified MAlonzo.Code.Effect.Monad.State.Instances
import qualified MAlonzo.Code.Effect.Monad.State.Transformer
import qualified MAlonzo.Code.Effect.Monad.State.Transformer.Base
import qualified MAlonzo.Code.Netlist
import qualified MAlonzo.Code.SystemVerilog

-- Examples.finLiterals
d_finLiterals_2 ::
  Integer -> MAlonzo.Code.Agda.Builtin.FromNat.T_Number_10
d_finLiterals_2 ~v0 = du_finLiterals_2
du_finLiterals_2 :: MAlonzo.Code.Agda.Builtin.FromNat.T_Number_10
du_finLiterals_2 = coe MAlonzo.Code.Data.Fin.Literals.du_number_8
-- Examples.natLiterals
d_natLiterals_6 :: MAlonzo.Code.Agda.Builtin.FromNat.T_Number_10
d_natLiterals_6 = coe MAlonzo.Code.Data.Nat.Literals.d_number_6
-- Examples.nandGate
d_nandGate_78 ::
  (() -> ()) ->
  () ->
  MAlonzo.Code.Effect.Monad.T_RawMonad_24 ->
  MAlonzo.Code.AgateClass.T_Agate_8 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14 -> AgdaAny
d_nandGate_78 ~v0 ~v1 v2 v3 = du_nandGate_78 v2 v3
du_nandGate_78 ::
  MAlonzo.Code.Effect.Monad.T_RawMonad_24 ->
  MAlonzo.Code.AgateClass.T_Agate_8 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14 -> AgdaAny
du_nandGate_78 v0 v1
  = coe
      MAlonzo.Code.Effect.Monad.du__'62''61''62'__80 (coe v0)
      (coe MAlonzo.Code.AgateClass.d_and2_38 (coe v1))
      (coe MAlonzo.Code.AgateClass.d_inv_36 (coe v1))
-- Examples.nandGateCorrect
d_nandGateCorrect_86 ::
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_nandGateCorrect_86 = erased
-- Examples.nandGateTop
d_nandGateTop_88 ::
  MAlonzo.Code.Effect.Monad.State.Transformer.Base.T_StateT_56
d_nandGateTop_88
  = coe
      MAlonzo.Code.Effect.Monad.du__'62''62'__70
      (coe
         MAlonzo.Code.Effect.Monad.State.Transformer.du_monad_238
         (coe
            MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
            ()))
      (MAlonzo.Code.Netlist.d_setCircuitName_144
         (coe ("nandGate" :: Data.Text.Text)))
      (coe
         MAlonzo.Code.Effect.Monad.State.Transformer.Base.C_mkStateT_68
         (coe
            (\ v0 ->
               coe
                 MAlonzo.Code.Effect.Monad.d__'62''62''61'__34
                 (coe
                    MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12 ())
                 erased erased
                 (coe
                    MAlonzo.Code.Effect.Monad.State.Transformer.Base.d_runStateT_66
                    (MAlonzo.Code.Netlist.d_inputBit_192
                       (coe ("i1" :: Data.Text.Text)))
                    v0)
                 (\ v1 ->
                    case coe v1 of
                      MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v2 v3
                        -> coe
                             MAlonzo.Code.Effect.Monad.State.Transformer.Base.d_runStateT_66
                             (coe
                                MAlonzo.Code.Effect.Monad.d__'62''62''61'__34
                                (coe
                                   MAlonzo.Code.Effect.Monad.State.Instances.du_stateTMonad_80
                                   (coe
                                      MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                                      ()))
                                erased erased
                                (MAlonzo.Code.Netlist.d_inputBit_192
                                   (coe ("i2" :: Data.Text.Text)))
                                (\ v4 ->
                                   coe
                                     MAlonzo.Code.Effect.Monad.d__'62''62''61'__34
                                     (coe
                                        MAlonzo.Code.Effect.Monad.State.Instances.du_stateTMonad_80
                                        (coe
                                           MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                                           ()))
                                     erased erased
                                     (coe
                                        du_nandGate_78
                                        (coe
                                           MAlonzo.Code.Effect.Monad.State.Transformer.du_monad_238
                                           (coe
                                              MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                                              ()))
                                        MAlonzo.Code.Netlist.d_NetlistAgate_314
                                        (coe
                                           MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v3)
                                           (coe v4)))
                                     (MAlonzo.Code.Netlist.d_outputBit_216
                                        (coe ("o" :: Data.Text.Text)))))
                             v2
                      _ -> MAlonzo.RTE.mazUnreachableError))))
-- Examples.nandGateSV
d_nandGateSV_96 :: MAlonzo.Code.Agda.Builtin.String.T_String_6
d_nandGateSV_96
  = coe
      MAlonzo.Code.SystemVerilog.d_circuitToSystemVerilog_248
      (coe d_nandGateTop_88)
-- Examples.norGate
d_norGate_106 ::
  (() -> ()) ->
  () ->
  MAlonzo.Code.Effect.Monad.T_RawMonad_24 ->
  MAlonzo.Code.AgateClass.T_Agate_8 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14 -> AgdaAny
d_norGate_106 ~v0 ~v1 v2 v3 v4 = du_norGate_106 v2 v3 v4
du_norGate_106 ::
  MAlonzo.Code.Effect.Monad.T_RawMonad_24 ->
  MAlonzo.Code.AgateClass.T_Agate_8 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14 -> AgdaAny
du_norGate_106 v0 v1 v2
  = coe
      seq (coe v2)
      (coe
         MAlonzo.Code.Effect.Monad.d__'62''62''61'__34 v0 erased erased
         (coe MAlonzo.Code.AgateClass.d_or2_40 v1 v2)
         (\ v3 ->
            coe
              MAlonzo.Code.Effect.Monad.d__'62''62''61'__34 v0 erased erased
              (coe MAlonzo.Code.AgateClass.d_inv_36 v1 v3)
              (coe
                 MAlonzo.Code.Effect.Applicative.du_return_68
                 (coe MAlonzo.Code.Effect.Monad.d_rawApplicative_32 (coe v0)))))
-- Examples.norGateCorrect
d_norGateCorrect_122 ::
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_norGateCorrect_122 = erased
-- Examples.halfAdder
d_halfAdder_136 ::
  (() -> ()) ->
  () ->
  MAlonzo.Code.Effect.Monad.T_RawMonad_24 ->
  MAlonzo.Code.AgateClass.T_Agate_8 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14 -> AgdaAny
d_halfAdder_136 ~v0 ~v1 v2 v3 v4 = du_halfAdder_136 v2 v3 v4
du_halfAdder_136 ::
  MAlonzo.Code.Effect.Monad.T_RawMonad_24 ->
  MAlonzo.Code.AgateClass.T_Agate_8 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14 -> AgdaAny
du_halfAdder_136 v0 v1 v2
  = coe
      seq (coe v2)
      (coe
         MAlonzo.Code.Effect.Monad.d__'62''62''61'__34 v0 erased erased
         (coe MAlonzo.Code.AgateClass.d_xor2_42 v1 v2)
         (\ v3 ->
            coe
              MAlonzo.Code.Effect.Monad.d__'62''62''61'__34 v0 erased erased
              (coe MAlonzo.Code.AgateClass.d_and2_38 v1 v2)
              (\ v4 ->
                 coe
                   MAlonzo.Code.Effect.Applicative.du_return_68
                   (MAlonzo.Code.Effect.Monad.d_rawApplicative_32 (coe v0))
                   (coe
                      MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v3) (coe v4)))))
-- Examples.halfAdderCorrect
d_halfAdderCorrect_150 ::
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_halfAdderCorrect_150 = erased
-- Examples.fullAdder
d_fullAdder_160 ::
  (() -> ()) ->
  () ->
  MAlonzo.Code.Effect.Monad.T_RawMonad_24 ->
  MAlonzo.Code.AgateClass.T_Agate_8 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14 -> AgdaAny
d_fullAdder_160 ~v0 ~v1 v2 v3 v4 = du_fullAdder_160 v2 v3 v4
du_fullAdder_160 ::
  MAlonzo.Code.Effect.Monad.T_RawMonad_24 ->
  MAlonzo.Code.AgateClass.T_Agate_8 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14 -> AgdaAny
du_fullAdder_160 v0 v1 v2
  = case coe v2 of
      MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v3 v4
        -> case coe v4 of
             MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v5 v6
               -> coe
                    MAlonzo.Code.Effect.Monad.d__'62''62''61'__34 v0 erased erased
                    (coe
                       du_halfAdder_136 (coe v0) (coe v1)
                       (coe
                          MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v3) (coe v5)))
                    (\ v7 ->
                       case coe v7 of
                         MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v8 v9
                           -> coe
                                MAlonzo.Code.Effect.Monad.d__'62''62''61'__34 v0 erased erased
                                (coe
                                   du_halfAdder_136 (coe v0) (coe v1)
                                   (coe
                                      MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v8)
                                      (coe v6)))
                                (\ v10 ->
                                   case coe v10 of
                                     MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v11 v12
                                       -> coe
                                            MAlonzo.Code.Effect.Monad.d__'62''62''61'__34 v0 erased
                                            erased
                                            (coe
                                               MAlonzo.Code.AgateClass.d_or2_40 v1
                                               (coe
                                                  MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                                                  (coe v9) (coe v12)))
                                            (\ v13 ->
                                               coe
                                                 MAlonzo.Code.Effect.Applicative.du_return_68
                                                 (MAlonzo.Code.Effect.Monad.d_rawApplicative_32
                                                    (coe v0))
                                                 (coe
                                                    MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                                                    (coe v11) (coe v13)))
                                     _ -> MAlonzo.RTE.mazUnreachableError)
                         _ -> MAlonzo.RTE.mazUnreachableError)
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
-- Examples.fullAdderCorrect
d_fullAdderCorrect_196 ::
  Bool ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_fullAdderCorrect_196 = erased
-- Examples.adder
d_adder_208 ::
  (() -> ()) ->
  () ->
  Integer ->
  MAlonzo.Code.Effect.Monad.T_RawMonad_24 ->
  MAlonzo.Code.AgateClass.T_Agate_8 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14 -> AgdaAny
d_adder_208 ~v0 ~v1 v2 v3 v4 v5 = du_adder_208 v2 v3 v4 v5
du_adder_208 ::
  Integer ->
  MAlonzo.Code.Effect.Monad.T_RawMonad_24 ->
  MAlonzo.Code.AgateClass.T_Agate_8 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14 -> AgdaAny
du_adder_208 v0 v1 v2 v3
  = case coe v0 of
      0 -> case coe v3 of
             MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v4 v5
               -> case coe v5 of
                    MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v6 v7
                      -> coe
                           seq (coe v6)
                           (coe
                              seq (coe v7)
                              (coe
                                 MAlonzo.Code.Effect.Applicative.du_return_68
                                 (MAlonzo.Code.Effect.Monad.d_rawApplicative_32 (coe v1))
                                 (coe
                                    MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                                    (coe MAlonzo.Code.Data.Vec.Base.C_'91''93'_32) (coe v4))))
                    _ -> MAlonzo.RTE.mazUnreachableError
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> let v4 = subInt (coe v0) (coe (1 :: Integer)) in
           coe
             (case coe v3 of
                MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v5 v6
                  -> case coe v6 of
                       MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v7 v8
                         -> case coe v7 of
                              MAlonzo.Code.Data.Vec.Base.C__'8759'__38 v10 v11
                                -> case coe v8 of
                                     MAlonzo.Code.Data.Vec.Base.C__'8759'__38 v13 v14
                                       -> coe
                                            MAlonzo.Code.Effect.Monad.d__'62''62''61'__34 v1 erased
                                            erased
                                            (coe
                                               du_fullAdder_160 (coe v1) (coe v2)
                                               (coe
                                                  MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                                                  (coe v10)
                                                  (coe
                                                     MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                                                     (coe v13) (coe v5))))
                                            (coe
                                               du_'46'extendedlambda2_224 (coe v4) (coe v1) (coe v2)
                                               (coe v11) (coe v14))
                                     _ -> MAlonzo.RTE.mazUnreachableError
                              _ -> MAlonzo.RTE.mazUnreachableError
                       _ -> MAlonzo.RTE.mazUnreachableError
                _ -> MAlonzo.RTE.mazUnreachableError)
-- Examples..extendedlambda2
d_'46'extendedlambda2_224 ::
  (() -> ()) ->
  () ->
  Integer ->
  MAlonzo.Code.Effect.Monad.T_RawMonad_24 ->
  MAlonzo.Code.AgateClass.T_Agate_8 ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Data.Vec.Base.T_Vec_28 ->
  AgdaAny ->
  MAlonzo.Code.Data.Vec.Base.T_Vec_28 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14 -> AgdaAny
d_'46'extendedlambda2_224 ~v0 ~v1 v2 v3 v4 ~v5 ~v6 v7 ~v8 v9 v10
  = du_'46'extendedlambda2_224 v2 v3 v4 v7 v9 v10
du_'46'extendedlambda2_224 ::
  Integer ->
  MAlonzo.Code.Effect.Monad.T_RawMonad_24 ->
  MAlonzo.Code.AgateClass.T_Agate_8 ->
  MAlonzo.Code.Data.Vec.Base.T_Vec_28 ->
  MAlonzo.Code.Data.Vec.Base.T_Vec_28 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14 -> AgdaAny
du_'46'extendedlambda2_224 v0 v1 v2 v3 v4 v5
  = case coe v5 of
      MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v6 v7
        -> coe
             MAlonzo.Code.Effect.Monad.d__'62''62''61'__34 v1 erased erased
             (coe
                du_adder_208 (coe v0) (coe v1) (coe v2)
                (coe
                   MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v7)
                   (coe
                      MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v3) (coe v4))))
             (\ v8 ->
                case coe v8 of
                  MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v9 v10
                    -> coe
                         MAlonzo.Code.Effect.Applicative.du_return_68
                         (MAlonzo.Code.Effect.Monad.d_rawApplicative_32 (coe v1))
                         (coe
                            MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                            (coe MAlonzo.Code.Data.Vec.Base.C__'8759'__38 v6 v9) (coe v10))
                  _ -> MAlonzo.RTE.mazUnreachableError)
      _ -> MAlonzo.RTE.mazUnreachableError
-- Examples.adder8Top
d_adder8Top_238 ::
  MAlonzo.Code.Effect.Monad.State.Transformer.Base.T_StateT_56
d_adder8Top_238
  = coe
      MAlonzo.Code.Effect.Monad.du__'62''62'__70
      (coe
         MAlonzo.Code.Effect.Monad.State.Transformer.du_monad_238
         (coe
            MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
            ()))
      (MAlonzo.Code.Netlist.d_setCircuitName_144
         (coe ("adder8" :: Data.Text.Text)))
      (coe
         MAlonzo.Code.Effect.Monad.State.Transformer.Base.C_mkStateT_68
         (coe
            (\ v0 ->
               coe
                 MAlonzo.Code.Effect.Monad.d__'62''62''61'__34
                 (coe
                    MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12 ())
                 erased erased
                 (coe
                    MAlonzo.Code.Effect.Monad.State.Transformer.Base.d_runStateT_66
                    (MAlonzo.Code.Netlist.d_inputBit_192
                       (coe ("cin" :: Data.Text.Text)))
                    v0)
                 (\ v1 ->
                    case coe v1 of
                      MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v2 v3
                        -> coe
                             MAlonzo.Code.Effect.Monad.State.Transformer.Base.d_runStateT_66
                             (coe
                                MAlonzo.Code.Effect.Monad.d__'62''62''61'__34
                                (coe
                                   MAlonzo.Code.Effect.Monad.State.Instances.du_stateTMonad_80
                                   (coe
                                      MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                                      ()))
                                erased erased
                                (MAlonzo.Code.Netlist.d_inputVec_202
                                   (coe ("x" :: Data.Text.Text))
                                   (coe
                                      MAlonzo.Code.Agda.Builtin.FromNat.d_fromNat_30
                                      MAlonzo.Code.BitVec.d_natLiterals_6 (8 :: Integer)
                                      (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)))
                                (\ v4 ->
                                   coe
                                     MAlonzo.Code.Effect.Monad.d__'62''62''61'__34
                                     (coe
                                        MAlonzo.Code.Effect.Monad.State.Instances.du_stateTMonad_80
                                        (coe
                                           MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                                           ()))
                                     erased erased
                                     (MAlonzo.Code.Netlist.d_inputVec_202
                                        (coe ("y" :: Data.Text.Text))
                                        (coe
                                           MAlonzo.Code.Agda.Builtin.FromNat.d_fromNat_30
                                           MAlonzo.Code.BitVec.d_natLiterals_6 (8 :: Integer)
                                           (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)))
                                     (\ v5 ->
                                        coe
                                          MAlonzo.Code.Effect.Monad.d__'62''62''61'__34
                                          (coe
                                             MAlonzo.Code.Effect.Monad.State.Instances.du_stateTMonad_80
                                             (coe
                                                MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                                                ()))
                                          erased erased
                                          (coe
                                             du_adder_208
                                             (coe
                                                MAlonzo.Code.Agda.Builtin.FromNat.d_fromNat_30
                                                MAlonzo.Code.BitVec.d_natLiterals_6 (8 :: Integer)
                                                (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8))
                                             (coe
                                                MAlonzo.Code.Effect.Monad.State.Transformer.du_monad_238
                                                (coe
                                                   MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                                                   ()))
                                             (coe MAlonzo.Code.Netlist.d_NetlistAgate_314)
                                             (coe
                                                MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v3)
                                                (coe
                                                   MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                                                   (coe v4) (coe v5))))
                                          (\ v6 ->
                                             case coe v6 of
                                               MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v7 v8
                                                 -> coe
                                                      MAlonzo.Code.Effect.Monad.du__'62''62'__70
                                                      (coe
                                                         MAlonzo.Code.Effect.Monad.State.Instances.du_stateTMonad_80
                                                         (coe
                                                            MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                                                            ()))
                                                      (MAlonzo.Code.Netlist.d_outputVec_226
                                                         (coe
                                                            MAlonzo.Code.Agda.Builtin.FromNat.d_fromNat_30
                                                            MAlonzo.Code.BitVec.d_natLiterals_6
                                                            (8 :: Integer)
                                                            (coe
                                                               MAlonzo.Code.Agda.Builtin.Unit.C_tt_8))
                                                         (coe ("sum" :: Data.Text.Text)) (coe v7))
                                                      (MAlonzo.Code.Netlist.d_outputBit_216
                                                         (coe ("cout" :: Data.Text.Text)) (coe v8))
                                               _ -> MAlonzo.RTE.mazUnreachableError))))
                             v2
                      _ -> MAlonzo.RTE.mazUnreachableError))))
-- Examples.adder8SV
d_adder8SV_252 :: MAlonzo.Code.Agda.Builtin.String.T_String_6
d_adder8SV_252
  = coe
      MAlonzo.Code.SystemVerilog.d_circuitToSystemVerilog_248
      (coe d_adder8Top_238)
-- Examples.adder16Top
d_adder16Top_254 ::
  MAlonzo.Code.Effect.Monad.State.Transformer.Base.T_StateT_56
d_adder16Top_254
  = coe
      MAlonzo.Code.Effect.Monad.du__'62''62'__70
      (coe
         MAlonzo.Code.Effect.Monad.State.Transformer.du_monad_238
         (coe
            MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
            ()))
      (MAlonzo.Code.Netlist.d_setCircuitName_144
         (coe ("adder16" :: Data.Text.Text)))
      (coe
         MAlonzo.Code.Effect.Monad.State.Transformer.Base.C_mkStateT_68
         (coe
            (\ v0 ->
               coe
                 MAlonzo.Code.Effect.Monad.d__'62''62''61'__34
                 (coe
                    MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12 ())
                 erased erased
                 (coe
                    MAlonzo.Code.Effect.Monad.State.Transformer.Base.d_runStateT_66
                    (MAlonzo.Code.Netlist.d_inputVec_202
                       (coe ("x" :: Data.Text.Text)) (coe (16 :: Integer)))
                    v0)
                 (\ v1 ->
                    case coe v1 of
                      MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v2 v3
                        -> coe
                             MAlonzo.Code.Effect.Monad.State.Transformer.Base.d_runStateT_66
                             (coe
                                MAlonzo.Code.Effect.Monad.d__'62''62''61'__34
                                (coe
                                   MAlonzo.Code.Effect.Monad.State.Instances.du_stateTMonad_80
                                   (coe
                                      MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                                      ()))
                                erased erased
                                (MAlonzo.Code.Netlist.d_inputVec_202
                                   (coe ("y" :: Data.Text.Text))
                                   (coe
                                      MAlonzo.Code.Agda.Builtin.FromNat.d_fromNat_30
                                      MAlonzo.Code.BitVec.d_natLiterals_6 (16 :: Integer)
                                      (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)))
                                (\ v4 ->
                                   coe
                                     MAlonzo.Code.Effect.Monad.d__'62''62''61'__34
                                     (coe
                                        MAlonzo.Code.Effect.Monad.State.Instances.du_stateTMonad_80
                                        (coe
                                           MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                                           ()))
                                     erased erased
                                     (MAlonzo.Code.Netlist.d_addNL_264
                                        (coe
                                           MAlonzo.Code.Agda.Builtin.FromNat.d_fromNat_30
                                           MAlonzo.Code.BitVec.d_natLiterals_6 (16 :: Integer)
                                           (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8))
                                        (coe
                                           MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v3)
                                           (coe v4)))
                                     (MAlonzo.Code.Netlist.d_outputVec_226
                                        (coe
                                           addInt (coe (1 :: Integer))
                                           (coe
                                              MAlonzo.Code.Agda.Builtin.FromNat.d_fromNat_30
                                              MAlonzo.Code.BitVec.d_natLiterals_6 (16 :: Integer)
                                              (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)))
                                        (coe ("sum" :: Data.Text.Text)))))
                             v2
                      _ -> MAlonzo.RTE.mazUnreachableError))))
-- Examples.adder16SV
d_adder16SV_262 :: MAlonzo.Code.Agda.Builtin.String.T_String_6
d_adder16SV_262
  = coe
      MAlonzo.Code.SystemVerilog.d_circuitToSystemVerilog_248
      (coe d_adder16Top_254)
-- Examples.twoSorter
d_twoSorter_274 ::
  (() -> ()) ->
  () ->
  Integer ->
  MAlonzo.Code.Effect.Monad.T_RawMonad_24 ->
  MAlonzo.Code.AgateClass.T_Agate_8 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14 -> AgdaAny
d_twoSorter_274 ~v0 ~v1 v2 v3 v4 v5 = du_twoSorter_274 v2 v3 v4 v5
du_twoSorter_274 ::
  Integer ->
  MAlonzo.Code.Effect.Monad.T_RawMonad_24 ->
  MAlonzo.Code.AgateClass.T_Agate_8 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14 -> AgdaAny
du_twoSorter_274 v0 v1 v2 v3
  = case coe v3 of
      MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v4 v5
        -> coe
             MAlonzo.Code.Effect.Monad.d__'62''62''61'__34 v1 erased erased
             (coe MAlonzo.Code.AgateClass.d_lessThan_50 v2 v0 v3)
             (\ v6 ->
                coe
                  MAlonzo.Code.Effect.Monad.d__'62''62''61'__34 v1 erased erased
                  (coe
                     MAlonzo.Code.AgateClass.d_mux_54 v2 v0
                     (coe
                        MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v6) (coe v3)))
                  (\ v7 ->
                     coe
                       MAlonzo.Code.Effect.Monad.d__'62''62''61'__34 v1 erased erased
                       (coe
                          MAlonzo.Code.AgateClass.d_mux_54 v2 v0
                          (coe
                             MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v6)
                             (coe
                                MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v5) (coe v4))))
                       (\ v8 ->
                          coe
                            MAlonzo.Code.Effect.Applicative.du_return_68
                            (MAlonzo.Code.Effect.Monad.d_rawApplicative_32 (coe v1))
                            (coe
                               MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v7) (coe v8)))))
      _ -> MAlonzo.RTE.mazUnreachableError
-- Examples.twoSorterCorrect
d_twoSorterCorrect_294 ::
  Integer ->
  MAlonzo.Code.Data.Vec.Base.T_Vec_28 ->
  MAlonzo.Code.Data.Vec.Base.T_Vec_28 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_twoSorterCorrect_294 = erased
-- Examples.twoSorter8
d_twoSorter8_326 ::
  (() -> ()) ->
  () ->
  MAlonzo.Code.Effect.Monad.T_RawMonad_24 ->
  MAlonzo.Code.AgateClass.T_Agate_8 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14 -> AgdaAny
d_twoSorter8_326 ~v0 ~v1 v2 v3 = du_twoSorter8_326 v2 v3
du_twoSorter8_326 ::
  MAlonzo.Code.Effect.Monad.T_RawMonad_24 ->
  MAlonzo.Code.AgateClass.T_Agate_8 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14 -> AgdaAny
du_twoSorter8_326 v0 v1
  = coe du_twoSorter_274 (coe (8 :: Integer)) (coe v0) (coe v1)
-- Examples.twoSorter8Top
d_twoSorter8Top_332 ::
  MAlonzo.Code.Effect.Monad.State.Transformer.Base.T_StateT_56
d_twoSorter8Top_332
  = coe
      MAlonzo.Code.Effect.Monad.du__'62''62'__70
      (coe
         MAlonzo.Code.Effect.Monad.State.Transformer.du_monad_238
         (coe
            MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
            ()))
      (MAlonzo.Code.Netlist.d_setCircuitName_144
         (coe ("twoSorter8" :: Data.Text.Text)))
      (coe
         MAlonzo.Code.Effect.Monad.State.Transformer.Base.C_mkStateT_68
         (coe
            (\ v0 ->
               coe
                 MAlonzo.Code.Effect.Monad.d__'62''62''61'__34
                 (coe
                    MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12 ())
                 erased erased
                 (coe
                    MAlonzo.Code.Effect.Monad.State.Transformer.Base.d_runStateT_66
                    (MAlonzo.Code.Netlist.d_inputVec_202
                       (coe ("x" :: Data.Text.Text)) (coe (8 :: Integer)))
                    v0)
                 (\ v1 ->
                    case coe v1 of
                      MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v2 v3
                        -> coe
                             MAlonzo.Code.Effect.Monad.State.Transformer.Base.d_runStateT_66
                             (coe
                                MAlonzo.Code.Effect.Monad.d__'62''62''61'__34
                                (coe
                                   MAlonzo.Code.Effect.Monad.State.Instances.du_stateTMonad_80
                                   (coe
                                      MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                                      ()))
                                erased erased
                                (MAlonzo.Code.Netlist.d_inputVec_202
                                   (coe ("y" :: Data.Text.Text))
                                   (coe
                                      MAlonzo.Code.Agda.Builtin.FromNat.d_fromNat_30
                                      MAlonzo.Code.BitVec.d_natLiterals_6 (8 :: Integer)
                                      (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)))
                                (\ v4 ->
                                   coe
                                     MAlonzo.Code.Effect.Monad.State.Transformer.Base.C_mkStateT_68
                                     (coe
                                        (\ v5 ->
                                           coe
                                             MAlonzo.Code.Effect.Monad.d__'62''62''61'__34
                                             (coe
                                                MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                                                ())
                                             erased erased
                                             (coe
                                                MAlonzo.Code.Effect.Monad.State.Transformer.Base.d_runStateT_66
                                                (coe
                                                   du_twoSorter8_326
                                                   (coe
                                                      MAlonzo.Code.Effect.Monad.State.Transformer.du_monad_238
                                                      (coe
                                                         MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                                                         ()))
                                                   MAlonzo.Code.Netlist.d_NetlistAgate_314
                                                   (coe
                                                      MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                                                      (coe v3) (coe v4)))
                                                v5)
                                             (\ v6 ->
                                                case coe v6 of
                                                  MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v7 v8
                                                    -> coe
                                                         MAlonzo.Code.Effect.Monad.State.Transformer.Base.d_runStateT_66
                                                         (case coe v8 of
                                                            MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v9 v10
                                                              -> coe
                                                                   MAlonzo.Code.Effect.Monad.du__'62''62'__70
                                                                   (coe
                                                                      MAlonzo.Code.Effect.Monad.State.Instances.du_stateTMonad_80
                                                                      (coe
                                                                         MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                                                                         ()))
                                                                   (MAlonzo.Code.Netlist.d_outputVec_226
                                                                      (coe (8 :: Integer))
                                                                      (coe
                                                                         ("lower"
                                                                          ::
                                                                          Data.Text.Text))
                                                                      (coe v9))
                                                                   (MAlonzo.Code.Netlist.d_outputVec_226
                                                                      (coe (8 :: Integer))
                                                                      (coe
                                                                         ("higher"
                                                                          ::
                                                                          Data.Text.Text))
                                                                      (coe v10))
                                                            _ -> MAlonzo.RTE.mazUnreachableError)
                                                         v7
                                                  _ -> MAlonzo.RTE.mazUnreachableError)))))
                             v2
                      _ -> MAlonzo.RTE.mazUnreachableError))))
-- Examples.twoSorter8SV
d_twoSorter8SV_344 :: MAlonzo.Code.Agda.Builtin.String.T_String_6
d_twoSorter8SV_344
  = coe
      MAlonzo.Code.SystemVerilog.d_circuitToSystemVerilog_248
      (coe d_twoSorter8Top_332)
