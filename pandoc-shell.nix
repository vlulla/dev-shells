{ pkgs ? import <nixpkgs> {} }:

with pkgs;
mkShell {
  name = "pandoc-development-shell";
  buildInputs = [ pandoc gnumake ];
}
