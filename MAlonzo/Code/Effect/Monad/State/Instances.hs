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

module MAlonzo.Code.Effect.Monad.State.Instances where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Algebra.Bundles.Raw
import qualified MAlonzo.Code.Effect.Applicative
import qualified MAlonzo.Code.Effect.Choice
import qualified MAlonzo.Code.Effect.Empty
import qualified MAlonzo.Code.Effect.Functor
import qualified MAlonzo.Code.Effect.Monad
import qualified MAlonzo.Code.Effect.Monad.State.Transformer
import qualified MAlonzo.Code.Effect.Monad.State.Transformer.Base

-- Effect.Monad.State.Instances.stateTFunctor
d_stateTFunctor_8 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  () ->
  MAlonzo.Code.Effect.Functor.T_RawFunctor_24 ->
  MAlonzo.Code.Effect.Functor.T_RawFunctor_24
d_stateTFunctor_8 ~v0 ~v1 ~v2 ~v3 v4 = du_stateTFunctor_8 v4
du_stateTFunctor_8 ::
  MAlonzo.Code.Effect.Functor.T_RawFunctor_24 ->
  MAlonzo.Code.Effect.Functor.T_RawFunctor_24
du_stateTFunctor_8 v0
  = coe
      MAlonzo.Code.Effect.Monad.State.Transformer.du_functor_24 (coe v0)
-- Effect.Monad.State.Instances.stateTApplicative
d_stateTApplicative_20 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  () ->
  MAlonzo.Code.Effect.Monad.T_RawMonad_24 ->
  MAlonzo.Code.Effect.Applicative.T_RawApplicative_20
d_stateTApplicative_20 ~v0 ~v1 ~v2 ~v3 v4
  = du_stateTApplicative_20 v4
du_stateTApplicative_20 ::
  MAlonzo.Code.Effect.Monad.T_RawMonad_24 ->
  MAlonzo.Code.Effect.Applicative.T_RawApplicative_20
du_stateTApplicative_20 v0
  = coe
      MAlonzo.Code.Effect.Monad.State.Transformer.du_applicative_48
      (coe v0)
-- Effect.Monad.State.Instances.stateTEmpty
d_stateTEmpty_32 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  () ->
  MAlonzo.Code.Effect.Empty.T_RawEmpty_16 ->
  MAlonzo.Code.Effect.Empty.T_RawEmpty_16
d_stateTEmpty_32 ~v0 ~v1 ~v2 ~v3 v4 = du_stateTEmpty_32 v4
du_stateTEmpty_32 ::
  MAlonzo.Code.Effect.Empty.T_RawEmpty_16 ->
  MAlonzo.Code.Effect.Empty.T_RawEmpty_16
du_stateTEmpty_32 v0
  = coe
      MAlonzo.Code.Effect.Monad.State.Transformer.du_empty_130 (coe v0)
-- Effect.Monad.State.Instances.stateTChoice
d_stateTChoice_44 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  () ->
  MAlonzo.Code.Effect.Choice.T_RawChoice_16 ->
  MAlonzo.Code.Effect.Choice.T_RawChoice_16
d_stateTChoice_44 ~v0 ~v1 ~v2 ~v3 v4 = du_stateTChoice_44 v4
du_stateTChoice_44 ::
  MAlonzo.Code.Effect.Choice.T_RawChoice_16 ->
  MAlonzo.Code.Effect.Choice.T_RawChoice_16
du_stateTChoice_44 v0
  = coe
      MAlonzo.Code.Effect.Monad.State.Transformer.du_choice_134 (coe v0)
-- Effect.Monad.State.Instances.stateTApplicativeZero
d_stateTApplicativeZero_56 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  () ->
  MAlonzo.Code.Effect.Monad.T_RawMonadZero_206 ->
  MAlonzo.Code.Effect.Applicative.T_RawApplicativeZero_120
d_stateTApplicativeZero_56 ~v0 ~v1 ~v2 ~v3 v4
  = du_stateTApplicativeZero_56 v4
du_stateTApplicativeZero_56 ::
  MAlonzo.Code.Effect.Monad.T_RawMonadZero_206 ->
  MAlonzo.Code.Effect.Applicative.T_RawApplicativeZero_120
du_stateTApplicativeZero_56 v0
  = coe
      MAlonzo.Code.Effect.Monad.State.Transformer.du_applicativeZero_154
      (coe v0)
-- Effect.Monad.State.Instances.stateTAlternative
d_stateTAlternative_68 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  () ->
  MAlonzo.Code.Effect.Monad.T_RawMonadPlus_284 ->
  MAlonzo.Code.Effect.Applicative.T_RawAlternative_180
d_stateTAlternative_68 ~v0 ~v1 ~v2 ~v3 v4
  = du_stateTAlternative_68 v4
du_stateTAlternative_68 ::
  MAlonzo.Code.Effect.Monad.T_RawMonadPlus_284 ->
  MAlonzo.Code.Effect.Applicative.T_RawAlternative_180
du_stateTAlternative_68 v0
  = coe
      MAlonzo.Code.Effect.Monad.State.Transformer.du_alternative_158
      (coe v0)
-- Effect.Monad.State.Instances.stateTMonad
d_stateTMonad_80 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  () ->
  MAlonzo.Code.Effect.Monad.T_RawMonad_24 ->
  MAlonzo.Code.Effect.Monad.T_RawMonad_24
d_stateTMonad_80 ~v0 ~v1 ~v2 ~v3 v4 = du_stateTMonad_80 v4
du_stateTMonad_80 ::
  MAlonzo.Code.Effect.Monad.T_RawMonad_24 ->
  MAlonzo.Code.Effect.Monad.T_RawMonad_24
