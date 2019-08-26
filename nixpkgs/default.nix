# allows overriding nixpkgs config; useful for shell.nix for individual packages
# that don't need every single package here built to be useful
(import ./pin.nix) { config = import ./config.nix; }
