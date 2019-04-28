-- Utilities for handling unwanted undefs when you are lying about
-- their existence in the types
module FFI.Simple.Undef
  ( Undef, undef
  , isUndef
  , defaultUndef, nullUndef
  ) where

import Prelude ( (<<<), (==) )
import Data.Nullable ( Nullable, null )
import Unsafe.Coerce ( unsafeCoerce )

foreign import data Undef :: Type

undef :: Undef
undef = _undef

foreign import _undef :: Undef

isUndef :: forall a. a -> Boolean
isUndef = _isUndef

foreign import _isUndef :: forall a. a -> Boolean

-- Given a value which may quietly be undef (i.e. you are lying
-- about the type), return the value, or a default if it is undef
defaultUndef :: forall a. a -> a -> a
defaultUndef w v = if isUndef v then w else v

-- Given a value which may quietly be undef (i.e. you are lying about
-- the type), return the value, or null by adding Nullable to the type
nullUndef :: forall a. a -> Nullable a
nullUndef = _nullUndef

foreign import _nullUndef :: forall a. a -> Nullable a

