{ pkgs ? import <nixpkgs> {} }:

with pkgs;
mkShell {
  buildInputs = [ pandoc gnumake ];
}
