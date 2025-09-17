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

module MAlonzo.Code.Netlist where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.AgateClass
import qualified MAlonzo.Code.Agda.Builtin.List
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Agda.Builtin.String
import qualified MAlonzo.Code.Data.Vec.Base
import qualified MAlonzo.Code.Effect.Applicative
import qualified MAlonzo.Code.Effect.Monad
import qualified MAlonzo.Code.Effect.Monad.Identity.Instances
import qualified MAlonzo.Code.Effect.Monad.State
import qualified MAlonzo.Code.Effect.Monad.State.Instances
import qualified MAlonzo.Code.Effect.Monad.State.Transformer
import qualified MAlonzo.Code.Effect.Monad.State.Transformer.Base

-- Netlist.VecType
d_VecType_64 = ()
newtype T_VecType_64 = C_vecType_66 Integer
-- Netlist.Bit
d_Bit_68 = ()
data T_Bit_68
  = C_localNet_70 Integer | C_indexOfVec_72 Integer Integer
-- Netlist.NetType
d_NetType_74 = ()
data T_NetType_74 = C_BitType_76 | C_VectorType_78 Integer
-- Netlist.CircuitNode
d_CircuitNode_80 = ()
data T_CircuitNode_80
  = C_inputBitNode_82 MAlonzo.Code.Agda.Builtin.String.T_String_6
                      T_Bit_68 |
    C_inputVecNode_84 MAlonzo.Code.Agda.Builtin.String.T_String_6
                      Integer |
    C_outputBitNode_86 MAlonzo.Code.Agda.Builtin.String.T_String_6
                       T_Bit_68 |
    C_outputVecNode_90 Integer
                       MAlonzo.Code.Agda.Builtin.String.T_String_6
                       MAlonzo.Code.Data.Vec.Base.T_Vec_28 |
    C_invNode_92 T_Bit_68 T_Bit_68 |
    C_and2Node_94 T_Bit_68 T_Bit_68 T_Bit_68 |
    C_or2Node_96 T_Bit_68 T_Bit_68 T_Bit_68 |
    C_xor2Node_98 T_Bit_68 T_Bit_68 T_Bit_68 |
    C_addNode_102 Integer MAlonzo.Code.Data.Vec.Base.T_Vec_28
                  MAlonzo.Code.Data.Vec.Base.T_Vec_28 Integer |
    C_lessThanNode_106 Integer MAlonzo.Code.Data.Vec.Base.T_Vec_28
                       MAlonzo.Code.Data.Vec.Base.T_Vec_28 T_Bit_68 |
    C_muxNode_110 Integer T_Bit_68 MAlonzo.Code.Data.Vec.Base.T_Vec_28
                  MAlonzo.Code.Data.Vec.Base.T_Vec_28 Integer
-- Netlist.NetlistInfo
d_NetlistInfo_112 = ()
data T_NetlistInfo_112
  = C_NetlistInfo'46'constructor_1371 MAlonzo.Code.Agda.Builtin.String.T_String_6
                                      Integer Integer [MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14]
                                      [MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14]
                                      [MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14] [T_CircuitNode_80]
-- Netlist.NetlistInfo.circuitName
d_circuitName_128 ::
  T_NetlistInfo_112 -> MAlonzo.Code.Agda.Builtin.String.T_String_6
d_circuitName_128 v0
  = case coe v0 of
      C_NetlistInfo'46'constructor_1371 v1 v2 v3 v4 v5 v6 v7 -> coe v1
      _ -> MAlonzo.RTE.mazUnreachableError
-- Netlist.NetlistInfo.netCount
d_netCount_130 :: T_NetlistInfo_112 -> Integer
d_netCount_130 v0
  = case coe v0 of
      C_NetlistInfo'46'constructor_1371 v1 v2 v3 v4 v5 v6 v7 -> coe v2
      _ -> MAlonzo.RTE.mazUnreachableError
-- Netlist.NetlistInfo.vecCount
d_vecCount_132 :: T_NetlistInfo_112 -> Integer
d_vecCount_132 v0
  = case coe v0 of
      C_NetlistInfo'46'constructor_1371 v1 v2 v3 v4 v5 v6 v7 -> coe v3
      _ -> MAlonzo.RTE.mazUnreachableError
-- Netlist.NetlistInfo.vecDefs
d_vecDefs_134 ::
  T_NetlistInfo_112 -> [MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14]
d_vecDefs_134 v0
  = case coe v0 of
      C_NetlistInfo'46'constructor_1371 v1 v2 v3 v4 v5 v6 v7 -> coe v4
      _ -> MAlonzo.RTE.mazUnreachableError
-- Netlist.NetlistInfo.inputPorts
d_inputPorts_136 ::
  T_NetlistInfo_112 -> [MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14]
d_inputPorts_136 v0
  = case coe v0 of
      C_NetlistInfo'46'constructor_1371 v1 v2 v3 v4 v5 v6 v7 -> coe v5
      _ -> MAlonzo.RTE.mazUnreachableError
-- Netlist.NetlistInfo.outputPorts
d_outputPorts_138 ::
  T_NetlistInfo_112 -> [MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14]
d_outputPorts_138 v0
  = case coe v0 of
      C_NetlistInfo'46'constructor_1371 v1 v2 v3 v4 v5 v6 v7 -> coe v6
      _ -> MAlonzo.RTE.mazUnreachableError
