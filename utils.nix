{ pkgs ? import <nixpkgs> {} }:

let 
  isPrefix = pre: str: 
    let lp = builtins.stringLength pre; 
        sub = builtins.substring 0 lp str; 
    in pre == sub;
  isSuffix = suf: str:
    let strlen = builtins.stringLength str;
        suflen = builtins.stringLength suf;
        idx = strlen - suflen;
    in
      strlen >= suflen && 
      (suf == builtins.substring idx strlen str);
  pkgNameFromDerivationPath = dpath: 
    let 
      ispkg = isPrefix "/nix/store/" dpath;
      len = builtins.stringLength dpath;
    in
      if ispkg then
        builtins.substring 44 len dpath
      else
        null
        ;

in
{
  isPrefix = isPrefix;
  isSuffix = isSuffix;
  pkgName = pkgNameFromDerivationPath;
}
