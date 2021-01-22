{ pkgs ? import <nixpkgs> {} }:

let
  pypkgs = with pkgs.python3Packages; [ numpy simplejson requests matplotlib pyyaml ];
in
pkgs.mkShell {
  buildInputs = [ pypkgs ];
}
