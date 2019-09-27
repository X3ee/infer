(*
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 *)

open! IStd

let is_nonnull annotated_nullability =
  match annotated_nullability with
  | AnnotatedNullability.Nullable _ ->
      false
  | AnnotatedNullability.Nonnull _ ->
      true


let passes_assignment_rule ~lhs ~rhs =
  (not (is_nonnull lhs)) || not (InferredNullability.is_nullable rhs)