-- Netlist.NetlistInfo.nodes
d_nodes_140 :: T_NetlistInfo_112 -> [T_CircuitNode_80]
d_nodes_140 v0
  = case coe v0 of
      C_NetlistInfo'46'constructor_1371 v1 v2 v3 v4 v5 v6 v7 -> coe v7
      _ -> MAlonzo.RTE.mazUnreachableError
-- Netlist.NetlistState
d_NetlistState_142 :: () -> ()
d_NetlistState_142 = erased
-- Netlist.setCircuitName
d_setCircuitName_144 ::
  MAlonzo.Code.Agda.Builtin.String.T_String_6 ->
  MAlonzo.Code.Effect.Monad.State.Transformer.Base.T_StateT_56
d_setCircuitName_144 v0
  = coe
      MAlonzo.Code.Effect.Monad.State.Transformer.Base.C_mkStateT_68
      (coe
         (\ v1 ->
            coe
              MAlonzo.Code.Effect.Monad.d__'62''62''61'__34
              (coe
                 MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12 ())
              erased erased
              (coe
                 MAlonzo.Code.Effect.Monad.State.Transformer.Base.d_runStateT_66
                 (coe
                    MAlonzo.Code.Effect.Monad.State.Transformer.Base.du_get_44
                    (coe
                       MAlonzo.Code.Effect.Monad.State.Transformer.du_monadState_460
                       (coe
                          MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                          ())))
                 v1)
              (\ v2 ->
                 case coe v2 of
                   MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v3 v4
                     -> coe
                          MAlonzo.Code.Effect.Monad.State.Transformer.Base.d_runStateT_66
                          (coe
                             MAlonzo.Code.Effect.Monad.State.Transformer.Base.du_put_42
                             (coe
                                MAlonzo.Code.Effect.Monad.State.Instances.du_stateTMonadState_128
                                (coe
                                   MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                                   ()))
                             (coe
                                C_NetlistInfo'46'constructor_1371 (coe v0)
                                (coe d_netCount_130 (coe v4)) (coe d_vecCount_132 (coe v4))
                                (coe d_vecDefs_134 (coe v4)) (coe d_inputPorts_136 (coe v4))
                                (coe d_outputPorts_138 (coe v4)) (coe d_nodes_140 (coe v4))))
                          v3
                   _ -> MAlonzo.RTE.mazUnreachableError)))
-- Netlist.mkNewBitNet
d_mkNewBitNet_150 ::
  MAlonzo.Code.Effect.Monad.State.Transformer.Base.T_StateT_56
d_mkNewBitNet_150
  = coe
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
                 (coe
                    MAlonzo.Code.Effect.Monad.State.Transformer.Base.du_get_44
                    (coe
                       MAlonzo.Code.Effect.Monad.State.Transformer.du_monadState_460
                       (coe
                          MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                          ())))
                 v0)
              (\ v1 ->
                 case coe v1 of
                   MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v2 v3
                     -> coe
                          MAlonzo.Code.Effect.Monad.State.Transformer.Base.d_runStateT_66
                          (coe
                             MAlonzo.Code.Effect.Monad.du__'62''62'__70
                             (coe
                                MAlonzo.Code.Effect.Monad.State.Transformer.du_monad_238
                                (coe
                                   MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                                   ()))
                             (coe
                                MAlonzo.Code.Effect.Monad.State.Transformer.Base.du_put_42
                                (coe
                                   MAlonzo.Code.Effect.Monad.State.Transformer.du_monadState_460
                                   (coe
                                      MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                                      ()))
                                (coe
                                   C_NetlistInfo'46'constructor_1371
                                   (coe d_circuitName_128 (coe v3))
                                   (coe addInt (coe (1 :: Integer)) (coe d_netCount_130 (coe v3)))
                                   (coe d_vecCount_132 (coe v3)) (coe d_vecDefs_134 (coe v3))
                                   (coe d_inputPorts_136 (coe v3)) (coe d_outputPorts_138 (coe v3))
                                   (coe d_nodes_140 (coe v3))))
                             (let v4
                                    = coe
                                        MAlonzo.Code.Effect.Monad.State.Transformer.du_monad_238
                                        (coe
                                           MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                                           ()) in
                              coe
                                (coe
                                   MAlonzo.Code.Effect.Applicative.du_return_68
                                   (MAlonzo.Code.Effect.Monad.d_rawApplicative_32 (coe v4))
                                   (coe C_localNet_70 (coe d_netCount_130 (coe v3))))))
                          v2
                   _ -> MAlonzo.RTE.mazUnreachableError)))
-- Netlist.explode'
d_explode''_160 ::
  Integer -> Integer -> MAlonzo.Code.Data.Vec.Base.T_Vec_28
d_explode''_160 v0 v1
  = case coe v1 of
      0 -> coe MAlonzo.Code.Data.Vec.Base.C_'91''93'_32
      _ -> let v2 = subInt (coe v1) (coe (1 :: Integer)) in
           coe
             (coe
                MAlonzo.Code.Data.Vec.Base.C__'8759'__38
                (coe C_indexOfVec_72 (coe v0) (coe v2))
                (d_explode''_160 (coe v0) (coe v2)))
-- Netlist.explode
d_explode_172 ::
  Integer -> Integer -> MAlonzo.Code.Data.Vec.Base.T_Vec_28
