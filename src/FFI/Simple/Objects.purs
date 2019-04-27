module FFI.Simple.Objects
  ( typeOf, instanceOf, named
  , (..), getProperty,    getProperty'
  , (.=), setProperty,    setProperty'
  , (!=), defineProperty, defineProperty'
  ) where

import Prelude ( flip )
import Data.Function.Uncurried ( Fn2, runFn2, Fn3, runFn3 )

-- | Gets the type of an object with javascript `typeof`
typeOf :: forall a. a -> String
typeOf = _typeof

foreign import _typeof :: forall a. a -> String

-- | Gets the type of an object with javascript `typeof`
instanceOf :: forall a b. a -> b -> Boolean
instanceOf = runFn2 _instanceof

foreign import _instanceof :: forall a b. Fn2 a b Boolean

-- | Return the object with a custom name
-- | Notes:
-- |  - `name` is a readonly property, so we define over it
-- |  - quietly mutates the input - use immediately after creation
named :: forall o. String -> o -> o
named n o = (o != "name") n

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

