{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  name = "futhark-development-shell";
  buildInputs = [ pkgs.futhark ];
  MANPATH="${pkgs.futhark.outPath}/share/man";
}
