{ pkgs ? import <nixpkgs> {} }:

with pkgs;
mkShell {
  name = "pari-development-shell";
  buildInputs = [ pari ] ;
  MANPATH="${pari.outPath}/share/man";
}
