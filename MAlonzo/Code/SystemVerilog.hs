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

module MAlonzo.Code.SystemVerilog where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Bool
import qualified MAlonzo.Code.Agda.Builtin.List
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Agda.Builtin.String
import qualified MAlonzo.Code.Data.Bool.Base
import qualified MAlonzo.Code.Data.List.Base
import qualified MAlonzo.Code.Data.Nat.Properties
import qualified MAlonzo.Code.Data.Nat.Show
import qualified MAlonzo.Code.Data.String.Base
import qualified MAlonzo.Code.Data.Vec.Base
import qualified MAlonzo.Code.Effect.Monad.State.Transformer.Base
import qualified MAlonzo.Code.Netlist
import qualified MAlonzo.Code.Relation.Nullary.Decidable.Core
import qualified MAlonzo.Code.Relation.Nullary.Reflects

-- SystemVerilog.showBit
d_showBit_2 ::
  MAlonzo.Code.Netlist.T_Bit_68 ->
  MAlonzo.Code.Agda.Builtin.String.T_String_6
d_showBit_2 v0
  = case coe v0 of
      MAlonzo.Code.Netlist.C_localNet_70 v1
        -> coe
             MAlonzo.Code.Data.String.Base.d__'43''43'__20
             ("net" :: Data.Text.Text)
             (coe MAlonzo.Code.Data.Nat.Show.d_show_56 v1)
      MAlonzo.Code.Netlist.C_indexOfVec_72 v1 v2
        -> coe
             MAlonzo.Code.Data.String.Base.d__'43''43'__20
             ("vec" :: Data.Text.Text)
             (coe
                MAlonzo.Code.Data.String.Base.d__'43''43'__20
                (coe MAlonzo.Code.Data.Nat.Show.d_show_56 v1)
                (coe
                   MAlonzo.Code.Data.String.Base.d__'43''43'__20
                   ("[" :: Data.Text.Text)
                   (coe
                      MAlonzo.Code.Data.String.Base.d__'43''43'__20
                      (coe MAlonzo.Code.Data.Nat.Show.d_show_56 v2)
                      ("]" :: Data.Text.Text))))
      _ -> MAlonzo.RTE.mazUnreachableError
-- SystemVerilog.sameValue
d_sameValue_10 :: Integer -> Integer -> Bool
d_sameValue_10 v0 v1
  = let v2
          = coe
              MAlonzo.Code.Relation.Nullary.Decidable.Core.du_map'8242'_168
              erased
              (\ v2 ->
                 coe
                   MAlonzo.Code.Data.Nat.Properties.du_'8801''8658''8801''7495'_2678
                   (coe v0))
              (coe
                 MAlonzo.Code.Relation.Nullary.Decidable.Core.d_T'63'_66
                 (coe eqInt (coe v0) (coe v1))) in
    coe
      (case coe v2 of
         MAlonzo.Code.Relation.Nullary.Decidable.Core.C__because__32 v3 v4
           -> if coe v3
                then coe seq (coe v4) (coe v3)
                else coe seq (coe v4) (coe v3)
         _ -> MAlonzo.RTE.mazUnreachableError)
-- SystemVerilog.vecCollapsable
d_vecCollapsable_30 ::
  Integer -> Integer -> MAlonzo.Code.Data.Vec.Base.T_Vec_28 -> Bool
