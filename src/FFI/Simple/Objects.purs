module FFI.Simple.Objects
  ( typeOf, instanceOf, named, downcast, isIn, hasOwnProperty
  , (..), getProperty,    getProperty'
  , (.?), maybeGetProperty, maybeGetProperty'
  , (.=), setProperty,    setProperty'
  , (!=), defineProperty, defineProperty'
  ) where

import Prelude ( flip, (<<<) )
import Data.Maybe ( Maybe(..) )
import Data.Function.Uncurried ( Fn2, runFn2, Fn3, runFn3 )
import FFI.Simple.Undef (maybeUndef)
import Unsafe.Coerce ( unsafeCoerce )

-- | Gets the type of an object with javascript `typeof`
typeOf :: forall a. a -> String
typeOf = _typeof

foreign import _typeof :: forall a. a -> String

-- | Checks whether an object is an instance of an invokable
instanceOf :: forall a b. a -> b -> Boolean
instanceOf = runFn2 _instanceof

foreign import _instanceof :: forall a b. Fn2 a b Boolean

-- | Return the object with a custom name
-- | Notes:
-- |  - `name` is a readonly property, so we define over it
-- |  - quietly mutates the input - use immediately after creation
named :: forall o. String -> o -> o
named n o = (o != "name") n

-- | Is the given property found on the given object or via inheritance/
isIn :: forall a. String -> a -> Boolean
isIn = runFn2 _isIn

foreign import _isIn :: forall a b. Fn2 a b Boolean

-- | Does this object have the given property itself (i.e. not inherited)?
hasOwnProperty :: forall o. String -> o -> Boolean
hasOwnProperty = runFn2 _hasOwnProperty

foreign import _hasOwnProperty :: forall o. Fn2 String o Boolean

-- | Attempts to get a property from an object, returning Nothing if it was undefined
maybeGetProperty :: forall o v. String -> o -> Maybe v
maybeGetProperty p = maybeUndef <<< getProperty p

-- | flip maybeGetProperty
maybeGetProperty' :: forall o v. o -> String -> Maybe v
maybeGetProperty' = flip maybeGetProperty

infixl 9 maybeGetProperty' as .?

-- | Get the property with the given name form the given object
-- | If property does not exist, will be undefined (see `F.S.Undef`)
getProperty :: forall o v. String -> o -> v
getProperty = runFn2 _getProperty

foreign import _getProperty :: forall o v. Fn2 String o v

infixl 9 getProperty' as ..

-- | flip getProperty
getProperty' :: forall o v. o -> String -> v
getProperty' = flip getProperty

-- | Sets a property on an object
-- | Notes:
-- |   - Will probably throw an error if you try to set a readonly property
-- |   - Is meant to be used in Effect
setProperty :: forall o v. String -> o -> v -> o
setProperty = runFn3 _setProperty

infix 9 setProperty' as .=

-- | flip setProperty
setProperty' :: forall o v. o -> String -> v -> o
setProperty' = flip setProperty

foreign import _setProperty :: forall o v. Fn3 String o v o


-- | Defines a new readonly property. Useful for e.g. `name` which is a readonly prop
defineProperty :: forall o v. String -> o -> v -> o
defineProperty = runFn3 _defineProperty

infix 9 defineProperty' as !=

defineProperty' :: forall o v. o -> String -> v -> o
defineProperty' = flip defineProperty

foreign import _defineProperty :: forall o v. Fn3 String o v o

-- | Attempt to cast to a type given a constructor for it
downcast :: forall ctor from to. ctor -> from -> Maybe to
downcast ctor from =
  if from `instanceOf` ctor
  then Just (unsafeCoerce from)
  else Nothing

