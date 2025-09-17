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

module MAlonzo.Code.Combinators where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Effect.Applicative
import qualified MAlonzo.Code.Effect.Monad

-- Combinators._||_
d__'124''124'__66 ::
  () ->
  () ->
  () ->
  () ->
  (() -> ()) ->
  MAlonzo.Code.Effect.Monad.T_RawMonad_24 ->
  (AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny) ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14 -> AgdaAny
d__'124''124'__66 ~v0 ~v1 ~v2 ~v3 ~v4 v5 v6 v7 v8
  = du__'124''124'__66 v5 v6 v7 v8
du__'124''124'__66 ::
  MAlonzo.Code.Effect.Monad.T_RawMonad_24 ->
  (AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny) ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14 -> AgdaAny
du__'124''124'__66 v0 v1 v2 v3
  = case coe v3 of
      MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 v4 v5
        -> coe
             MAlonzo.Code.Effect.Monad.d__'62''62''61'__34 v0 erased erased
             (coe v1 v4)
             (\ v6 ->
                coe
                  MAlonzo.Code.Effect.Monad.d__'62''62''61'__34 v0 erased erased
                  (coe v2 v5)
                  (\ v7 ->
                     coe
                       MAlonzo.Code.Effect.Applicative.d_pure_32
                       (MAlonzo.Code.Effect.Monad.d_rawApplicative_32 (coe v0)) erased
                       (coe
                          MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v6) (coe v7))))
      _ -> MAlonzo.RTE.mazUnreachableError
