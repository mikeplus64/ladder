let
  nixpkgs = import ./nixpkgs;
  dev = false;
in
  with (nixpkgs.haskell.lib);
  with (nixpkgs.haskellPackages);
  (server:
    if dev
    then
      enableCabalFlag
      (enableLibraryProfiling
      (enableExecutableProfiling server)) "development"
    else
      disableLibraryProfiling server)
  (dontHaddock (callCabal2nix "ladder" ./. {}))
