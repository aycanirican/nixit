# nixit

Build my haskell project using nix.

## nixit assumes

  - You are in your project's directory
	```
	  mkdir 
	```
  - You defined your haskell dependencies as a list
  - You have a proper Main.hs file
  - 
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
  --argstr version  "0.0.1" \
  --argstr name     "myexecutable" \
  --argstr deps     "$(cat .nixit.deps | xargs)"
```

And also you can have a ghci session:
```
  nix-shell -p "pkgs.haskellPackages.ghcWithPackages (p: with p; [ $(cat .nixit.deps | xargs) ])";
```
