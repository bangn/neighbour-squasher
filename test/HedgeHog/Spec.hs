module HedgeHog.Spec
  ( propSquashTwice
  ) where

import Hedgehog (Property, (===), forAll, property)
import qualified Hedgehog.Gen as Gen
import qualified Hedgehog.Range as Range
import NeighbourSquasher.Core (squashNeighbourBy)

propSquashTwice :: Property
propSquashTwice =
  property $ do
    string <- forAll $ Gen.string (Range.linear 0 100) Gen.unicode
    char <- forAll Gen.unicode
    squashNeighbourBy char (squashNeighbourBy char string) ===
      squashNeighbourBy char string