d_vecCollapsable_30 v0 v1 v2
  = let v3 = coe MAlonzo.Code.Agda.Builtin.Bool.C_false_8 in
    coe
      (case coe v1 of
         0 -> coe MAlonzo.Code.Agda.Builtin.Bool.C_true_10
         _ -> let v4 = subInt (coe v1) (coe (1 :: Integer)) in
              coe
                (case coe v2 of
                   MAlonzo.Code.Data.Vec.Base.C__'8759'__38 v6 v7
                     -> case coe v6 of
                          MAlonzo.Code.Netlist.C_indexOfVec_72 v8 v9
                            -> let v10
                                     = coe
                                         MAlonzo.Code.Relation.Nullary.Decidable.Core.du_map'8242'_168
                                         erased
                                         (\ v10 ->
                                            coe
                                              MAlonzo.Code.Data.Nat.Properties.du_'8801''8658''8801''7495'_2678
                                              (coe v0))
                                         (coe
                                            MAlonzo.Code.Relation.Nullary.Decidable.Core.C__because__32
                                            (coe eqInt (coe v0) (coe v8))
                                            (coe
                                               MAlonzo.Code.Relation.Nullary.Reflects.d_T'45'reflects_66
                                               (coe eqInt (coe v0) (coe v8)))) in
                               coe
                                 (case coe v10 of
                                    MAlonzo.Code.Relation.Nullary.Decidable.Core.C__because__32 v11 v12
                                      -> if coe v11
                                           then let v13 = seq (coe v12) (coe v11) in
                                                coe
                                                  (case coe v13 of
                                                     MAlonzo.Code.Agda.Builtin.Bool.C_true_10
                                                       -> let v14
                                                                = coe
                                                                    MAlonzo.Code.Relation.Nullary.Decidable.Core.du_map'8242'_168
                                                                    erased
                                                                    (\ v14 ->
                                                                       coe
                                                                         MAlonzo.Code.Data.Nat.Properties.du_'8801''8658''8801''7495'_2678
                                                                         (coe v4))
                                                                    (coe
                                                                       MAlonzo.Code.Relation.Nullary.Decidable.Core.C__because__32
                                                                       (coe eqInt (coe v4) (coe v9))
                                                                       (coe
                                                                          MAlonzo.Code.Relation.Nullary.Reflects.d_T'45'reflects_66
                                                                          (coe
                                                                             eqInt (coe v4)
                                                                             (coe v9)))) in
                                                          coe
                                                            (case coe v14 of
                                                               MAlonzo.Code.Relation.Nullary.Decidable.Core.C__because__32 v15 v16
                                                                 -> if coe v15
                                                                      then let v17
                                                                                 = seq
                                                                                     (coe v16)
                                                                                     (coe v15) in
                                                                           coe
                                                                             (case coe v17 of
                                                                                MAlonzo.Code.Agda.Builtin.Bool.C_true_10
                                                                                  -> coe
                                                                                       d_vecCollapsable_30
                                                                                       (coe v0)
                                                                                       (coe v4)
                                                                                       (coe v7)
                                                                                _ -> coe
                                                                                       MAlonzo.Code.Agda.Builtin.Bool.C_false_8)
                                                                      else (let v17
                                                                                  = seq
                                                                                      (coe v16)
                                                                                      (coe v15) in
                                                                            coe
                                                                              (case coe v17 of
                                                                                 MAlonzo.Code.Agda.Builtin.Bool.C_true_10
                                                                                   -> coe
                                                                                        d_vecCollapsable_30
                                                                                        (coe v0)
                                                                                        (coe v4)
                                                                                        (coe v7)
                                                                                 _ -> coe v15))
                                                               _ -> MAlonzo.RTE.mazUnreachableError)
                                                     _ -> coe
                                                            MAlonzo.Code.Agda.Builtin.Bool.C_false_8)
                                           else (let v13 = seq (coe v12) (coe v11) in
                                                 coe
                                                   (case coe v13 of
                                                      MAlonzo.Code.Agda.Builtin.Bool.C_true_10
                                                        -> let v14
                                                                 = coe
                                                                     MAlonzo.Code.Relation.Nullary.Decidable.Core.du_map'8242'_168
                                                                     erased
                                                                     (\ v14 ->
                                                                        coe
                                                                          MAlonzo.Code.Data.Nat.Properties.du_'8801''8658''8801''7495'_2678
                                                                          (coe v4))
                                                                     (coe
                                                                        MAlonzo.Code.Relation.Nullary.Decidable.Core.C__because__32
                                                                        (coe
                                                                           eqInt (coe v4) (coe v9))
                                                                        (coe
                                                                           MAlonzo.Code.Relation.Nullary.Reflects.d_T'45'reflects_66
                                                                           (coe
                                                                              eqInt (coe v4)
                                                                              (coe v9)))) in
                                                           coe
                                                             (case coe v14 of
                                                                MAlonzo.Code.Relation.Nullary.Decidable.Core.C__because__32 v15 v16
                                                                  -> if coe v15
                                                                       then let v17
                                                                                  = seq
                                                                                      (coe v16)
                                                                                      (coe v15) in
                                                                            coe
                                                                              (case coe v17 of
                                                                                 MAlonzo.Code.Agda.Builtin.Bool.C_true_10
                                                                                   -> coe
                                                                                        d_vecCollapsable_30
                                                                                        (coe v0)
                                                                                        (coe v4)
                                                                                        (coe v7)
                                                                                 _ -> coe v11)
                                                                       else (let v17
                                                                                   = seq
                                                                                       (coe v16)
                                                                                       (coe v15) in
                                                                             coe
                                                                               (case coe v17 of
                                                                                  MAlonzo.Code.Agda.Builtin.Bool.C_true_10
                                                                                    -> coe
                                                                                         d_vecCollapsable_30
                                                                                         (coe v0)
                                                                                         (coe v4)
                                                                                         (coe v7)
                                                                                  _ -> coe v15))
                                                                _ -> MAlonzo.RTE.mazUnreachableError)
                                                      _ -> coe v11))
                                    _ -> MAlonzo.RTE.mazUnreachableError)
                          _ -> coe v3
                   _ -> coe v3))
