module FFI.Simple.Objects
  ( typeof, (..), getProperty, getProperty', setProperty, defineProperty ) where

import Prelude ( flip )
import Data.Function.Uncurried ( Fn2, runFn2, Fn3, runFn3 )

-- | Gets the type of an object with javascript `typeof`
typeof :: forall a. a -> String
typeof = _typeof

foreign import _typeof :: forall a. a -> String

-- TODO: figure out what i should be
infixl 4 getProperty' as ..

-- | Get the property with the given name form the given object
getProperty :: forall o v. String -> o -> v
getProperty = runFn2 _getProperty

foreign import _getProperty :: forall o v. Fn2 String o v

-- | flip getProperty
getProperty' :: forall o v. o -> String -> v
getProperty' = flip getProperty


-- | Sets a property
setProperty :: forall o v. String -> o -> v -> o
setProperty = runFn3 _setProperty

foreign import _setProperty :: forall o v. Fn3 String o v o

-- | Sets a property
defineProperty :: forall o v. String -> o -> v -> o
defineProperty = runFn3 _defineProperty

foreign import _defineProperty :: forall o v. Fn3 String o v o

