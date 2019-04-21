-- | Library require()
module FFI.Simple.Require ( require ) where

-- | Requires a library
require :: forall a. String -> a
require = _require

foreign import _require :: forall a. String -> a
