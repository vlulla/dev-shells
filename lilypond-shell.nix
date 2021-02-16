{ pkgs ? import <nixpkgs> {},
  tex ? pkgs.texlive.combine { inherit (pkgs.texlive) scheme-small lh metafont epsf; }}:

with pkgs;
let
  lilypond = stdenv.mkDerivation rec {
    pname = "lilypond";
    version = "2.22.0";

    src = fetchurl {
      url="http://lilypond.org/download/sources/v${lib.versions.majorMinor version}/lilypond-${version}.tar.gz";
      sha256="0khg9dlm1b02mm9w54xqc9ydj416xkikn6p08g1asiyjf4qx1pb4";
    };

    nativeBuildInputs = [ bison flex pkgconfig makeWrapper ];

    buildInputs = [ ghostscript texinfo imagemagick texi2html guile dblatex tex zip
                    netpbm python3 gettext perl fontconfig freetype pango fontforge
                    gyre-fonts help2man groff t1utils ];

    makeFlags="-j 5";

    preConfigure = ''
      sed -e "s@mem=mf2pt1@mem=$PWD/mf/mf2pt1@" -i scripts/build/mf2pt1.pl
      export HOME=$TMPDIR/home
    '';

    configureFlags = [
      "--disable-documentation"
      "--with-urwotf-dir=${ghostscript}/share/ghostscript/fonts"
      "--with-texgyre-dir=${gyre-fonts}/share/fonts/truetype/"
      ];

    postInstall = ''
      for f in "$out/bin/"*; do
        wrapProgram "$f" --set GUILE_AUTO_COMPILE 0 --set PATH "${ghostscript}/bin" --argv0 "$f"
      done
    '';
  };
in
mkShell {
  buildInputs = [ lilypond ] ;
}
