module Oracle.Spec
  ( testOracles
  ) where

import Data.Foldable (for_)
import NeighbourSquasher.Core (squashNeighbourBy)
import Test.Hspec (Spec, describe, it, shouldBe)
import Test.Hspec.Runner (configFastFail, defaultConfig, hspecWith)

testOracles :: IO ()
testOracles = hspecWith defaultConfig {configFastFail = True} specs

specs :: Spec
specs = describe "squashNeighbour" $ for_ cases test
  where
    test Case {..} =
      it description $ squashNeighbourBy squashBy input `shouldBe` expected

data Case = Case
  { description :: String
  , squashBy :: Char
  , input :: String
  , expected :: String
  }

cases :: [Case]
cases =
  [ Case
      { description = "returns empty string if input is empty"
      , squashBy = ' '
      , input = ""
      , expected = ""
      }
  , Case
      { description = "returns input if it contains only one character"
      , squashBy = '_'
      , input = "x"
      , expected = "x"
      }
  , Case
      { description =
          "returns input if it does not contains character to squash"
      , squashBy = '_'
      , input = "xy"
      , expected = "xy"
      }
  , Case
      { description = "squashes leading spaces"
      , squashBy = ' '
      , input = "  y"
      , expected = " y"
      }
  , Case
      { description = "squashes more than 3 leading spaces"
      , squashBy = ' '
      , input = "   y"
      , expected = " y"
      }
  , Case
      { description = "squashes infix spaces"
      , squashBy = ' '
      , input = "x    y"
      , expected = "x y"
      }
  , Case
      { description = "squashes infix space and trailing spaces"
      , squashBy = ' '
      , input = "x    y   "
      , expected = "x y "
      }
  ]