d_explode_172 v0 v1
  = coe
      MAlonzo.Code.Data.Vec.Base.du_reverse_616
      (d_explode''_160 (coe v0) (coe v1))
-- Netlist.mkNewVecNet
d_mkNewVecNet_180 ::
  Integer ->
  MAlonzo.Code.Effect.Monad.State.Transformer.Base.T_StateT_56
d_mkNewVecNet_180 v0
  = coe
      MAlonzo.Code.Effect.Monad.State.Transformer.Base.C_mkStateT_68
      (coe
         (\ v1 ->
            coe
              MAlonzo.Code.Effect.Monad.d__'62''62''61'__34
              (coe
                 MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12 ())
              erased erased
              (coe
                 MAlonzo.Code.Effect.Monad.State.Transformer.Base.d_runStateT_66
                 (coe
                    MAlonzo.Code.Effect.Monad.State.Transformer.Base.du_get_44
                    (coe
                       MAlonzo.Code.Effect.Monad.State.Transformer.du_monadState_460
                       (coe
                          MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                          ())))
                 v1)
              (\ v2 ->
                 case coe v2 of
                   MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v3 v4
                     -> coe
                          MAlonzo.Code.Effect.Monad.State.Transformer.Base.d_runStateT_66
                          (coe
                             MAlonzo.Code.Effect.Monad.du__'62''62'__70
                             (coe
                                MAlonzo.Code.Effect.Monad.State.Transformer.du_monad_238
                                (coe
                                   MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                                   ()))
                             (coe
                                MAlonzo.Code.Effect.Monad.State.Transformer.Base.du_put_42
                                (coe
                                   MAlonzo.Code.Effect.Monad.State.Transformer.du_monadState_460
                                   (coe
                                      MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                                      ()))
                                (coe
                                   C_NetlistInfo'46'constructor_1371
                                   (coe d_circuitName_128 (coe v4)) (coe d_netCount_130 (coe v4))
                                   (coe addInt (coe (1 :: Integer)) (coe d_vecCount_132 (coe v4)))
                                   (coe
                                      MAlonzo.Code.Agda.Builtin.List.C__'8759'__22
                                      (coe
                                         MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                                         (coe C_vecType_66 (coe v0)) (coe d_vecCount_132 (coe v4)))
                                      (coe d_vecDefs_134 (coe v4)))
                                   (coe d_inputPorts_136 (coe v4)) (coe d_outputPorts_138 (coe v4))
                                   (coe d_nodes_140 (coe v4))))
                             (let v5
                                    = coe
                                        MAlonzo.Code.Effect.Monad.State.Transformer.du_monad_238
                                        (coe
                                           MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                                           ()) in
                              coe
                                (coe
                                   MAlonzo.Code.Effect.Applicative.du_return_68
                                   (MAlonzo.Code.Effect.Monad.d_rawApplicative_32 (coe v5))
                                   (coe
                                      MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                                      (coe d_vecCount_132 (coe v4))
                                      (coe d_explode_172 (coe d_vecCount_132 (coe v4)) (coe v0))))))
                          v3
                   _ -> MAlonzo.RTE.mazUnreachableError)))
-- Netlist.inputBit
d_inputBit_192 ::
  MAlonzo.Code.Agda.Builtin.String.T_String_6 ->
  MAlonzo.Code.Effect.Monad.State.Transformer.Base.T_StateT_56
d_inputBit_192 v0
  = coe
      MAlonzo.Code.Effect.Monad.State.Transformer.Base.C_mkStateT_68
      (coe
         (\ v1 ->
            coe
              MAlonzo.Code.Effect.Monad.d__'62''62''61'__34
              (coe
                 MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12 ())
              erased erased
              (coe
                 MAlonzo.Code.Effect.Monad.State.Transformer.Base.d_runStateT_66
                 d_mkNewBitNet_150 v1)
              (\ v2 ->
                 case coe v2 of
                   MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v3 v4
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
                             (coe
                                MAlonzo.Code.Effect.Monad.State.Transformer.Base.du_get_44
                                (coe
                                   MAlonzo.Code.Effect.Monad.State.Transformer.du_monadState_460
                                   (coe
                                      MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                                      ())))
                             (\ v5 ->
                                coe
                                  MAlonzo.Code.Effect.Monad.du__'62''62'__70
                                  (coe
                                     MAlonzo.Code.Effect.Monad.State.Instances.du_stateTMonad_80
                                     (coe
                                        MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                                        ()))
                                  (coe
                                     MAlonzo.Code.Effect.Monad.State.Transformer.Base.du_put_42
                                     (coe
                                        MAlonzo.Code.Effect.Monad.State.Instances.du_stateTMonadState_128
                                        (coe
                                           MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                                           ()))
                                     (coe
                                        C_NetlistInfo'46'constructor_1371
                                        (coe d_circuitName_128 (coe v5))
                                        (coe d_netCount_130 (coe v5)) (coe d_vecCount_132 (coe v5))
                                        (coe d_vecDefs_134 (coe v5))
                                        (coe
                                           MAlonzo.Code.Agda.Builtin.List.C__'8759'__22
                                           (coe
                                              MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v0)
                                              (coe C_BitType_76))
                                           (coe d_inputPorts_136 (coe v5)))
                                        (coe d_outputPorts_138 (coe v5))
                                        (coe
                                           MAlonzo.Code.Agda.Builtin.List.C__'8759'__22
                                           (coe C_inputBitNode_82 (coe v0) (coe v4))
                                           (coe d_nodes_140 (coe v5)))))
                                  (let v6
                                         = coe
                                             MAlonzo.Code.Effect.Monad.State.Transformer.du_monad_238
                                             (coe
                                                MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                                                ()) in
                                   coe
                                     (coe
                                        MAlonzo.Code.Effect.Applicative.du_return_68
                                        (MAlonzo.Code.Effect.Monad.d_rawApplicative_32 (coe v6))
                                        v4))))
                          v3
                   _ -> MAlonzo.RTE.mazUnreachableError)))