-- SystemVerilog.showVecAsLiteral'
d_showVecAsLiteral''_72 ::
  Integer ->
  MAlonzo.Code.Data.Vec.Base.T_Vec_28 ->
  MAlonzo.Code.Agda.Builtin.String.T_String_6
d_showVecAsLiteral''_72 v0 v1
  = case coe v1 of
      MAlonzo.Code.Data.Vec.Base.C_'91''93'_32
        -> coe ("" :: Data.Text.Text)
      MAlonzo.Code.Data.Vec.Base.C__'8759'__38 v3 v4
        -> let v5 = subInt (coe v0) (coe (1 :: Integer)) in
           coe
             (let v6
                    = coe
                        MAlonzo.Code.Data.String.Base.d__'43''43'__20
                        (d_showBit_2 (coe v3))
                        (coe
                           MAlonzo.Code.Data.String.Base.d__'43''43'__20
                           (", " :: Data.Text.Text)
                           (d_showVecAsLiteral''_72 (coe v5) (coe v4))) in
              coe
                (case coe v4 of
                   MAlonzo.Code.Data.Vec.Base.C__'8759'__38 v8 v9
                     -> case coe v0 of
                          _ | coe geqInt (coe v0) (coe (2 :: Integer)) ->
                              case coe v9 of
                                MAlonzo.Code.Data.Vec.Base.C_'91''93'_32
                                  -> coe
                                       MAlonzo.Code.Data.String.Base.d__'43''43'__20
                                       (d_showBit_2 (coe v3))
                                       (coe
                                          MAlonzo.Code.Data.String.Base.d__'43''43'__20
                                          (", " :: Data.Text.Text) (d_showBit_2 (coe v8)))
                                _ -> coe v6
                          _ -> coe v6
                   _ -> coe v6))
      _ -> MAlonzo.RTE.mazUnreachableError
-- SystemVerilog.showVecAsLiteral
d_showVecAsLiteral_84 ::
  Integer ->
  MAlonzo.Code.Data.Vec.Base.T_Vec_28 ->
  MAlonzo.Code.Agda.Builtin.String.T_String_6
d_showVecAsLiteral_84 v0 v1
  = let v2
          = coe
              MAlonzo.Code.Data.String.Base.d__'43''43'__20
              ("'{" :: Data.Text.Text)
              (coe
                 MAlonzo.Code.Data.String.Base.d__'43''43'__20
                 (d_showVecAsLiteral''_72
                    (coe v0) (coe MAlonzo.Code.Data.Vec.Base.du_reverse_616 v1))
                 ("}" :: Data.Text.Text)) in
    coe
      (case coe v1 of
         MAlonzo.Code.Data.Vec.Base.C_'91''93'_32
           -> coe ("<BAD VECTOR>" :: Data.Text.Text)
         MAlonzo.Code.Data.Vec.Base.C__'8759'__38 v4 v5
           -> case coe v0 of
                _ | coe geqInt (coe v0) (coe (1 :: Integer)) ->
                    case coe v4 of
                      MAlonzo.Code.Netlist.C_indexOfVec_72 v6 v7
                        -> coe
                             MAlonzo.Code.Data.Bool.Base.du_if_then_else__44
                             (coe
                                d_vecCollapsable_30 (coe v6) (coe v0)
                                (coe
                                   MAlonzo.Code.Data.Vec.Base.du_reverse_616
                                   (coe MAlonzo.Code.Data.Vec.Base.C__'8759'__38 v4 v5)))
                             (coe
                                MAlonzo.Code.Data.String.Base.d__'43''43'__20
                                ("vec" :: Data.Text.Text)
                                (coe MAlonzo.Code.Data.Nat.Show.d_show_56 v6))
                             (coe
                                MAlonzo.Code.Data.String.Base.d__'43''43'__20
                                ("'{" :: Data.Text.Text)
                                (coe
                                   MAlonzo.Code.Data.String.Base.d__'43''43'__20
                                   (d_showVecAsLiteral''_72
                                      (coe v0)
                                      (coe
                                         MAlonzo.Code.Data.Vec.Base.du_reverse_616
                                         (coe MAlonzo.Code.Data.Vec.Base.C__'8759'__38 v4 v5)))
                                   ("}" :: Data.Text.Text)))
                      _ -> coe v2
                _ -> coe v2
         _ -> MAlonzo.RTE.mazUnreachableError)
