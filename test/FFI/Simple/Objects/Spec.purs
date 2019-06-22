module FFI.Simple.Objects.Spec ( objectsSpec ) where

import Prelude
import Data.Array as A
import Data.Maybe ( Maybe(..), isJust )
import Data.Foldable (elem)
import Data.Traversable ( traverse, sequence_ )
import Data.Tuple ( Tuple(..) )

import Test.Spec ( Spec, describe, it )
import Test.Spec.Assertions (shouldEqual, fail)
-- import Test.Spec.QuickCheck (quickCheck')

import FFI.Simple.Objects
import FFI.Simple.Globals
import Unsafe.Coerce (unsafeCoerce)
import Unsafe.Reference (unsafeRefEq)

foreign import data Object :: Type

foreign import _object :: Object

instance showObject :: Show Object where
  show _ = "<object>" -- yes, this could be more helpful

instance eqObject :: Eq Object where
  eq = unsafeRefEq

objectsSpec :: Spec Unit
objectsSpec = describe "Objects" $ do
  it "typeOf" $ do
    typeOf "" `shouldEqual` "string"
    typeOf 123 `shouldEqual` "number"
  it "instanceOf" $ do
    true `shouldEqual` instanceOf {} _object
    false `shouldEqual` instanceOf 1 _object
    false `shouldEqual` instanceOf "" _object
  it "named" $ do
    named "hello" {} .. "name" # shouldEqual "hello"
  it "downcast" $ do
    let o = {}
    let o2 = (downcast _object o) :: Maybe {}
    case o2 of
      Just o3 -> o `shouldEqual` o3
      Nothing -> fail "Make it stop"
    let o4 = ""
    let o5 = (downcast _object o4) :: Maybe String
    o5 `shouldEqual` Nothing
    let o6 = ""
    let o7 = (downcast _object o6) :: Maybe String
    o7 `shouldEqual` Nothing
  it "isIn" $ do
    true `shouldEqual` isIn "foo" {foo: "bar"}
    false `shouldEqual` isIn "foo" {}
    true `shouldEqual` isIn "hasOwnProperty" {}
  it "keys" $ do
    [] `shouldEqual` keys {}
    ["foo"] `shouldEqual` keys {foo: "bar"}
    let fooAndBar = keys {foo: 1, bar: 2}
    2 `shouldEqual` A.length fooAndBar
    true `shouldEqual` ("foo" `elem` fooAndBar)
    true `shouldEqual` ("bar" `elem` fooAndBar)
  it "hasOwnProperty" $ do
    true `shouldEqual` hasOwnProperty "foo" {foo: "bar"}
    false `shouldEqual` hasOwnProperty "foo" {}
    false `shouldEqual` hasOwnProperty "hasOwnProperty" {}
  it "(.?)" $ do
    {existent: 123} .? "existent" # shouldEqual $ Just 123
    let prop = ({} .? "nonexistent") :: Maybe Object
    prop `shouldEqual` Nothing
  it "maybeGetProperty" $ do
    maybeGetProperty "existent" {existent: 123} # shouldEqual $ Just 123
    let prop = (maybeGetProperty "nonexistent" {}) :: Maybe Object
    prop `shouldEqual` Nothing
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
  it "(!-)" $ do
     false `shouldEqual` hasOwnProperty "foo" ({foo: 123} !- "foo")
     false `shouldEqual` hasOwnProperty "foo" ({} !- "foo")
  it "removeProperty" $ do
     false `shouldEqual` hasOwnProperty "foo" (removeProperty "foo" {foo: 123})
     false `shouldEqual` hasOwnProperty "foo" (removeProperty "foo" {})
