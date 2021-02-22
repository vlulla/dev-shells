{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  name = "julia-development-shell";
  buildInputs = [ pkgs.julia ];
}
