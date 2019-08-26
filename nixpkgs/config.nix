{
  allowUnfree = true;
  packageOverrides = pkgs:
    let
      bootstrap = import <nixpkgs> {};
      compiler = (builtins.fromJSON (builtins.readFile ./ghc.json)).compiler;
      haskellPackages0 =
        if compiler == "default"
        then pkgs.haskellPackages
        else pkgs.haskell.packages.${compiler};
    in {
      haskellPackages = haskellPackages0.override {
        overrides = self: super: with pkgs.haskell.lib; rec {
          classy-prelude-yesod = dontHaddock (dontCheck super.classy-prelude-yesod);
          # pulled as part of the respecify tree
        };
      };
    };
}
