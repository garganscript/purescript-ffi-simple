-- | Utilities for dealing with (uncurried) functions
-- | Note: If you need `Effect` to model failure, use `pure` (ha!)
module FFI.Simple.Functions
  ( bind', apply, call
  , (...), applyMethod, applyMethod', callMethod
  , args1, args2, args3, args4, args5
  , args6, args7, args8, args9, args10
  ) where

import Prelude ( flip )
import FFI.Simple.Objects ( getProperty )
import FFI.Simple.PseudoArray ( PseudoArray )
import Data.Function.Uncurried
  ( Fn2, runFn2, Fn3, runFn3, Fn4,  runFn4
  , Fn5, runFn5, Fn6, runFn6, Fn7,  runFn7
  , Fn8, runFn8, Fn9, runFn9, Fn10, runFn10 )

bind' :: forall f o. f -> o -> f
bind' = runFn2 _bind

foreign import _bind :: forall f o. Fn2 f o f

-- | Apply a function to a this object with the given arguments
apply :: forall f this a b. f -> this -> a -> b
apply = runFn3 _apply

-- | Apply a function to an array of zero argumemts
call :: forall f this a. f -> this -> a
call f o = apply f o []

foreign import _apply :: forall f o a b. Fn3 f o a b

-- TODO: figure out what i should be
infixr 4 applyMethod' as ...

-- | Lookup and apply the method with the given name on the given
-- | object to the given this and an array or pseudoarray of arguments
applyMethod :: forall o a b. String -> o -> a -> b
applyMethod n o = apply (getProperty n o) o

applyMethod' :: forall o a b. o -> String -> a -> b
applyMethod' = flip applyMethod

-- | Lookup and apply the method with the given name on the given
-- | object to the given this and an empty array of arguments
callMethod :: forall o a. String -> o -> a
callMethod n o = applyMethod n o []

callMethod' :: forall o a. o -> String -> a
callMethod' o n = applyMethod n o []

-- | returns an argument as a PseudoArray
args1 :: forall a. a -> PseudoArray
args1 = _args1

foreign import _args1 :: forall a. a -> PseudoArray

-- | returns 2 arguments as a PseudoArray
args2 :: forall a b. a -> b -> PseudoArray
args2 = runFn2 _args2

foreign import _args2 :: forall a b. Fn2 a b PseudoArray

-- | returns 3 arguments as a PseudoArray
args3 :: forall a b c. a -> b -> c -> PseudoArray
args3 = runFn3 _args3

foreign import _args3 :: forall a b c. Fn3 a b c PseudoArray

-- | returns 4 arguments as a PseudoArray
args4 :: forall a b c d. a -> b -> c -> d -> PseudoArray
args4 = runFn4 _args4

foreign import _args4 :: forall a b c d. Fn4 a b c d PseudoArray

-- | returns 5 arguments as a PseudoArray
args5 :: forall a b c d e. a -> b -> c -> d -> e -> PseudoArray
args5 = runFn5 _args5

foreign import _args5 :: forall a b c d e. Fn5 a b c d e PseudoArray

-- | returns 6 arguments as a PseudoArray
args6 :: forall a b c d e f. a -> b -> c -> d -> e -> f -> PseudoArray
args6 = runFn6 _args6

foreign import _args6 :: forall a b c d e f. Fn6 a b c d e f PseudoArray

-- | returns 7 arguments as a PseudoArray
args7 :: forall a b c d e f g. a -> b -> c -> d -> e -> f -> g -> PseudoArray
args7 = runFn7 _args7

foreign import _args7 :: forall a b c d e f g. Fn7 a b c d e f g PseudoArray

-- | returns 8 arguments as a PseudoArray
args8 :: forall a b c d e f g h. a -> b -> c -> d -> e -> f -> g -> h -> PseudoArray
args8 = runFn8 _args8

foreign import _args8 :: forall a b c d e f g h. Fn8 a b c d e f g h PseudoArray

-- | returns 9 arguments as a PseudoArray
args9 :: forall a b c d e f g h i. a -> b -> c -> d -> e -> f -> g -> h -> i -> PseudoArray
args9 = runFn9 _args9

foreign import _args9 :: forall a b c d e f g h i. Fn9 a b c d e f g h i PseudoArray

-- | returns 9 arguments as a PseudoArray
args10 :: forall a b c d e f g h i j. a -> b -> c -> d -> e -> f -> g -> h -> i -> j -> PseudoArray
args10 = runFn10 _args10

foreign import _args10 :: forall a b c d e f g h i j. Fn10 a b c d e f g h i j PseudoArray
