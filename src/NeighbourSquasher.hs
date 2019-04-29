module NeighbourSquasher
    ( squashNeighbourBy
    )
where

squashNeighbourBy :: Char -> String -> String
squashNeighbourBy _        []            = []
squashNeighbourBy _        [x          ] = [x]
squashNeighbourBy squashBy (c : c' : cs) = if c == squashBy && c' == squashBy
    then squashNeighbourBy squashBy (c' : cs)
    else c : squashNeighbourBy squashBy (c' : cs)
