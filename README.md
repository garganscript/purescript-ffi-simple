# purescript-ffi-simple

We're sure you have your reasons.

## Rationale

> What if we could do FFI without writing javascript much, if it all?

This library sits at the `unsafeCoerce` end of the safety scale - it
is expected that your usage of these functions will provide the
necessary safety while we provide the primitives with low overhead and
little imposition upon how you structure your code.

## Usage

```purescript
import FFI.Simple

import Data.Array as A

foreign import data React :: Type
foreign import data Element :: Type

react :: React
react = require 'react'

createElement :: forall r. String -> Record r -> Array Element -> Element
createElement c p cs = applyTo react (args3 c p cs)
```
## Dedication

> Send it a message -- Joe Armstrong (1950-2019)

## Copyright and License

Copyright (c) 2019 James Laver

This software is free and open source software licensed under the
terms of the Mozilla Public License (MPL) 2.0

