{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [ pkgs.mlton ];
  MANPATH="${pkgs.mlton.outPath}/share/man";
}
