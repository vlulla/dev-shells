{ pkgs ? import <nixpkgs> {} }:

let
  pypkgs = with pkgs.python3Packages;
    [ numpy simplejson requests matplotlib pyyaml pandas scikitlearn scikitimage ];
in
pkgs.mkShell {
  name = "python-development-shell";
  buildInputs = [ pypkgs ];
}
