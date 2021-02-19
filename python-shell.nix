{ pkgs ? import <nixpkgs> {} }:

let
  pypkgs = with pkgs.python3Packages; [ numpy simplejson requests matplotlib pyyaml pandas ];
in
pkgs.mkShell {
  buildInputs = [ pypkgs ];
}
