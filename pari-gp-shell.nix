{ pkgs ? import <nixpkgs> {} }:

with pkgs;
mkShell {
  buildInputs = [ pari ] ;
  MANPATH="${pari.outPath}/share/man";
}
