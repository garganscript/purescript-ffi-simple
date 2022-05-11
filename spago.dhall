{ name = "ffi-simple"
, dependencies =
  [ "aff"
  , "arrays"
  , "effect"
  , "foldable-traversable"
  , "functions"
  , "maybe"
  , "nullable"
  , "prelude"
  , "refs"
  , "spec"
  , "tuples"
  , "unsafe-coerce"
  , "unsafe-reference"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
