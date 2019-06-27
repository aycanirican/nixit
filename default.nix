{ pkgs ? import <nixpkgs> {}
, name ? "example"
, version ? "0.0.1"
, deps ? "warp aeson conduit conduit-extra http-client"
}:

let
  ghc = pkgs.haskellPackages.ghcWithPackages (ps:
    with ps; pkgs.lib.attrVals (pkgs.lib.splitString " " deps) ps
  );
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
