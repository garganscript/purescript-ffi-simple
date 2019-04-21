module FFI.Simple.Require.Spec ( requireSpec ) where

import Prelude
import Test.Spec ( Spec, describe, it, pending )
import Test.Spec.Assertions ( shouldEqual )

import FFI.Simple.Require

requireSpec :: Spec Unit
requireSpec = describe "Require" $ do
  do pending "require"
--    it "require" $ do
--    require "./fake.dep" `shouldEqual` {hello: "world"}
