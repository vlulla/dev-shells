{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  name = "mlton-development-shell";
  buildInputs = [ pkgs.mlton ];
  MANPATH="${pkgs.mlton.outPath}/share/man";
}
