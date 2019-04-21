-- | Unsafe functions used for FFI. Not considered part of the public api
module FFI.Simple
  ( module FFI.Simple.Functions
  , module FFI.Simple.Objects
  , module FFI.Simple.Require
  ) where

import FFI.Simple.Functions
  ( bind', apply, call
  , (...), applyMethod, applyMethod', callMethod
  , args1, args2, args3, args4, args5
  , args6, args7, args8, args9, args10
  )

import FFI.Simple.Objects
  ( typeof, (..), getProperty, setProperty, defineProperty )

import FFI.Simple.Require ( require )
