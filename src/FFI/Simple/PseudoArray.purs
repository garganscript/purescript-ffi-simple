-- Utilities for turning pseudoarrays into arrays
module FFI.Simple.PseudoArray
  ( PseudoArray, length, from, drop, slice, unshift
  ) where

import FFI.Simple.Objects (getProperty)
import Data.Function.Uncurried (Fn2, runFn2, Fn3, runFn3)

foreign import data PseudoArray :: Type

-- | Gets the length of a pseudoarray
length :: forall a. a -> Int
length = getProperty "length"

-- | Given a pseudoarray, turns it into a proper array
from :: forall a t. a -> Array t
from = _from

foreign import _from :: forall a t. a -> Array t

-- | Given a pseudoarray, turns all but the first n items into a
-- | proper array
drop :: forall a t. Int -> a -> Array t
drop = runFn2 _drop

foreign import _drop :: forall a b. Fn2 Int a (Array b)

-- | Given a pseudoarray, turns items n through m into a proper array
slice :: forall a t. Int -> Int -> a -> Array t
slice = runFn3 _slice

foreign import _slice :: forall a b. Fn3 Int Int a (Array b)

unshift :: forall a b. a -> Array b -> Array b
unshift = runFn2 _unshift

foreign import _unshift :: forall a b. Fn2 a (Array b) (Array b)
