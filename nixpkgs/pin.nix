let
  inherit (builtins) fromJSON readFile fetchTarball;
  fetchFromGitHub = { owner, repo, rev, sha256 }: fetchTarball {
    inherit sha256;
    url = "https://github.com/${owner}/${repo}/archive/${rev}.tar.gz";
  };
  nixpkgs-git = fromJSON (readFile ./nixpkgs.json);
in
  import (fetchFromGitHub nixpkgs-git)
