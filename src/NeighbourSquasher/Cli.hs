module NeighbourSquasher.Cli
    ( runSquashNeighbourBy
    )
where

import Data.Version (showVersion)
import NeighbourSquasher.Core (squashNeighbourBy)
import Options.Applicative

import Paths_neighbour_squasher as Meta (version)

runSquashNeighbourBy :: IO ()
runSquashNeighbourBy = execParser cliParser >>= \case
    CliOptions squashBy input -> putStr $ squashNeighbourBy (head squashBy) input

data CliOptions = CliOptions
    { squashBy :: String
    , input    :: String
    }

cliParser :: ParserInfo CliOptions
cliParser = info ( helper <*> versionP <*> cliOptionsP )
    $ fullDesc <> progDesc "Squash repeated char"

versionP :: Parser (a -> a)
versionP = infoOption cliVersion
    $ long "version"
   <> short 'v'
   <> help "Show tool's version"

cliVersion :: String
cliVersion = showVersion Meta.version

cliOptionsP :: Parser CliOptions
cliOptionsP = CliOptions
    <$> strOption
        ( long "squash-by"
         <> short 's'
         <> metavar "SQUASHBY"
         <> showDefault
         <> value " "
         <> help "Character to squash by" )
    <*> strOption
        ( long "input"
         <> short 'i'
         <> metavar "INPUT"
         <> help "String to be squashed" )
