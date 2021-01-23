{ pkgs ? import <nixpkgs> {} } :

let
  inlaDeps = with pkgs.rPackages; [
    Matrix sp Deriv devtools codetools doParallel fastmatch fields foreach graph gridExtra 
    HKprocess knitr maptools markdown MatrixModels matrixStats mvtnorm numDeriv 
    orthopolynom pixmap rgdal rgl Rgraphviz rmarkdown sn splancs spdep shiny xts
    ];
  makeFlags = "-j 5";
  inla = pkgs.rPackages.buildRPackage {
    name = "inla";
    src = pkgs.fetchurl {
      url = "https://inla.r-inla-download.org/R/testing/src/contrib/INLA_21.01.08-1.tar.gz";
      sha256 = "1hvx2qf5xhc8ff62ff76x3svdpvbd54i309q1isla9l1x9srd810";
    };
    nativeBuildInputs = inlaDeps;
    propagateBuildInputs = inlaDeps;
    postInstall = ''
      for f in $out/library/INLA/bin/linux/64bit/inla; do
        chmod +rx $f
        patchelf --set-interpreter ${pkgs.stdenv.glibc}/lib/ld-linux-x86-64.so.2 $f
        patchelf --force-rpath --set-rpath $out/library/INLA/bin/linux/64bit $f
      done
      for f in $out/library/INLA/bin/linux/64bit/*.so*; do
        chmod +rx $f
        patchelf --force-rpath --set-rpath $out/library/INLA/bin/linux/64bit $f
      done
    '';
  };
in
  with pkgs;
  mkShell {
    buildInputs = [ git gcc pkgconfig proj R gfortran zlib.dev suitesparse ] ++
      (with rPackages;
        [ inla ] ++ inlaDeps ++ [ fasttime bit64 RSQLite data_table ggplot2 fst ]);
  }

