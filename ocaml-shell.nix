
{ pkgs ? import <nixpkgs> {} }:

with pkgs;
let
  ocamlpkgs = with ocamlPackages; [ utop findlib fmt fileutils ];
in
mkShell {
  buildInputs = [ ocaml ] ++ ocamlpkgs ;
}