-- SystemVerilog.unarySVprimitive
d_unarySVprimitive_96 ::
  MAlonzo.Code.Agda.Builtin.String.T_String_6 ->
  MAlonzo.Code.Netlist.T_Bit_68 ->
  MAlonzo.Code.Netlist.T_Bit_68 ->
  MAlonzo.Code.Agda.Builtin.String.T_String_6
d_unarySVprimitive_96 v0 v1 v2
  = coe
      MAlonzo.Code.Data.String.Base.d__'43''43'__20
      ("  " :: Data.Text.Text)
      (coe
         MAlonzo.Code.Data.String.Base.d__'43''43'__20 v0
         (coe
            MAlonzo.Code.Data.String.Base.d__'43''43'__20
            ("(" :: Data.Text.Text)
            (coe
               MAlonzo.Code.Data.String.Base.d__'43''43'__20
               (d_showBit_2 (coe v2))
               (coe
                  MAlonzo.Code.Data.String.Base.d__'43''43'__20
                  (", " :: Data.Text.Text)
                  (coe
                     MAlonzo.Code.Data.String.Base.d__'43''43'__20
                     (d_showBit_2 (coe v1)) (");" :: Data.Text.Text))))))
-- SystemVerilog.binarySVprimitive
d_binarySVprimitive_104 ::
  MAlonzo.Code.Agda.Builtin.String.T_String_6 ->
  MAlonzo.Code.Netlist.T_Bit_68 ->
  MAlonzo.Code.Netlist.T_Bit_68 ->
  MAlonzo.Code.Netlist.T_Bit_68 ->
  MAlonzo.Code.Agda.Builtin.String.T_String_6
d_binarySVprimitive_104 v0 v1 v2 v3
  = coe
      MAlonzo.Code.Data.String.Base.d__'43''43'__20
      ("  " :: Data.Text.Text)
      (coe
         MAlonzo.Code.Data.String.Base.d__'43''43'__20 v0
         (coe
            MAlonzo.Code.Data.String.Base.d__'43''43'__20
            ("(" :: Data.Text.Text)
            (coe
               MAlonzo.Code.Data.String.Base.d__'43''43'__20
               (d_showBit_2 (coe v3))
               (coe
                  MAlonzo.Code.Data.String.Base.d__'43''43'__20
                  (", " :: Data.Text.Text)
                  (coe
                     MAlonzo.Code.Data.String.Base.d__'43''43'__20
                     (d_showBit_2 (coe v1))
                     (coe
                        MAlonzo.Code.Data.String.Base.d__'43''43'__20
                        (", " :: Data.Text.Text)
                        (coe
                           MAlonzo.Code.Data.String.Base.d__'43''43'__20
                           (d_showBit_2 (coe v2)) (");" :: Data.Text.Text))))))))
-- SystemVerilog.showSVNode
d_showSVNode_114 ::
  MAlonzo.Code.Netlist.T_CircuitNode_80 ->
  MAlonzo.Code.Agda.Builtin.String.T_String_6