-- Netlist.inputVec
d_inputVec_202 ::
  MAlonzo.Code.Agda.Builtin.String.T_String_6 ->
  Integer ->
  MAlonzo.Code.Effect.Monad.State.Transformer.Base.T_StateT_56
d_inputVec_202 v0 v1
  = coe
      MAlonzo.Code.Effect.Monad.State.Transformer.Base.C_mkStateT_68
      (coe
         (\ v2 ->
            coe
              MAlonzo.Code.Effect.Monad.d__'62''62''61'__34
              (coe
                 MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12 ())
              erased erased
              (coe
                 MAlonzo.Code.Effect.Monad.State.Transformer.Base.d_runStateT_66
                 (d_mkNewVecNet_180 (coe v1)) v2)
              (\ v3 ->
                 case coe v3 of
                   MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v4 v5
                     -> coe
                          MAlonzo.Code.Effect.Monad.State.Transformer.Base.d_runStateT_66
                          (case coe v5 of
                             MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v6 v7
                               -> coe
                                    MAlonzo.Code.Effect.Monad.d__'62''62''61'__34
                                    (coe
                                       MAlonzo.Code.Effect.Monad.State.Instances.du_stateTMonad_80
                                       (coe
                                          MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                                          ()))
                                    erased erased
                                    (coe
                                       MAlonzo.Code.Effect.Monad.State.Transformer.Base.du_get_44
                                       (coe
                                          MAlonzo.Code.Effect.Monad.State.Instances.du_stateTMonadState_128
                                          (coe
                                             MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                                             ())))
                                    (\ v8 ->
                                       coe
                                         MAlonzo.Code.Effect.Monad.du__'62''62'__70
                                         (coe
                                            MAlonzo.Code.Effect.Monad.State.Instances.du_stateTMonad_80
                                            (coe
                                               MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                                               ()))
                                         (coe
                                            MAlonzo.Code.Effect.Monad.State.Transformer.Base.du_put_42
                                            (coe
                                               MAlonzo.Code.Effect.Monad.State.Transformer.du_monadState_460
                                               (coe
                                                  MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                                                  ()))
                                            (coe
                                               C_NetlistInfo'46'constructor_1371
                                               (coe d_circuitName_128 (coe v8))
                                               (coe d_netCount_130 (coe v8))
                                               (coe d_vecCount_132 (coe v8))
                                               (coe d_vecDefs_134 (coe v8))
                                               (coe
                                                  MAlonzo.Code.Agda.Builtin.List.C__'8759'__22
                                                  (coe
                                                     MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                                                     (coe v0) (coe C_VectorType_78 (coe v1)))
                                                  (coe d_inputPorts_136 (coe v8)))
                                               (coe d_outputPorts_138 (coe v8))
                                               (coe
                                                  MAlonzo.Code.Agda.Builtin.List.C__'8759'__22
                                                  (coe C_inputVecNode_84 (coe v0) (coe v6))
                                                  (coe d_nodes_140 (coe v8)))))
                                         (let v9
                                                = coe
                                                    MAlonzo.Code.Effect.Monad.State.Instances.du_stateTMonad_80
                                                    (coe
                                                       MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                                                       ()) in
                                          coe
                                            (coe
                                               MAlonzo.Code.Effect.Applicative.du_return_68
                                               (MAlonzo.Code.Effect.Monad.d_rawApplicative_32
                                                  (coe v9))
                                               v7)))
                             _ -> MAlonzo.RTE.mazUnreachableError)
                          v4
                   _ -> MAlonzo.RTE.mazUnreachableError)))
-- Netlist.outputBit
d_outputBit_216 ::
  MAlonzo.Code.Agda.Builtin.String.T_String_6 ->
  T_Bit_68 ->
  MAlonzo.Code.Effect.Monad.State.Transformer.Base.T_StateT_56
