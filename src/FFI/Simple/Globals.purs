module FFI.Simple.Globals
  ( global, unsafeGlobal ) where

import Data.Maybe ( Maybe )
import FFI.Simple.Undef ( nullUndef )
import Data.Nullable ( toMaybe )

global :: forall t. String -> Maybe t
global n = toMaybe (nullUndef (unsafeGlobal n))

unsafeGlobal :: forall t. String -> t
unsafeGlobal = _global

foreign import _global :: forall t. String -> t