d_showSVNode_114 v0
  = case coe v0 of
      MAlonzo.Code.Netlist.C_inputBitNode_82 v1 v2
        -> coe
             MAlonzo.Code.Data.String.Base.d__'43''43'__20
             ("  assign " :: Data.Text.Text)
             (coe
                MAlonzo.Code.Data.String.Base.d__'43''43'__20
                (d_showBit_2 (coe v2))
                (coe
                   MAlonzo.Code.Data.String.Base.d__'43''43'__20
                   (" = " :: Data.Text.Text)
                   (coe
                      MAlonzo.Code.Data.String.Base.d__'43''43'__20 v1
                      (";" :: Data.Text.Text))))
      MAlonzo.Code.Netlist.C_inputVecNode_84 v1 v2
        -> coe
             MAlonzo.Code.Data.String.Base.d__'43''43'__20
             ("  assign vec" :: Data.Text.Text)
             (coe
                MAlonzo.Code.Data.String.Base.d__'43''43'__20
                (coe MAlonzo.Code.Data.Nat.Show.d_show_56 v2)
                (coe
                   MAlonzo.Code.Data.String.Base.d__'43''43'__20
                   (" = " :: Data.Text.Text)
                   (coe
                      MAlonzo.Code.Data.String.Base.d__'43''43'__20 v1
                      (";" :: Data.Text.Text))))
      MAlonzo.Code.Netlist.C_outputBitNode_86 v1 v2
        -> coe
             MAlonzo.Code.Data.String.Base.d__'43''43'__20
             ("  assign " :: Data.Text.Text)
             (coe
                MAlonzo.Code.Data.String.Base.d__'43''43'__20 v1
                (coe
                   MAlonzo.Code.Data.String.Base.d__'43''43'__20
                   (" = " :: Data.Text.Text)
                   (coe
                      MAlonzo.Code.Data.String.Base.d__'43''43'__20
                      (d_showBit_2 (coe v2)) (";" :: Data.Text.Text))))
      MAlonzo.Code.Netlist.C_outputVecNode_90 v1 v2 v3
        -> coe
             MAlonzo.Code.Data.String.Base.d__'43''43'__20
             ("  assign " :: Data.Text.Text)
             (coe
                MAlonzo.Code.Data.String.Base.d__'43''43'__20 v2
                (coe
                   MAlonzo.Code.Data.String.Base.d__'43''43'__20
                   (" = " :: Data.Text.Text)
                   (coe
                      MAlonzo.Code.Data.String.Base.d__'43''43'__20
                      (d_showVecAsLiteral_84 (coe v1) (coe v3))
                      (";" :: Data.Text.Text))))
      MAlonzo.Code.Netlist.C_invNode_92 v1 v2
        -> coe
             d_unarySVprimitive_96 (coe ("not " :: Data.Text.Text)) (coe v1)
             (coe v2)
      MAlonzo.Code.Netlist.C_and2Node_94 v1 v2 v3
        -> coe
             d_binarySVprimitive_104 (coe ("and " :: Data.Text.Text)) (coe v1)
             (coe v2) (coe v3)
      MAlonzo.Code.Netlist.C_or2Node_96 v1 v2 v3
        -> coe
             d_binarySVprimitive_104 (coe ("or " :: Data.Text.Text)) (coe v1)
             (coe v2) (coe v3)
      MAlonzo.Code.Netlist.C_xor2Node_98 v1 v2 v3
        -> coe
             d_binarySVprimitive_104 (coe ("xor " :: Data.Text.Text)) (coe v1)
             (coe v2) (coe v3)
      MAlonzo.Code.Netlist.C_addNode_102 v1 v2 v3 v4
        -> coe
             MAlonzo.Code.Data.String.Base.d__'43''43'__20
             ("  assign vec" :: Data.Text.Text)
             (coe
                MAlonzo.Code.Data.String.Base.d__'43''43'__20
                (coe MAlonzo.Code.Data.Nat.Show.d_show_56 v4)
                (coe
                   MAlonzo.Code.Data.String.Base.d__'43''43'__20
                   (" = " :: Data.Text.Text)
                   (coe
                      MAlonzo.Code.Data.String.Base.d__'43''43'__20
                      (d_showVecAsLiteral_84 (coe v1) (coe v2))
                      (coe
                         MAlonzo.Code.Data.String.Base.d__'43''43'__20
                         (" + " :: Data.Text.Text)
                         (coe
                            MAlonzo.Code.Data.String.Base.d__'43''43'__20
                            (d_showVecAsLiteral_84 (coe v1) (coe v3))
                            (";" :: Data.Text.Text))))))
      MAlonzo.Code.Netlist.C_lessThanNode_106 v1 v2 v3 v4
        -> coe
             MAlonzo.Code.Data.String.Base.d__'43''43'__20
             ("  assign " :: Data.Text.Text)
             (coe
                MAlonzo.Code.Data.String.Base.d__'43''43'__20
                (d_showBit_2 (coe v4))
                (coe
                   MAlonzo.Code.Data.String.Base.d__'43''43'__20
                   (" = " :: Data.Text.Text)
                   (coe
                      MAlonzo.Code.Data.String.Base.d__'43''43'__20
                      (d_showVecAsLiteral_84 (coe v1) (coe v2))
                      (coe
                         MAlonzo.Code.Data.String.Base.d__'43''43'__20
                         (" < " :: Data.Text.Text)
                         (coe
                            MAlonzo.Code.Data.String.Base.d__'43''43'__20
                            (d_showVecAsLiteral_84 (coe v1) (coe v3))
                            (";" :: Data.Text.Text))))))
      MAlonzo.Code.Netlist.C_muxNode_110 v1 v2 v3 v4 v5
        -> coe
             MAlonzo.Code.Data.String.Base.d__'43''43'__20
             ("  assign vec" :: Data.Text.Text)
             (coe
                MAlonzo.Code.Data.String.Base.d__'43''43'__20
                (coe MAlonzo.Code.Data.Nat.Show.d_show_56 v5)
                (coe
                   MAlonzo.Code.Data.String.Base.d__'43''43'__20
                   (" = " :: Data.Text.Text)
                   (coe
                      MAlonzo.Code.Data.String.Base.d__'43''43'__20
                      (d_showBit_2 (coe v2))
                      (coe
                         MAlonzo.Code.Data.String.Base.d__'43''43'__20
                         (" ? " :: Data.Text.Text)
                         (coe
                            MAlonzo.Code.Data.String.Base.d__'43''43'__20
                            (d_showVecAsLiteral_84 (coe v1) (coe v3))
                            (coe
                               MAlonzo.Code.Data.String.Base.d__'43''43'__20
                               (" : " :: Data.Text.Text)
                               (coe
                                  MAlonzo.Code.Data.String.Base.d__'43''43'__20
                                  (d_showVecAsLiteral_84 (coe v1) (coe v4))
                                  (";" :: Data.Text.Text))))))))
      _ -> MAlonzo.RTE.mazUnreachableError