d_outputBit_216 v0 v1
  = coe
      MAlonzo.Code.Effect.Monad.State.Transformer.Base.C_mkStateT_68
      (coe
         (\ v2 ->
            coe
              MAlonzo.Code.Effect.Monad.d__'62''62''61'__34
              (coe
                 MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12 ())
              erased erased
              (coe
                 MAlonzo.Code.Effect.Monad.State.Transformer.Base.d_runStateT_66
                 (coe
                    MAlonzo.Code.Effect.Monad.State.Transformer.Base.du_get_44
                    (coe
                       MAlonzo.Code.Effect.Monad.State.Transformer.du_monadState_460
                       (coe
                          MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                          ())))
                 v2)
              (\ v3 ->
                 case coe v3 of
                   MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v4 v5
                     -> coe
                          MAlonzo.Code.Effect.Monad.State.Transformer.Base.d_runStateT_66
                          (coe
                             MAlonzo.Code.Effect.Monad.State.Transformer.Base.du_put_42
                             (coe
                                MAlonzo.Code.Effect.Monad.State.Instances.du_stateTMonadState_128
                                (coe
                                   MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                                   ()))
                             (coe
                                C_NetlistInfo'46'constructor_1371 (coe d_circuitName_128 (coe v5))
                                (coe d_netCount_130 (coe v5)) (coe d_vecCount_132 (coe v5))
                                (coe d_vecDefs_134 (coe v5)) (coe d_inputPorts_136 (coe v5))
                                (coe
                                   MAlonzo.Code.Agda.Builtin.List.C__'8759'__22
                                   (coe
                                      MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v0)
                                      (coe C_BitType_76))
                                   (coe d_outputPorts_138 (coe v5)))
                                (coe
                                   MAlonzo.Code.Agda.Builtin.List.C__'8759'__22
                                   (coe C_outputBitNode_86 (coe v0) (coe v1))
                                   (coe d_nodes_140 (coe v5)))))
                          v4
                   _ -> MAlonzo.RTE.mazUnreachableError)))
-- Netlist.outputVec
d_outputVec_226 ::
  Integer ->
  MAlonzo.Code.Agda.Builtin.String.T_String_6 ->
  MAlonzo.Code.Data.Vec.Base.T_Vec_28 ->
  MAlonzo.Code.Effect.Monad.State.Transformer.Base.T_StateT_56
d_outputVec_226 v0 v1 v2
  = coe
      MAlonzo.Code.Effect.Monad.State.Transformer.Base.C_mkStateT_68
      (coe
         (\ v3 ->
            coe
              MAlonzo.Code.Effect.Monad.d__'62''62''61'__34
              (coe
                 MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12 ())
              erased erased
              (coe
                 MAlonzo.Code.Effect.Monad.State.Transformer.Base.d_runStateT_66
                 (coe
                    MAlonzo.Code.Effect.Monad.State.Transformer.Base.du_get_44
                    (coe
                       MAlonzo.Code.Effect.Monad.State.Transformer.du_monadState_460
                       (coe
                          MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                          ())))
                 v3)
              (\ v4 ->
                 case coe v4 of
                   MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v5 v6
                     -> coe
                          MAlonzo.Code.Effect.Monad.State.Transformer.Base.d_runStateT_66
                          (coe
                             MAlonzo.Code.Effect.Monad.State.Transformer.Base.du_put_42
                             (coe
                                MAlonzo.Code.Effect.Monad.State.Instances.du_stateTMonadState_128
                                (coe
                                   MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                                   ()))
                             (coe
                                C_NetlistInfo'46'constructor_1371 (coe d_circuitName_128 (coe v6))
                                (coe d_netCount_130 (coe v6)) (coe d_vecCount_132 (coe v6))
                                (coe d_vecDefs_134 (coe v6)) (coe d_inputPorts_136 (coe v6))
                                (coe
                                   MAlonzo.Code.Agda.Builtin.List.C__'8759'__22
                                   (coe
                                      MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v1)
                                      (coe C_VectorType_78 (coe v0)))
                                   (coe d_outputPorts_138 (coe v6)))
                                (coe
                                   MAlonzo.Code.Agda.Builtin.List.C__'8759'__22
                                   (coe C_outputVecNode_90 (coe v0) (coe v1) (coe v2))
                                   (coe d_nodes_140 (coe v6)))))
                          v5
                   _ -> MAlonzo.RTE.mazUnreachableError)))
-- Netlist.invNL
d_invNL_236 ::
  T_Bit_68 ->
  MAlonzo.Code.Effect.Monad.State.Transformer.Base.T_StateT_56
d_invNL_236 v0
  = coe
      MAlonzo.Code.Effect.Monad.State.Transformer.Base.C_mkStateT_68
      (coe
         (\ v1 ->
            coe
              MAlonzo.Code.Effect.Monad.d__'62''62''61'__34
              (coe
                 MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12 ())
              erased erased
              (coe
                 MAlonzo.Code.Effect.Monad.State.Transformer.Base.d_runStateT_66
                 d_mkNewBitNet_150 v1)
              (\ v2 ->
                 case coe v2 of
                   MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v3 v4
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
                             (coe
                                MAlonzo.Code.Effect.Monad.State.Transformer.Base.du_get_44
                                (coe
                                   MAlonzo.Code.Effect.Monad.State.Transformer.du_monadState_460
                                   (coe
                                      MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                                      ())))
                             (\ v5 ->
                                coe
                                  MAlonzo.Code.Effect.Monad.du__'62''62'__70
                                  (coe
                                     MAlonzo.Code.Effect.Monad.State.Instances.du_stateTMonad_80
                                     (coe
                                        MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                                        ()))
                                  (coe
                                     MAlonzo.Code.Effect.Monad.State.Transformer.Base.du_put_42
                                     (coe
                                        MAlonzo.Code.Effect.Monad.State.Instances.du_stateTMonadState_128
                                        (coe
                                           MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                                           ()))
                                     (coe
                                        C_NetlistInfo'46'constructor_1371
                                        (coe d_circuitName_128 (coe v5))
                                        (coe d_netCount_130 (coe v5)) (coe d_vecCount_132 (coe v5))
                                        (coe d_vecDefs_134 (coe v5)) (coe d_inputPorts_136 (coe v5))
                                        (coe d_outputPorts_138 (coe v5))
                                        (coe
                                           MAlonzo.Code.Agda.Builtin.List.C__'8759'__22
                                           (coe C_invNode_92 (coe v0) (coe v4))
                                           (coe d_nodes_140 (coe v5)))))
                                  (let v6
                                         = coe
                                             MAlonzo.Code.Effect.Monad.State.Transformer.du_monad_238
                                             (coe
                                                MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                                                ()) in
                                   coe
                                     (coe
                                        MAlonzo.Code.Effect.Applicative.du_return_68
                                        (MAlonzo.Code.Effect.Monad.d_rawApplicative_32 (coe v6))
                                        v4))))
                          v3
                   _ -> MAlonzo.RTE.mazUnreachableError)))
