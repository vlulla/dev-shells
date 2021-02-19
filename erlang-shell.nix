
{ pkgs ? import <nixpkgs> {} }:

with pkgs;
let
  erlangpkgs = [];
in
mkShell {
  buildInputs = [ erlangR23 ] ++ erlangpkgs ;
  MANPATH="${erlangR23.outPath}/lib/erlang/man";
}
