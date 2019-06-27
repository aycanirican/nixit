{ pkgs ? import <nixpkgs> {}
, name ? "example"
, version ? "0.0.1"
, src ? /Users/fxr/dev/project1
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
  
  buildInputs = [ ghc ];

  installPhase = ''
    ${ghc}/bin/ghc --make Main.hs -o $out/${name}
  '';
}
