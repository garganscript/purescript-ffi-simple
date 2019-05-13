module FFI.Simple.Undef.Spec ( undefSpec ) where

import Prelude
import Data.Maybe ( Maybe(..) )
import Data.Nullable ( Nullable, null, toMaybe )
import Unsafe.Coerce ( unsafeCoerce )
import Test.Spec ( Spec, describe, it )
import Test.Spec.Assertions ( shouldEqual )
-- import Test.Spec.QuickCheck (quickCheck')
import FFI.Simple.Undef

undefSpec :: Spec Unit
undefSpec = describe "Undef" $ do
  it "isUndef" $ do
    isUndef undef `shouldEqual` true
    isUndef 123 `shouldEqual` false
    isUndef "" `shouldEqual` false
    isUndef null `shouldEqual` false
  it "defaultUndef" $ do
    defaultUndef 123 (unsafeCoerce undef) `shouldEqual` 123
    defaultUndef "hello" "world" `shouldEqual` "world"
    defaultUndef 123 456 `shouldEqual` 456
  it "nullUndef" $ do
    let ret = nullUndef (unsafeCoerce undef) :: Nullable Int 
    toMaybe ret `shouldEqual` Nothing
    toMaybe (nullUndef 123) `shouldEqual` Just 123
    toMaybe (nullUndef "") `shouldEqual` Just ""
  it "maybeUndef" $ do
    let ret = maybeUndef (unsafeCoerce undef) :: Maybe Int
    ret `shouldEqual` Nothing
    maybeUndef 123 `shouldEqual` Just 123
    maybeUndef "" `shouldEqual` Just ""
    
