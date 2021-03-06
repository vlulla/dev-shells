
{ pkgs ? import <nixpkgs> {} }:

with pkgs;
let
  ocamlpkgs = with ocamlPackages; [ utop findlib fmt fileutils ];
in
mkShell {
  name = "ocaml-development-shell";
  buildInputs = [ ocaml ] ++ ocamlpkgs ;
  MANPATH = "${ocaml.outPath}/share/man:${ocamlPackages.utop.outPath}/share/man";
  /* The following works too:
   *
   * MANPATH = "${ocaml}/share/man:${ocamlPackages.utop}/share/man";
   *
   * OR
   *
   * MANPATH = builtins.concatStringsSep ":" (map (x: "${x}/share/man") [ ocaml utop]);
   *
   */
}
