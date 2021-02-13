
{ pkgs ? import <nixpkgs> {} }:

with pkgs;
let
  erlangpkgs = [];
in
mkShell {
  buildInputs = [ erlangR23 ] ++ erlangpkgs ;
}