-- Netlist.binaryNetNode
d_binaryNetNode_244 ::
  (T_Bit_68 -> T_Bit_68 -> T_Bit_68 -> T_CircuitNode_80) ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14 ->
  MAlonzo.Code.Effect.Monad.State.Transformer.Base.T_StateT_56
d_binaryNetNode_244 v0 v1
  = case coe v1 of
      MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v2 v3
        -> coe
             MAlonzo.Code.Effect.Monad.State.Transformer.Base.C_mkStateT_68
             (coe
                (\ v4 ->
                   coe
                     MAlonzo.Code.Effect.Monad.d__'62''62''61'__34
                     (coe
                        MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12 ())
                     erased erased
                     (coe
                        MAlonzo.Code.Effect.Monad.State.Transformer.Base.d_runStateT_66
                        d_mkNewBitNet_150 v4)
                     (\ v5 ->
                        case coe v5 of
                          MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v6 v7
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
                                    (coe
                                       MAlonzo.Code.Effect.Monad.State.Transformer.Base.du_get_44
                                       (coe
                                          MAlonzo.Code.Effect.Monad.State.Transformer.du_monadState_460
                                          (coe
                                             MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                                             ())))
                                    (\ v8 ->
                                       coe
                                         MAlonzo.Code.Effect.Monad.du__'62''62'__70
                                         (coe
                                            MAlonzo.Code.Effect.Monad.State.Instances.du_stateTMonad_80
                                            (coe
                                               MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                                               ()))
                                         (coe
                                            MAlonzo.Code.Effect.Monad.State.Transformer.Base.du_put_42
                                            (coe
                                               MAlonzo.Code.Effect.Monad.State.Instances.du_stateTMonadState_128
                                               (coe
                                                  MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                                                  ()))
                                            (coe
                                               C_NetlistInfo'46'constructor_1371
                                               (coe d_circuitName_128 (coe v8))
                                               (coe d_netCount_130 (coe v8))
                                               (coe d_vecCount_132 (coe v8))
                                               (coe d_vecDefs_134 (coe v8))
                                               (coe d_inputPorts_136 (coe v8))
                                               (coe d_outputPorts_138 (coe v8))
                                               (coe
                                                  MAlonzo.Code.Agda.Builtin.List.C__'8759'__22
                                                  (coe v0 v2 v3 v7) (coe d_nodes_140 (coe v8)))))
                                         (let v9
                                                = coe
                                                    MAlonzo.Code.Effect.Monad.State.Transformer.du_monad_238
                                                    (coe
                                                       MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                                                       ()) in
                                          coe
                                            (coe
                                               MAlonzo.Code.Effect.Applicative.du_return_68
                                               (MAlonzo.Code.Effect.Monad.d_rawApplicative_32
                                                  (coe v9))
                                               v7))))
                                 v6
                          _ -> MAlonzo.RTE.mazUnreachableError)))
      _ -> MAlonzo.RTE.mazUnreachableError
-- Netlist.and2NL
d_and2NL_256 ::
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14 ->
  MAlonzo.Code.Effect.Monad.State.Transformer.Base.T_StateT_56
d_and2NL_256 = coe d_binaryNetNode_244 (coe C_and2Node_94)
-- Netlist.or2NL
d_or2NL_258 ::
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14 ->
  MAlonzo.Code.Effect.Monad.State.Transformer.Base.T_StateT_56
d_or2NL_258 = coe d_binaryNetNode_244 (coe C_or2Node_96)
-- Netlist.xor2NL
d_xor2NL_260 ::
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14 ->
  MAlonzo.Code.Effect.Monad.State.Transformer.Base.T_StateT_56
d_xor2NL_260 = coe d_binaryNetNode_244 (coe C_xor2Node_98)
-- Netlist.addNL
d_addNL_264 ::
  Integer ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14 ->
  MAlonzo.Code.Effect.Monad.State.Transformer.Base.T_StateT_56
