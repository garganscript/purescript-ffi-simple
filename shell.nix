let
  nixpkgs = builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/refs/tags/23.11.tar.gz";
    #sha256 = "162dywda2dvfj1248afxc45kcrg83appjd0nmdb541hl7rnncf02";
  };
in

{ pkgs ? import nixpkgs {} }:

  let
    ezPscSrc = pkgs.fetchFromGitHub {
      owner = "justinwoo";
      repo = "easy-purescript-nix";
      rev = "117fd96acb69d7d1727df95b6fde9d8715e031fc";
      sha256 = "lcIRIOFCdIWEGyKyG/tB4KvxM9zoWuBRDxW+T+mvIb0=";    };
    ezPsc = import ezPscSrc { inherit pkgs; };
in
pkgs.mkShell {
  name = "purescript-reactix";

  buildInputs = [
    ezPsc.purs-0_15_15
    ezPsc.psc-package
    pkgs.nodejs
    pkgs.yarn
  ];
}
