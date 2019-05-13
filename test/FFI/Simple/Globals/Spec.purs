module FFI.Simple.Globals.Spec ( globalsSpec ) where

import Prelude
import Data.Array as A
import Data.Maybe ( Maybe(..), isJust )
import Data.Traversable ( traverse, sequence_ )
import Data.Tuple ( Tuple(..) )
import Data.Tuple.Nested ( (/\) )

import Test.Spec ( Spec, describe, it )
import Test.Spec.Assertions (shouldEqual, fail)
import Unsafe.Reference (unsafeRefEq)

import FFI.Simple.Functions
import FFI.Simple.Objects
import FFI.Simple.Globals

foreign import data Object :: Type

foreign import _object :: Object

instance showObject :: Show Object where
  show _ = "<object>" -- yes, this could be more helpful

instance eqObject :: Eq Object where
  eq = unsafeRefEq

globalsSpec :: Spec Unit
globalsSpec = describe "Globals" $ do
  it "global" $
    case global "global" of
      Just (g :: Object) ->
        case g .? "global" of
          Just (g2 :: Object) -> g `shouldEqual` g2
          Nothing -> fail "`global.global` was not found"
      Nothing -> fail "`global was not found`"