d_addNL_264 v0 v1
  = case coe v1 of
      MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v2 v3
        -> coe
             MAlonzo.Code.Effect.Monad.State.Transformer.Base.C_mkStateT_68
             (coe
                (\ v4 ->
                   coe
                     MAlonzo.Code.Effect.Monad.d__'62''62''61'__34
                     (coe
                        MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12 ())
                     erased erased
                     (coe
                        MAlonzo.Code.Effect.Monad.State.Transformer.Base.d_runStateT_66
                        (d_mkNewVecNet_180 (coe addInt (coe (1 :: Integer)) (coe v0))) v4)
                     (\ v5 ->
                        case coe v5 of
                          MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v6 v7
                            -> coe
                                 MAlonzo.Code.Effect.Monad.State.Transformer.Base.d_runStateT_66
                                 (case coe v7 of
                                    MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v8 v9
                                      -> coe
                                           MAlonzo.Code.Effect.Monad.d__'62''62''61'__34
                                           (coe
                                              MAlonzo.Code.Effect.Monad.State.Instances.du_stateTMonad_80
                                              (coe
                                                 MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                                                 ()))
                                           erased erased
                                           (coe
                                              MAlonzo.Code.Effect.Monad.State.Transformer.Base.du_get_44
                                              (coe
                                                 MAlonzo.Code.Effect.Monad.State.Instances.du_stateTMonadState_128
                                                 (coe
                                                    MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                                                    ())))
                                           (\ v10 ->
                                              coe
                                                MAlonzo.Code.Effect.Monad.du__'62''62'__70
                                                (coe
                                                   MAlonzo.Code.Effect.Monad.State.Instances.du_stateTMonad_80
                                                   (coe
                                                      MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                                                      ()))
                                                (coe
                                                   MAlonzo.Code.Effect.Monad.State.Transformer.Base.du_put_42
                                                   (coe
                                                      MAlonzo.Code.Effect.Monad.State.Transformer.du_monadState_460
                                                      (coe
                                                         MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                                                         ()))
                                                   (coe
                                                      C_NetlistInfo'46'constructor_1371
                                                      (coe d_circuitName_128 (coe v10))
                                                      (coe d_netCount_130 (coe v10))
                                                      (coe d_vecCount_132 (coe v10))
                                                      (coe d_vecDefs_134 (coe v10))
                                                      (coe d_inputPorts_136 (coe v10))
                                                      (coe d_outputPorts_138 (coe v10))
                                                      (coe
                                                         MAlonzo.Code.Agda.Builtin.List.C__'8759'__22
                                                         (coe
                                                            C_addNode_102 (coe v0) (coe v2) (coe v3)
                                                            (coe v8))
                                                         (coe d_nodes_140 (coe v10)))))
                                                (let v11
                                                       = coe
                                                           MAlonzo.Code.Effect.Monad.State.Instances.du_stateTMonad_80
                                                           (coe
                                                              MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                                                              ()) in
                                                 coe
                                                   (coe
                                                      MAlonzo.Code.Effect.Applicative.du_return_68
                                                      (MAlonzo.Code.Effect.Monad.d_rawApplicative_32
                                                         (coe v11))
                                                      v9)))
                                    _ -> MAlonzo.RTE.mazUnreachableError)
                                 v6
                          _ -> MAlonzo.RTE.mazUnreachableError)))
      _ -> MAlonzo.RTE.mazUnreachableError
-- Netlist.lessThanNL
d_lessThanNL_282 ::
  Integer ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14 ->
  MAlonzo.Code.Effect.Monad.State.Transformer.Base.T_StateT_56
d_lessThanNL_282 v0 v1
  = case coe v1 of
      MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v2 v3
        -> coe
             MAlonzo.Code.Effect.Monad.State.Transformer.Base.C_mkStateT_68
             (coe
                (\ v4 ->
                   coe
                     MAlonzo.Code.Effect.Monad.d__'62''62''61'__34
                     (coe
                        MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12 ())
                     erased erased
                     (coe
                        MAlonzo.Code.Effect.Monad.State.Transformer.Base.d_runStateT_66
                        d_mkNewBitNet_150 v4)
                     (\ v5 ->
                        case coe v5 of
                          MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v6 v7
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
                                    (coe
                                       MAlonzo.Code.Effect.Monad.State.Transformer.Base.du_get_44
                                       (coe
                                          MAlonzo.Code.Effect.Monad.State.Transformer.du_monadState_460
                                          (coe
                                             MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                                             ())))
                                    (\ v8 ->
                                       coe
                                         MAlonzo.Code.Effect.Monad.du__'62''62'__70
                                         (coe
                                            MAlonzo.Code.Effect.Monad.State.Instances.du_stateTMonad_80
                                            (coe
                                               MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                                               ()))
                                         (coe
                                            MAlonzo.Code.Effect.Monad.State.Transformer.Base.du_put_42
                                            (coe
                                               MAlonzo.Code.Effect.Monad.State.Instances.du_stateTMonadState_128
                                               (coe
                                                  MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                                                  ()))
                                            (coe
                                               C_NetlistInfo'46'constructor_1371
                                               (coe d_circuitName_128 (coe v8))
                                               (coe d_netCount_130 (coe v8))
                                               (coe d_vecCount_132 (coe v8))
                                               (coe d_vecDefs_134 (coe v8))
                                               (coe d_inputPorts_136 (coe v8))
                                               (coe d_outputPorts_138 (coe v8))
                                               (coe
                                                  MAlonzo.Code.Agda.Builtin.List.C__'8759'__22
                                                  (coe
                                                     C_lessThanNode_106 (coe v0) (coe v2) (coe v3)
                                                     (coe v7))
                                                  (coe d_nodes_140 (coe v8)))))
                                         (let v9
                                                = coe
                                                    MAlonzo.Code.Effect.Monad.State.Transformer.du_monad_238
                                                    (coe
                                                       MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                                                       ()) in
                                          coe
                                            (coe
                                               MAlonzo.Code.Effect.Applicative.du_return_68
                                               (MAlonzo.Code.Effect.Monad.d_rawApplicative_32
                                                  (coe v9))
                                               v7))))
                                 v6
                          _ -> MAlonzo.RTE.mazUnreachableError)))
      _ -> MAlonzo.RTE.mazUnreachableError
