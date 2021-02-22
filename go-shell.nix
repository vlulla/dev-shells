
{ pkgs ? import <nixpkgs> {} }:

with pkgs;
mkShell {
  name = "go-development-shell";
  buildInputs = [ go ] ;
}
