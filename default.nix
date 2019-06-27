{ pkgs ? import <nixpkgs> {}
, name ? "example"
, version ? "0.0.1"
, packages ? [
    "aeson"
    "text"
    "transformers"
  ]
}:

let
  ghc = pkgs.haskellPackages.ghcWithPackages (ps: with ps; pkgs.lib.attrVals packages ps);
in

pkgs.stdenv.mkDerivation {
  inherit name version;
  
  src = ./.;

  buildInputs = [ ghc ];
  
  buildPhase = ''
    mkdir -p $out
    ${ghc}/bin/ghc --make Main.hs -o $out/${name}
  '';
  installPhase = ''
    
  '';
}
