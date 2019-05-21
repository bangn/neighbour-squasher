{ mkDerivation, base, extra, hedgehog, hspec, optparse-applicative
, stdenv
}:
mkDerivation {
  pname = "neighbour-squasher";
  version = "0.0.0";
  src = ./.;
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [ base optparse-applicative ];
  executableHaskellDepends = [ base ];
  testHaskellDepends = [ base extra hedgehog hspec ];
  homepage = "https://github.com/bangn/neighbour-squasher";
  description = "Squash consecutive same characters into one";
  license = stdenv.lib.licenses.mit;
}
