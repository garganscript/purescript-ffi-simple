{ name = "ffi-simple"
, dependencies =
  [ "functions"
  , "maybe"
  , "nullable"
  , "prelude"
  , "unsafe-coerce"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs" ]
}
