module FFI.Simple.Globals where

import Data.Maybe ( Maybe )
import FFI.Simple.Objects 
import FFI.Simple.Undef ( nullUndef )
import Data.Nullable ( Nullable, toMaybe )

global :: forall t. String -> Maybe t
global n = toMaybe (nullUndef (_global n))

foreign import _global :: forall t. String -> t
