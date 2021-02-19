{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [ pkgs.lua ];
  MANPATH="${pkgs.lua.outPath}/share/man";
}
