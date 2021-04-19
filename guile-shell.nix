
{ pkgs ? import <nixpkgs> {} }:

with pkgs;
mkShell {
  name = "guil-development-shell";
  buildInputs = [ guile ] ;
  MANPATH = "${guile.outPath}/share/man";
}
