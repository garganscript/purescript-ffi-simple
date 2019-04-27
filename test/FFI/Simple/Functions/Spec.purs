module FFI.Simple.Functions.Spec ( functionsSpec ) where

import Prelude hiding ( apply )
import Data.Array as A
import Data.Maybe ( Maybe(..), isJust )
import Data.Nullable ( null )
import Effect.Class ( liftEffect )
import Effect.Ref as Ref
import Test.Spec ( Spec, describe, it, pending )
import Test.Spec.Assertions ( shouldEqual )

import FFI.Simple.PseudoArray ( length )
import FFI.Simple.Functions

functionsSpec :: Spec Unit
functionsSpec = describe "Functions" $ do
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
    let eff = delay unit $ \_ -> Ref.write 1 ref
    count <- liftEffect $ Ref.read ref
    count `shouldEqual` 0
    ret <- liftEffect eff
    count' <- liftEffect $ Ref.read ref
    count' `shouldEqual` 1
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
