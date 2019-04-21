module FFI.Simple.Objects.Spec ( objectsSpec ) where

import Prelude
import Data.Array as A
import Data.Maybe ( Maybe(..), isJust )
import Data.Traversable ( traverse, sequence_ )
import Data.Tuple ( Tuple(..) )

import Test.Spec ( Spec, describe, it )
import Test.Spec.Assertions ( shouldEqual )
-- import Test.Spec.QuickCheck (quickCheck')

import FFI.Simple.Objects

objectsSpec :: Spec Unit
objectsSpec = describe "Objects" $ do
  it "typeof" $ do
    typeof "" `shouldEqual` "string"
    typeof 123 `shouldEqual` "number"
  it "getProperty" $ do
    getProperty "existent" {existent: 123} `shouldEqual` 123
    typeof (getProperty "nonexistent" {}) `shouldEqual` "undefined"
  it "(..)" $ do
    ({existent: 123} .. "existent") `shouldEqual` 123
  it "setProperty" $ do
    getProperty "created" (setProperty "created" {} 123) `shouldEqual` 123
    getProperty "name" (defineProperty "name" {} "terrible") `shouldEqual` "terrible"
