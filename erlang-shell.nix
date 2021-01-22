
{ pkgs ? import <nixpkgs> {} }:

with pkgs;
let
  erlangpkgs = [];
in
mkShell {
  buildInputs = [ erlang ] ++ erlangpkgs ;
}
