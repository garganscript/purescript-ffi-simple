module FFI.Simple.Functions.Spec ( functionsSpec ) where

import Prelude ( Unit, pure, bind, discard, unit, (#), ($) )
import Data.Nullable ( null )
import Effect ( Effect )
import Effect.Class ( liftEffect )
import Effect.Ref as Ref
import Test.Spec ( Spec, describe, it )
import Test.Spec.Assertions ( shouldEqual )
import Unsafe.Coerce ( unsafeCoerce )

import FFI.Simple.PseudoArray ( length )
import FFI.Simple.Functions
import FFI.Simple.Objects (instanceOf)

foreign import data Object :: Type
foreign import _object :: Object
foreign import _string :: Object

unsafeWriteRef :: forall a. a -> Ref.Ref a -> Effect Unit
unsafeWriteRef v ref =
  pure (unsafeCoerce (Ref.write v ref) unit)

functionsSpec :: Spec Unit
functionsSpec = describe "Functions" $ do
  it "new" $ do -- why, you ask? because javascript.
    "Hello" `instanceOf` _string # shouldEqual false
    let s = new _string ["Hello"]
    s `instanceOf` _string # shouldEqual true
  it "bindTo" $ do
    (bindTo val {val: 123}) unit `shouldEqual` 123
  it "applyTo" $ do
    applyTo sum null [1,2] `shouldEqual` 3
    applyTo summer {val:123} [1,2] `shouldEqual` 126
    applyTo summer {val:1} [1,2] `shouldEqual` 4
  it "applyMethod" $ do
    applyMethod "x" {val: 123, x:summer} [] `shouldEqual` 123
    applyMethod "x" {val: 123, x:summer} [1,2] `shouldEqual` 126
  it "(...)" $ do
    ({val: 123, sum: summer} ... "sum" $ []) `shouldEqual` 123
    ({val: 123, sum: summer} ... "sum" $ [1,2]) `shouldEqual` 126
  it "delay" $ do
    ref <- liftEffect $ Ref.new 0
    let eff2 = delay unit (\_ -> unsafeWriteRef 2 ref)
    count0 <- liftEffect $ Ref.read ref
    count0 `shouldEqual` 0 -- eff2 is delayed
    let eff1 = unsafeWriteRef 1 ref
    count1 <- liftEffect $ Ref.read ref
    count1 `shouldEqual` 1 -- eff1 was not delayed
    ret <- liftEffect eff2
    count2 <- liftEffect $ Ref.read ref
    count2 `shouldEqual` 2 -- eff2 was effective
  it "args1" $ length (args1 "") `shouldEqual` 1
  it "args2" $ length (args2 "" 1) `shouldEqual` 2
  it "args3" $ length (args3 "" 1 "") `shouldEqual` 3
  it "args4" $ length (args4 "" 1 "" 2) `shouldEqual` 4
  it "args5" $ length (args5 "" 1 "" 2 "") `shouldEqual` 5
  it "args6" $ length (args6 "" 1 "" 2 "" 3) `shouldEqual` 6
  it "args7" $ length (args7 "" 1 "" 2 "" 3 "") `shouldEqual` 7
  it "args8" $ length (args8 "" 1 "" 2 "" 3 "" 4) `shouldEqual` 8
  it "args9" $ length (args9 "" 1 "" 2 "" 3 "" 5 "") `shouldEqual` 9

foreign import val :: Unit -> Int
foreign import sum :: forall a. a -> Int
foreign import summer :: forall a. a -> Int
