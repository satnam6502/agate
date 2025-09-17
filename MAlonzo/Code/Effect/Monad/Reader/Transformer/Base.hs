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

module MAlonzo.Code.Effect.Monad.Reader.Transformer.Base where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Primitive

-- Effect.Monad.Reader.Transformer.Base.RawMonadReader
d_RawMonadReader_22 a0 a1 a2 a3 = ()
data T_RawMonadReader_22
  = C_RawMonadReader'46'constructor_279 (() ->
                                         (AgdaAny -> AgdaAny) -> AgdaAny)
                                        (() -> (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny)
-- Effect.Monad.Reader.Transformer.Base.RawMonadReader.reader
d_reader_30 ::
  T_RawMonadReader_22 -> () -> (AgdaAny -> AgdaAny) -> AgdaAny
d_reader_30 v0
  = case coe v0 of
      C_RawMonadReader'46'constructor_279 v1 v2 -> coe v1
      _ -> MAlonzo.RTE.mazUnreachableError
-- Effect.Monad.Reader.Transformer.Base.RawMonadReader.local
d_local_32 ::
  T_RawMonadReader_22 ->
  () -> (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
d_local_32 v0
  = case coe v0 of
      C_RawMonadReader'46'constructor_279 v1 v2 -> coe v2
      _ -> MAlonzo.RTE.mazUnreachableError
-- Effect.Monad.Reader.Transformer.Base.RawMonadReader.ask
d_ask_34 ::
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_18 ->
  (() -> ()) -> T_RawMonadReader_22 -> AgdaAny
d_ask_34 ~v0 ~v1 ~v2 ~v3 v4 = du_ask_34 v4
du_ask_34 :: T_RawMonadReader_22 -> AgdaAny
du_ask_34 v0 = coe d_reader_30 v0 erased (\ v1 -> v1)
-- Effect.Monad.Reader.Transformer.Base.ReaderT
d_ReaderT_42 a0 a1 a2 a3 a4 = ()
newtype T_ReaderT_42 = C_mkReaderT_52 (AgdaAny -> AgdaAny)
-- Effect.Monad.Reader.Transformer.Base.ReaderT.runReaderT
d_runReaderT_50 :: T_ReaderT_42 -> AgdaAny -> AgdaAny
d_runReaderT_50 v0
  = case coe v0 of
      C_mkReaderT_52 v1 -> coe v1
      _ -> MAlonzo.RTE.mazUnreachableError