-- Netlist.muxNL
d_muxNL_296 ::
  Integer ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14 ->
  MAlonzo.Code.Effect.Monad.State.Transformer.Base.T_StateT_56
d_muxNL_296 v0 v1
  = case coe v1 of
      MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v2 v3
        -> case coe v3 of
             MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v4 v5
               -> coe
                    MAlonzo.Code.Effect.Monad.State.Transformer.Base.C_mkStateT_68
                    (coe
                       (\ v6 ->
                          coe
                            MAlonzo.Code.Effect.Monad.d__'62''62''61'__34
                            (coe
                               MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12 ())
                            erased erased
                            (coe
                               MAlonzo.Code.Effect.Monad.State.Transformer.Base.d_runStateT_66
                               (d_mkNewVecNet_180 (coe v0)) v6)
                            (\ v7 ->
                               case coe v7 of
                                 MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v8 v9
                                   -> coe
                                        MAlonzo.Code.Effect.Monad.State.Transformer.Base.d_runStateT_66
                                        (case coe v9 of
                                           MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v10 v11
                                             -> coe
                                                  MAlonzo.Code.Effect.Monad.d__'62''62''61'__34
                                                  (coe
                                                     MAlonzo.Code.Effect.Monad.State.Instances.du_stateTMonad_80
                                                     (coe
                                                        MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                                                        ()))
                                                  erased erased
                                                  (coe
                                                     MAlonzo.Code.Effect.Monad.State.Transformer.Base.du_get_44
                                                     (coe
                                                        MAlonzo.Code.Effect.Monad.State.Instances.du_stateTMonadState_128
                                                        (coe
                                                           MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                                                           ())))
                                                  (\ v12 ->
                                                     coe
                                                       MAlonzo.Code.Effect.Monad.du__'62''62'__70
                                                       (coe
                                                          MAlonzo.Code.Effect.Monad.State.Instances.du_stateTMonad_80
                                                          (coe
                                                             MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                                                             ()))
                                                       (coe
                                                          MAlonzo.Code.Effect.Monad.State.Transformer.Base.du_put_42
                                                          (coe
                                                             MAlonzo.Code.Effect.Monad.State.Transformer.du_monadState_460
                                                             (coe
                                                                MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                                                                ()))
                                                          (coe
                                                             C_NetlistInfo'46'constructor_1371
                                                             (coe d_circuitName_128 (coe v12))
                                                             (coe d_netCount_130 (coe v12))
                                                             (coe d_vecCount_132 (coe v12))
                                                             (coe d_vecDefs_134 (coe v12))
                                                             (coe d_inputPorts_136 (coe v12))
                                                             (coe d_outputPorts_138 (coe v12))
                                                             (coe
                                                                MAlonzo.Code.Agda.Builtin.List.C__'8759'__22
                                                                (coe
                                                                   C_muxNode_110 (coe v0) (coe v2)
                                                                   (coe v4) (coe v5) (coe v10))
                                                                (coe d_nodes_140 (coe v12)))))
                                                       (let v13
                                                              = coe
                                                                  MAlonzo.Code.Effect.Monad.State.Instances.du_stateTMonad_80
                                                                  (coe
                                                                     MAlonzo.Code.Effect.Monad.Identity.Instances.d_identityMonad_12
                                                                     ()) in
                                                        coe
                                                          (coe
                                                             MAlonzo.Code.Effect.Applicative.du_return_68
                                                             (MAlonzo.Code.Effect.Monad.d_rawApplicative_32
                                                                (coe v13))
                                                             v11)))
                                           _ -> MAlonzo.RTE.mazUnreachableError)
                                        v8
                                 _ -> MAlonzo.RTE.mazUnreachableError)))
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
-- Netlist.NetlistAgate
d_NetlistAgate_314 :: MAlonzo.Code.AgateClass.T_Agate_8
d_NetlistAgate_314
  = coe
      MAlonzo.Code.AgateClass.C_Agate'46'constructor_1387
      (coe d_invNL_236) (coe d_and2NL_256) (coe d_or2NL_258)
      (coe d_xor2NL_260) (coe d_addNL_264) (coe d_lessThanNL_282)
      (coe d_muxNL_296)
-- Netlist.initialState
d_initialState_316 :: T_NetlistInfo_112
d_initialState_316
  = coe
      C_NetlistInfo'46'constructor_1371 (coe ("" :: Data.Text.Text))
      (coe (0 :: Integer)) (coe (0 :: Integer))
      (coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16)
      (coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16)
      (coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16)
      (coe MAlonzo.Code.Agda.Builtin.List.C_'91''93'_16)
-- Netlist.makeNetlist
d_makeNetlist_318 ::
  MAlonzo.Code.Effect.Monad.State.Transformer.Base.T_StateT_56 ->
  T_NetlistInfo_112
d_makeNetlist_318 v0
  = coe
      MAlonzo.Code.Effect.Monad.State.du_execState_32 (coe v0)
      (coe d_initialState_316)
