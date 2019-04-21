module FFI.Simple.PseudoArray.Spec ( pseudoArraySpec ) where

import Prelude
import Data.Array as A
import Data.Maybe ( Maybe(..), isJust )
import Data.Traversable ( traverse, sequence_ )
import Data.Tuple ( Tuple(..) )

import Test.Spec ( Spec, describe, it )
import Test.Spec.Assertions ( shouldEqual )
-- import Test.Spec.QuickCheck (quickCheck')

import FFI.Simple.Functions ( args1, args2 )
import FFI.Simple.PseudoArray

pseudoArraySpec :: Spec Unit
pseudoArraySpec = describe "PseudoArray" $ do
  it "length" $ do
    length [] `shouldEqual` 0
    length [1] `shouldEqual` 1
    length (args1 1) `shouldEqual` 1
    length (args2 1 2) `shouldEqual` 2
  it "from" $ do
    from [1] `shouldEqual` [1]
    from [1,2] `shouldEqual` [1,2]
    from (args1 1) `shouldEqual` [1]
    from (args2 1 2) `shouldEqual` [1,2]
  it "drop" $ do
    (drop 1 [1] :: Array Int)  `shouldEqual` []
    (drop 1 [1,2] :: Array Int) `shouldEqual` [2]
    (drop 1 (args1 1) :: Array Int) `shouldEqual` []
    (drop 1 (args2 1 2) :: Array Int) `shouldEqual` [2]
  it "slice" $ do
    (slice 0 1 [1] :: Array Int) `shouldEqual` [1]
    (slice 0 2 [1,2] :: Array Int) `shouldEqual` [1, 2]
    (slice 0 1 [1,2] :: Array Int) `shouldEqual` [1]
    (slice 1 2 [1,2] :: Array Int) `shouldEqual` [2]
    (slice 0 1 (args1 1) :: Array Int) `shouldEqual` [1]
    (slice 0 2 (args2 1 2) :: Array Int) `shouldEqual` [1,2]
    (slice 0 1 (args2 1 2) :: Array Int) `shouldEqual` [1]
    (slice 1 2 (args2 1 2) :: Array Int) `shouldEqual` [2]
