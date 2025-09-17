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

module MAlonzo.Code.Effect.Monad.Identity.Instances where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Effect.Applicative
import qualified MAlonzo.Code.Effect.Comonad
import qualified MAlonzo.Code.Effect.Functor
import qualified MAlonzo.Code.Effect.Monad
import qualified MAlonzo.Code.Effect.Monad.Identity

-- Effect.Monad.Identity.Instances.identityFunctor
d_identityFunctor_8 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Effect.Functor.T_RawFunctor_24
d_identityFunctor_8 v0
  = coe MAlonzo.Code.Effect.Monad.Identity.du_functor_24
-- Effect.Monad.Identity.Instances.identityApplicative
d_identityApplicative_10 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Effect.Applicative.T_RawApplicative_20
d_identityApplicative_10 v0
  = coe MAlonzo.Code.Effect.Monad.Identity.du_applicative_30
-- Effect.Monad.Identity.Instances.identityMonad
d_identityMonad_12 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Effect.Monad.T_RawMonad_24
d_identityMonad_12 v0
  = coe MAlonzo.Code.Effect.Monad.Identity.du_monad_36
-- Effect.Monad.Identity.Instances.identityComonad
d_identityComonad_14 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Effect.Comonad.T_RawComonad_22
d_identityComonad_14 v0
  = coe MAlonzo.Code.Effect.Monad.Identity.du_comonad_38
