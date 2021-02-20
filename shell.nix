{ pkgs ? import <nixpkgs> {} }:

with pkgs;
pkgs.mkShell {
  buildInputs = [ which htop zlib jq coreutils findutils zstd lz4 fzf ripgrep sqlite ];

  shellHook = ''
    echo "Hello from shellHook!"
  '';

  MY_ENVIRONMENT_VARIABLE = "world";
  MANPATH = builtins.concatStringsSep ":" (map (x: "${x}/share/man")
              [ which htop findutils lz4 sqlite bash gnused gnutar gawk gnugrep diffutils patch ]);
}
