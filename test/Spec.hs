module Main
  ( main
  ) where

import Control.Monad.Extra (ifM)
import HedgeHog.Spec (propSquashTwice)
import Hedgehog (Group(..), checkParallel)
import Oracle.Spec (testOracles)
import System.Exit (exitFailure, exitSuccess)

main :: IO ()
main = do
  testOracles
  ifM (checkParallel hedgehogTests) exitSuccess exitFailure

hedgehogTests :: Group
hedgehogTests = Group "Property based test" [("squash twice", propSquashTwice)]