-- SystemVerilog.showSVNodes
d_showSVNodes_182 ::
  [MAlonzo.Code.Netlist.T_CircuitNode_80] ->
  [MAlonzo.Code.Agda.Builtin.String.T_String_6]
d_showSVNodes_182
  = coe MAlonzo.Code.Data.List.Base.du_map_22 (coe d_showSVNode_114)
-- SystemVerilog.localNets
d_localNets_184 ::
  Integer -> [MAlonzo.Code.Agda.Builtin.String.T_String_6]
d_localNets_184 v0
  = case coe v0 of
      0 -> coe
             MAlonzo.Code.Data.List.Base.du_'91'_'93'_286
             (coe ("" :: Data.Text.Text))
      _ -> let v1 = subInt (coe v0) (coe (1 :: Integer)) in
           coe
             (coe
                MAlonzo.Code.Agda.Builtin.List.C__'8759'__22
                (coe
                   MAlonzo.Code.Data.String.Base.d__'43''43'__20
                   ("  logic net" :: Data.Text.Text)
                   (coe
                      MAlonzo.Code.Data.String.Base.d__'43''43'__20
                      (coe MAlonzo.Code.Data.Nat.Show.d_show_56 v1)
                      (";" :: Data.Text.Text)))
                (coe d_localNets_184 (coe v1)))
-- SystemVerilog.inputNameList
d_inputNameList_188 ::
  [MAlonzo.Code.Agda.Builtin.String.T_String_6] ->
  MAlonzo.Code.Agda.Builtin.String.T_String_6
d_inputNameList_188 v0
  = case coe v0 of
      [] -> coe ("" :: Data.Text.Text)
      (:) v1 v2
        -> coe
             MAlonzo.Code.Data.String.Base.d__'43''43'__20 v1
             (coe
                MAlonzo.Code.Data.String.Base.d__'43''43'__20
                (", " :: Data.Text.Text) (d_inputNameList_188 (coe v2)))
      _ -> MAlonzo.RTE.mazUnreachableError
-- SystemVerilog.outputNameList
d_outputNameList_194 ::
  [MAlonzo.Code.Agda.Builtin.String.T_String_6] ->
  MAlonzo.Code.Agda.Builtin.String.T_String_6
d_outputNameList_194 v0
  = case coe v0 of
      [] -> coe ("" :: Data.Text.Text)
      (:) v1 v2
        -> case coe v2 of
             []
               -> coe
                    MAlonzo.Code.Data.String.Base.d__'43''43'__20 v1
                    (");" :: Data.Text.Text)
             (:) v3 v4
               -> coe
                    MAlonzo.Code.Data.String.Base.d__'43''43'__20 v1
                    (coe
                       MAlonzo.Code.Data.String.Base.d__'43''43'__20
                       (", " :: Data.Text.Text) (d_outputNameList_194 (coe v2)))
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
-- SystemVerilog.showPort
d_showPort_204 ::
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14 ->
  MAlonzo.Code.Agda.Builtin.String.T_String_6
