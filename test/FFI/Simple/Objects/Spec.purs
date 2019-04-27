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
  it "typeOf" $ do
    typeOf "" `shouldEqual` "string"
    typeOf 123 `shouldEqual` "number"
  it "instanceOf" $ pure unit
  it "named" $ do
    named "hello" {} .. "name" # shouldEqual "hello"
  it "(..)" $ do
    {existent: 123} .. "existent" # shouldEqual 123
    typeOf ({} .. "nonexistent") # shouldEqual "undefined"
    {exis: {tent: 123}} .. "exis" .. "tent" # shouldEqual 123
  it "getProperty" $ do
    getProperty "existent" {existent: 123} # shouldEqual 123
    typeOf (getProperty "nonexistent" {}) # shouldEqual "undefined"
  it "(.=)" $ do
    ({} .= "created") 123 .. "created" # shouldEqual 123
  it "setProperty" $ do
    setProperty "created" {} 123 .. "created" # shouldEqual 123
  it "(!=)" $ do
    ({} != "name") "terrible" .. "name" # shouldEqual "terrible"
  it "defineProperty" $ do
    defineProperty "name" {} "terrible" .. "name" # shouldEqual "terrible"

