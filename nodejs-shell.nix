{ pkgs ? import <nixpkgs> {} }:

with pkgs;
mkShell {
  name = "nodejs-development-shell";
  buildInputs = [ nodejs_latest ] ;
  MANPATH = "${nodejs}/share/man";
}