d_showPort_204 v0
  = case coe v0 of
      MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v1 v2
        -> case coe v2 of
             MAlonzo.Code.Netlist.C_BitType_76
               -> coe
                    MAlonzo.Code.Data.String.Base.d__'43''43'__20
                    ("logic " :: Data.Text.Text) v1
             MAlonzo.Code.Netlist.C_VectorType_78 v3
               -> case coe v3 of
                    0 -> coe ("<BAD VECTOR>" :: Data.Text.Text)
                    _ -> let v4 = subInt (coe v3) (coe (1 :: Integer)) in
                         coe
                           (coe
                              MAlonzo.Code.Data.String.Base.d__'43''43'__20
                              ("logic [" :: Data.Text.Text)
                              (coe
                                 MAlonzo.Code.Data.String.Base.d__'43''43'__20
                                 (coe MAlonzo.Code.Data.Nat.Show.d_show_56 v4)
                                 (coe
                                    MAlonzo.Code.Data.String.Base.d__'43''43'__20
                                    (":0] " :: Data.Text.Text) v1)))
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
-- SystemVerilog.showPorts
d_showPorts_214 ::
  [MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14] ->
  [MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14] ->
  [MAlonzo.Code.Agda.Builtin.String.T_String_6]
d_showPorts_214 v0 v1
  = case coe v0 of
      []
        -> case coe v1 of
             [] -> coe v1
             (:) v2 v3
               -> let v4
                        = coe
                            MAlonzo.Code.Agda.Builtin.List.C__'8759'__22
                            (coe
                               MAlonzo.Code.Data.String.Base.d__'43''43'__20
                               ("  output " :: Data.Text.Text)
                               (coe
                                  MAlonzo.Code.Data.String.Base.d__'43''43'__20
                                  (d_showPort_204 (coe v2)) ("," :: Data.Text.Text)))
                            (coe d_showPorts_214 (coe v0) (coe v3)) in
                  coe
                    (case coe v3 of
                       []
                         -> coe
                              MAlonzo.Code.Agda.Builtin.List.C__'8759'__22
                              (coe
                                 MAlonzo.Code.Data.String.Base.d__'43''43'__20
                                 ("  output " :: Data.Text.Text)
                                 (coe
                                    MAlonzo.Code.Data.String.Base.d__'43''43'__20
                                    (d_showPort_204 (coe v2)) (");" :: Data.Text.Text)))
                              (coe v3)
                       _ -> coe v4)
             _ -> MAlonzo.RTE.mazUnreachableError
      (:) v2 v3
        -> let v4
                 = coe
                     MAlonzo.Code.Agda.Builtin.List.C__'8759'__22
                     (coe
                        MAlonzo.Code.Data.String.Base.d__'43''43'__20
                        ("  input  " :: Data.Text.Text)
                        (coe
                           MAlonzo.Code.Data.String.Base.d__'43''43'__20
                           (d_showPort_204 (coe v2)) ("," :: Data.Text.Text)))
                     (coe d_showPorts_214 (coe v3) (coe v1)) in
           coe
             (case coe v3 of
                []
                  -> let v5
                           = coe
                               MAlonzo.Code.Agda.Builtin.List.C__'8759'__22
                               (coe
                                  MAlonzo.Code.Data.String.Base.d__'43''43'__20
                                  ("  input  " :: Data.Text.Text)
                                  (coe
                                     MAlonzo.Code.Data.String.Base.d__'43''43'__20
                                     (d_showPort_204 (coe v2)) ("," :: Data.Text.Text)))
                               (coe d_showPorts_214 (coe v3) (coe v1)) in
                     coe
                       (case coe v1 of
                          []
                            -> coe
                                 MAlonzo.Code.Agda.Builtin.List.C__'8759'__22
                                 (coe
                                    MAlonzo.Code.Data.String.Base.d__'43''43'__20
                                    ("  input " :: Data.Text.Text)
                                    (coe
                                       MAlonzo.Code.Data.String.Base.d__'43''43'__20
                                       (d_showPort_204 (coe v2)) (");" :: Data.Text.Text)))
                                 (coe v1)
                          _ -> coe v5)
                _ -> coe v4)
      _ -> MAlonzo.RTE.mazUnreachableError
-- SystemVerilog.declareVec
d_declareVec_234 ::
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14 ->
  MAlonzo.Code.Agda.Builtin.String.T_String_6
