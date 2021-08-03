{ pkgs ? import <nixpkgs> {} }:

with pkgs.rPackages;
let
  rpkgs = [ data_table ggplot2 simstudy ];
  additional-vlpkgs = [
        Matrix RSQLite Rcpp SOAR biganalytics bigmemory bigtabulate caret
        digest doMC dplyr e1071 ff foreach gbm ggmap ggplot2 glmnet leaflet
        lpSolve mapview mlr3 nnet lidR ncdf4 jsonlite geonames igraph rnaturalearth
        RNetCDF classInt randomForest randtoolbox raster
        rbenchmark rgdal rgl SimMultiCorrData simstudy sf sp spdep sqldf
        stringi tau tidyverse tm xgboost xts zoo
     ];
in
with pkgs;
mkShell {
  name = "R-development-shell";
  buildInputs = [ R ] ++ rpkgs ++ [ digest ]
   /* ++ additional-vlpkgs */
  ;
  MANPATH="${R.outPath}/share/man";
}
