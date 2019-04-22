module Test.Main where

import Data.Unit ( Unit )
import Data.Traversable ( sequence_ )
import Effect ( Effect )
import Test.Spec ( Spec )
import Test.Spec.Assertions ( shouldEqual )
import Test.Spec.Reporter.Console ( consoleReporter )
import Test.Spec.Runner ( run )

import FFI.Simple.Objects.Spec ( objectsSpec )
import FFI.Simple.PseudoArray.Spec ( pseudoArraySpec )
import FFI.Simple.Functions.Spec ( functionsSpec )
import FFI.Simple.Undef.Spec ( undefSpec )

spec :: Spec Unit
spec = sequence_ [ objectsSpec, pseudoArraySpec, functionsSpec, undefSpec ]

main :: Effect Unit
main = run [consoleReporter] spec
