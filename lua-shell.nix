{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  name = "lua-development-shell";
  buildInputs = [ pkgs.lua ];
  MANPATH="${pkgs.lua.outPath}/share/man";
}
