## From https://nixos.wiki/wiki/FAQ

{ pkgs ? import <nixpkgs> {} }:
(pkgs.buildFHSUserEnv {
  name = "FHS-compatible-shell";
  targetPkgs = pkgs: with pkgs; [ coreutils ];
  multiPkgs = pkgs: with pkgs; [ zlib xorg.libXxf86vm curl openal openssl
                                 xorg.libXext xorg.libX11 xorg.libXrandr mesa_glu ];
  runScript = "bash";
}).env
