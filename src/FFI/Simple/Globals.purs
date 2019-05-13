module FFI.Simple.Globals
  ( global, unsafeGlobal ) where

import Data.Maybe ( Maybe )
import FFI.Simple.Undef ( nullUndef )
import Data.Nullable ( toMaybe )

-- | Looks up a name in `globalThis`, `window` or `global` depending
-- | on environment. NodeJS makes things available to a module without
-- | putting them in `global`, because it's shit, so don't expect
-- | much sense out of it in that environment.
global :: forall t. String -> Maybe t
global n = toMaybe (nullUndef (unsafeGlobal n))

-- | Like global, but for when you're really sure it exists and are
-- | willing to tolerate it being quietly undefined (or plan to use
-- | the `Undef` module functions)
unsafeGlobal :: forall t. String -> t
unsafeGlobal = _global

foreign import _global :: forall t. String -> t