d_declareVec_234 v0
  = case coe v0 of
      MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v1 v2
        -> case coe v1 of
             MAlonzo.Code.Netlist.C_vecType_66 v3
               -> case coe v3 of
                    0 -> coe ("<BAD VECTOR>" :: Data.Text.Text)
                    _ -> let v4 = subInt (coe v3) (coe (1 :: Integer)) in
                         coe
                           (coe
                              MAlonzo.Code.Data.String.Base.d__'43''43'__20
                              ("  logic [" :: Data.Text.Text)
                              (coe
                                 MAlonzo.Code.Data.String.Base.d__'43''43'__20
                                 (coe MAlonzo.Code.Data.Nat.Show.d_show_56 v4)
                                 (coe
                                    MAlonzo.Code.Data.String.Base.d__'43''43'__20
                                    (":0] vec" :: Data.Text.Text)
                                    (coe
                                       MAlonzo.Code.Data.String.Base.d__'43''43'__20
                                       (coe MAlonzo.Code.Data.Nat.Show.d_show_56 v2)
                                       (";" :: Data.Text.Text)))))
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
-- SystemVerilog.declareVecs
d_declareVecs_240 ::
  [MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14] ->
  [MAlonzo.Code.Agda.Builtin.String.T_String_6]
d_declareVecs_240
  = coe MAlonzo.Code.Data.List.Base.du_map_22 (coe d_declareVec_234)
-- SystemVerilog.showSVLines
d_showSVLines_242 ::
  MAlonzo.Code.Netlist.T_NetlistInfo_112 ->
  [MAlonzo.Code.Agda.Builtin.String.T_String_6]
d_showSVLines_242 v0
  = coe
      MAlonzo.Code.Agda.Builtin.List.C__'8759'__22
      (coe
         MAlonzo.Code.Data.String.Base.d__'43''43'__20
         ("module " :: Data.Text.Text)
         (coe
            MAlonzo.Code.Data.String.Base.d__'43''43'__20
            (MAlonzo.Code.Netlist.d_circuitName_128 (coe v0))
            ("(" :: Data.Text.Text)))
      (coe
         MAlonzo.Code.Data.List.Base.du__'43''43'__32
         (coe
            d_showPorts_214
            (coe
               MAlonzo.Code.Data.List.Base.du_reverse_460
               (MAlonzo.Code.Netlist.d_inputPorts_136 (coe v0)))
            (coe
               MAlonzo.Code.Data.List.Base.du_reverse_460
               (MAlonzo.Code.Netlist.d_outputPorts_138 (coe v0))))
         (coe
            MAlonzo.Code.Data.List.Base.du__'43''43'__32
            (coe
               d_localNets_184 (coe MAlonzo.Code.Netlist.d_netCount_130 (coe v0)))
            (coe
               MAlonzo.Code.Data.List.Base.du__'43''43'__32
               (coe
                  d_declareVecs_240
                  (coe
                     MAlonzo.Code.Data.List.Base.du_reverse_460
                     (MAlonzo.Code.Netlist.d_vecDefs_134 (coe v0))))
               (coe
                  MAlonzo.Code.Data.List.Base.du__'43''43'__32
                  (coe d_showSVNodes_182 (MAlonzo.Code.Netlist.d_nodes_140 (coe v0)))
                  (coe
                     MAlonzo.Code.Data.List.Base.du_'91'_'93'_286
                     (coe
                        MAlonzo.Code.Data.String.Base.d__'43''43'__20
                        ("endmodule: " :: Data.Text.Text)
                        (MAlonzo.Code.Netlist.d_circuitName_128 (coe v0))))))))
-- SystemVerilog.netlistToSystemVerilog
d_netlistToSystemVerilog_246 ::
  MAlonzo.Code.Netlist.T_NetlistInfo_112 ->
  MAlonzo.Code.Agda.Builtin.String.T_String_6
d_netlistToSystemVerilog_246 v0
  = coe
      MAlonzo.Code.Data.String.Base.d_unlines_36
      (d_showSVLines_242 (coe v0))
-- SystemVerilog.circuitToSystemVerilog
d_circuitToSystemVerilog_248 ::
  MAlonzo.Code.Effect.Monad.State.Transformer.Base.T_StateT_56 ->
  MAlonzo.Code.Agda.Builtin.String.T_String_6
d_circuitToSystemVerilog_248 v0
  = coe
      MAlonzo.Code.Data.String.Base.d_unlines_36
      (d_showSVLines_242
         (coe MAlonzo.Code.Netlist.d_makeNetlist_318 (coe v0)))
