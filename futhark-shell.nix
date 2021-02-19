{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [ pkgs.futhark ];
  MANPATH="${pkgs.futhark.outPath}/share/man";
}
