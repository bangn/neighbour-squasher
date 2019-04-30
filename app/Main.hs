module Main
    ( main
    )
where

import NeighbourSquasher (squashNeighbourBy)
import System.Environment (getArgs)

main :: IO ()
main = do
    (squashByArg : input : _) <- getArgs
    putStr $ squashNeighbourBy (head squashByArg) input
