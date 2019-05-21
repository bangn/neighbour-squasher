module NeighbourSquasher.Cli
  ( runSquashNeighbourBy
  ) where

import Data.Version (showVersion)
import NeighbourSquasher.Core (squashNeighbourBy)
import Options.Applicative

import Paths_neighbour_squasher as Meta (version)

runSquashNeighbourBy :: IO ()
runSquashNeighbourBy =
  execParser cliParser >>= \case
    CliOptions squashBy input -> putStr $ squashNeighbourBy squashBy input

data CliOptions =
  CliOptions Char
             String

cliParser :: ParserInfo CliOptions
cliParser =
  info (helper <*> versionP <*> cliOptionsP) $
  fullDesc <> progDesc "Squash repeated char in a string"

versionP :: Parser (a -> a)
versionP =
  infoOption cliVersion $
  long "version" <> short 'v' <> help "Show tool's version"

cliVersion :: String
cliVersion = showVersion Meta.version

cliOptionsP :: Parser CliOptions
cliOptionsP =
  CliOptions <$>
  option
    auto
    (long "squash-by" <> short 's' <> metavar "SQUASH_BY" <> showDefault <>
     value ' ' <>
     help "Character to squash by") <*>
  strOption
    (long "input" <> short 'i' <> metavar "INPUT" <>
     help "String to be squashed")
