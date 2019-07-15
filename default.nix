{ pkgs ? import <nixpkgs> {}
, name ? "example"
, version ? "0.0.1"
, deps ? null
, src ? ./.
}:

let
  ghc = pkgs.haskellPackages.ghcWithPackages (ps:
    with ps;
    if null == deps 
      then []
      else pkgs.lib.attrVals (pkgs.lib.splitString " " deps) ps
  );
in

pkgs.stdenv.mkDerivation {
  inherit name version src;
  
  buildInputs = [ ghc ];
  
  buildPhase = '' '';
  installPhase = ''
    mkdir -p $out
    ${ghc}/bin/ghc --make Main.hs -o $out/${name}
  '';
}
