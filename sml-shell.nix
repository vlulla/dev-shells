{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  name = "sml-development-shell";
  buildInputs = [ pkgs.smlnj ];
}
