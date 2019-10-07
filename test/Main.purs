module Test.Main where

import Data.Unit ( Unit )
import Data.Traversable ( sequence_ )
import Effect ( Effect )
import Effect.Aff (launchAff_)
import Test.Spec ( Spec )
import Test.Spec.Reporter.Console ( consoleReporter )
import Test.Spec.Runner ( runSpec )

import FFI.Simple.Globals.Spec ( globalsSpec )
import FFI.Simple.Objects.Spec ( objectsSpec )
import FFI.Simple.PseudoArray.Spec ( pseudoArraySpec )
import FFI.Simple.Functions.Spec ( functionsSpec )
import FFI.Simple.Undef.Spec ( undefSpec )

spec :: Spec Unit
spec = sequence_ [ globalsSpec, objectsSpec, pseudoArraySpec, functionsSpec, undefSpec ]

main :: Effect Unit
main = launchAff_ (runSpec [consoleReporter] spec)
