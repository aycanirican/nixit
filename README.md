# nixit

Build my haskell executable using nix.

## Usage

  - You are in your project's directory
    ```
      cd $TMP
      mkdir project1; cd project1
    ```
    
  - You have a proper `Main.hs` file like this:
    ```
      module Main where
      
      main :: IO ()
      main = print "5 more minutes...Done."
    ```
  - Optionally you write all haskell dependencies (one for each line)
    in a file `.nixit.deps` like:
    ```
      aeson
      servant-client
      lens
    ```
    
Then you can have your executable with:
```
nix build -f https://github.com/aycanirican/nixit/archive/master.tar.gz \
  --arg    src  "$PWD" \
  --argstr deps "$(cat .nixit.deps | xargs)"
```

And also you can have a ghci session with:
```
  nix-shell -p "pkgs.haskellPackages.ghcWithPackages (p: with p; [ $(cat .nixit.deps | xargs) ])" \
    --command "ghci Main.hs"
```

Or if you want to just execute ghcid and watch it recompiling your project:
```
nix-shell -p "pkgs.haskellPackages.ghcWithPackages (p: with p; [ $(cat .nixit.deps | xargs) ])" \
  -p haskellPackages.ghcid \
  --command "ghcid --command \"ghci Main.hs\""
```

Or you may want to stick on a release:
```
NIX_PATH=nixpkgs=https://nixos.org/channels/nixos-19.09/nixexprs.tar.xz \
  nix-shell -p "pkgs.haskellPackages.ghcWithPackages (p: with p; [ $(cat .nixit.deps | xargs) ])" --command "ghci Main.hs"
```