du_stateTMonad_80 v0
  = coe
      MAlonzo.Code.Effect.Monad.State.Transformer.du_monad_238 (coe v0)
-- Effect.Monad.State.Instances.stateTMonadZero
d_stateTMonadZero_92 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  () ->
  MAlonzo.Code.Effect.Monad.T_RawMonadZero_206 ->
  MAlonzo.Code.Effect.Monad.T_RawMonadZero_206
d_stateTMonadZero_92 ~v0 ~v1 ~v2 ~v3 v4 = du_stateTMonadZero_92 v4
du_stateTMonadZero_92 ::
  MAlonzo.Code.Effect.Monad.T_RawMonadZero_206 ->
  MAlonzo.Code.Effect.Monad.T_RawMonadZero_206
du_stateTMonadZero_92 v0
  = coe
      MAlonzo.Code.Effect.Monad.State.Transformer.du_monadZero_310
      (coe v0)
-- Effect.Monad.State.Instances.stateTMonadPlus
d_stateTMonadPlus_104 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  () ->
  MAlonzo.Code.Effect.Monad.T_RawMonadPlus_284 ->
  MAlonzo.Code.Effect.Monad.T_RawMonadPlus_284
d_stateTMonadPlus_104 ~v0 ~v1 ~v2 ~v3 v4
  = du_stateTMonadPlus_104 v4
du_stateTMonadPlus_104 ::
  MAlonzo.Code.Effect.Monad.T_RawMonadPlus_284 ->
  MAlonzo.Code.Effect.Monad.T_RawMonadPlus_284
du_stateTMonadPlus_104 v0
  = coe
      MAlonzo.Code.Effect.Monad.State.Transformer.du_monadPlus_314
      (coe v0)
-- Effect.Monad.State.Instances.stateTMonadT
d_stateTMonadT_116 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  (() -> ()) ->
  MAlonzo.Code.Effect.Monad.T_RawMonad_24 ->
  MAlonzo.Code.Effect.Monad.T_RawMonadTd_376
d_stateTMonadT_116 ~v0 ~v1 ~v2 ~v3 v4 = du_stateTMonadT_116 v4
du_stateTMonadT_116 ::
  MAlonzo.Code.Effect.Monad.T_RawMonad_24 ->
  MAlonzo.Code.Effect.Monad.T_RawMonadTd_376
du_stateTMonadT_116 v0
  = coe
      MAlonzo.Code.Effect.Monad.State.Transformer.du_monadT_394 (coe v0)
-- Effect.Monad.State.Instances.stateTMonadState
d_stateTMonadState_128 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  () ->
  MAlonzo.Code.Effect.Monad.T_RawMonad_24 ->
  MAlonzo.Code.Effect.Monad.State.Transformer.Base.T_RawMonadState_28
d_stateTMonadState_128 ~v0 ~v1 ~v2 ~v3 v4
  = du_stateTMonadState_128 v4
du_stateTMonadState_128 ::
  MAlonzo.Code.Effect.Monad.T_RawMonad_24 ->
  MAlonzo.Code.Effect.Monad.State.Transformer.Base.T_RawMonadState_28
du_stateTMonadState_128 v0
  = coe
      MAlonzo.Code.Effect.Monad.State.Transformer.du_monadState_460
      (coe v0)
-- Effect.Monad.State.Instances.stateTLiftReaderT
d_stateTLiftReaderT_140 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  () ->
  MAlonzo.Code.Effect.Monad.State.Transformer.Base.T_RawMonadState_28 ->
  MAlonzo.Code.Effect.Monad.State.Transformer.Base.T_RawMonadState_28
d_stateTLiftReaderT_140 ~v0 ~v1 ~v2 ~v3 ~v4 v5
  = du_stateTLiftReaderT_140 v5
du_stateTLiftReaderT_140 ::
  MAlonzo.Code.Effect.Monad.State.Transformer.Base.T_RawMonadState_28 ->
  MAlonzo.Code.Effect.Monad.State.Transformer.Base.T_RawMonadState_28
du_stateTLiftReaderT_140 v0
  = coe
      MAlonzo.Code.Effect.Monad.State.Transformer.du_liftReaderT_556
      (coe v0)
-- Effect.Monad.State.Instances.stateTLiftWriterT
d_stateTLiftWriterT_154 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  () ->
  MAlonzo.Code.Effect.Functor.T_RawFunctor_24 ->
  MAlonzo.Code.Algebra.Bundles.Raw.T_RawMonoid_64 ->
  MAlonzo.Code.Effect.Monad.State.Transformer.Base.T_RawMonadState_28 ->
  MAlonzo.Code.Effect.Monad.State.Transformer.Base.T_RawMonadState_28
d_stateTLiftWriterT_154 ~v0 ~v1 ~v2 ~v3 ~v4 v5 ~v6 v7
  = du_stateTLiftWriterT_154 v5 v7
du_stateTLiftWriterT_154 ::
  MAlonzo.Code.Effect.Functor.T_RawFunctor_24 ->
  MAlonzo.Code.Effect.Monad.State.Transformer.Base.T_RawMonadState_28 ->
  MAlonzo.Code.Effect.Monad.State.Transformer.Base.T_RawMonadState_28
du_stateTLiftWriterT_154 v0 v1
  = coe
      MAlonzo.Code.Effect.Monad.State.Transformer.du_liftWriterT_580
      (coe v0) (coe v1)
