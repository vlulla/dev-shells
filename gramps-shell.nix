
{ pkgs ? import <nixpkgs> {} }:

with pkgs;
mkShell {
  name = "gramps-development-shell";
  buildInputs = [ gramps  ];
  MANPATH = "${gramps}/share/man";
}
