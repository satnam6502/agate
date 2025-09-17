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

module MAlonzo.Code.Effect.Monad.Writer.Transformer.Base where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Algebra.Bundles.Raw
import qualified MAlonzo.Code.Data.Unit.Polymorphic.Base
import qualified MAlonzo.Code.Effect.Functor

-- Effect.Monad.Writer.Transformer.Base.RawMonadWriter
d_RawMonadWriter_32 a0 a1 a2 a3 a4 = ()
data T_RawMonadWriter_32
  = C_RawMonadWriter'46'constructor_907 (() ->
                                         MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14 -> AgdaAny)
                                        (() -> AgdaAny -> AgdaAny) (() -> AgdaAny -> AgdaAny)
-- Effect.Monad.Writer.Transformer.Base._.Carrier
d_Carrier_46 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Algebra.Bundles.Raw.T_RawMonoid_64 -> (() -> ()) -> ()
d_Carrier_46 = erased
-- Effect.Monad.Writer.Transformer.Base.RawMonadWriter._.Carrier
d_Carrier_66 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Algebra.Bundles.Raw.T_RawMonoid_64 ->
  (() -> ()) -> T_RawMonadWriter_32 -> ()
d_Carrier_66 = erased
-- Effect.Monad.Writer.Transformer.Base.RawMonadWriter.writer
d_writer_72 ::
  T_RawMonadWriter_32 ->
  () -> MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14 -> AgdaAny
d_writer_72 v0
  = case coe v0 of
      C_RawMonadWriter'46'constructor_907 v1 v2 v3 -> coe v1
      _ -> MAlonzo.RTE.mazUnreachableError
-- Effect.Monad.Writer.Transformer.Base.RawMonadWriter.listen
d_listen_74 :: T_RawMonadWriter_32 -> () -> AgdaAny -> AgdaAny
d_listen_74 v0
  = case coe v0 of
      C_RawMonadWriter'46'constructor_907 v1 v2 v3 -> coe v2
      _ -> MAlonzo.RTE.mazUnreachableError
-- Effect.Monad.Writer.Transformer.Base.RawMonadWriter.pass
d_pass_76 :: T_RawMonadWriter_32 -> () -> AgdaAny -> AgdaAny
d_pass_76 v0
  = case coe v0 of
      C_RawMonadWriter'46'constructor_907 v1 v2 v3 -> coe v3
      _ -> MAlonzo.RTE.mazUnreachableError
-- Effect.Monad.Writer.Transformer.Base.RawMonadWriter.tell
d_tell_78 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Algebra.Bundles.Raw.T_RawMonoid_64 ->
  (() -> ()) -> T_RawMonadWriter_32 -> AgdaAny -> AgdaAny
d_tell_78 ~v0 ~v1 ~v2 ~v3 ~v4 v5 v6 = du_tell_78 v5 v6
du_tell_78 :: T_RawMonadWriter_32 -> AgdaAny -> AgdaAny
du_tell_78 v0 v1
  = coe
      d_writer_72 v0 erased
      (coe
         MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 (coe v1)
         (coe MAlonzo.Code.Data.Unit.Polymorphic.Base.du_tt_16))
-- Effect.Monad.Writer.Transformer.Base.WriterT
d_WriterT_94 a0 a1 a2 a3 a4 a5 = ()
newtype T_WriterT_94 = C_mkWriterT_134 (AgdaAny -> AgdaAny)
-- Effect.Monad.Writer.Transformer.Base._.Carrier
d_Carrier_110 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Algebra.Bundles.Raw.T_RawMonoid_64 ->
  (() -> ()) -> () -> ()
d_Carrier_110 = erased
-- Effect.Monad.Writer.Transformer.Base.WriterT.runWriterT
d_runWriterT_132 :: T_WriterT_94 -> AgdaAny -> AgdaAny
d_runWriterT_132 v0
  = case coe v0 of
      C_mkWriterT_134 v1 -> coe v1
      _ -> MAlonzo.RTE.mazUnreachableError
-- Effect.Monad.Writer.Transformer.Base._.evalWriterT
d_evalWriterT_160 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Algebra.Bundles.Raw.T_RawMonoid_64 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  () ->
  MAlonzo.Code.Effect.Functor.T_RawFunctor_24 ->
  T_WriterT_94 -> AgdaAny
d_evalWriterT_160 ~v0 ~v1 v2 ~v3 ~v4 ~v5 v6 v7
  = du_evalWriterT_160 v2 v6 v7
du_evalWriterT_160 ::
  MAlonzo.Code.Algebra.Bundles.Raw.T_RawMonoid_64 ->
  MAlonzo.Code.Effect.Functor.T_RawFunctor_24 ->
  T_WriterT_94 -> AgdaAny
du_evalWriterT_160 v0 v1 v2
  = coe
      MAlonzo.Code.Effect.Functor.d__'60''36''62'__30 v1 erased erased
      (\ v3 -> MAlonzo.Code.Agda.Builtin.Sigma.d_snd_30 (coe v3))
      (coe
         d_runWriterT_132 v2
         (MAlonzo.Code.Algebra.Bundles.Raw.d_ε_84 (coe v0)))
-- Effect.Monad.Writer.Transformer.Base._.execWriterT
d_execWriterT_180 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  MAlonzo.Code.Algebra.Bundles.Raw.T_RawMonoid_64 ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) ->
  () ->
  MAlonzo.Code.Effect.Functor.T_RawFunctor_24 ->
  T_WriterT_94 -> AgdaAny
d_execWriterT_180 ~v0 ~v1 v2 ~v3 ~v4 ~v5 v6 v7
  = du_execWriterT_180 v2 v6 v7
du_execWriterT_180 ::
  MAlonzo.Code.Algebra.Bundles.Raw.T_RawMonoid_64 ->
  MAlonzo.Code.Effect.Functor.T_RawFunctor_24 ->
  T_WriterT_94 -> AgdaAny
du_execWriterT_180 v0 v1 v2
  = coe
      MAlonzo.Code.Effect.Functor.d__'60''36''62'__30 v1 erased erased
      (\ v3 -> MAlonzo.Code.Agda.Builtin.Sigma.d_fst_28 (coe v3))
      (coe
         d_runWriterT_132 v2
         (MAlonzo.Code.Algebra.Bundles.Raw.d_ε_84 (coe v0)))
