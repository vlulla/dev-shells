
{ pkgs ? import <nixpkgs> {} }:

with pkgs;
let
  erlangpkgs = [];
in
mkShell {
  name = "erlang-shell";
  buildInputs = [ erlangR23 ] ++ erlangpkgs ;
  MANPATH="${erlangR23.outPath}/lib/erlang/man";
}
