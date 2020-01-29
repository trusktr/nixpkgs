{ pkgs ? import <nixpkgs> {}, version, sha256 }:

  let
    inherit (pkgs) stdenv autoPatchelfHook platforms fetchurl;
    inherit (stdenv) mkDerivation lib;
  
  in mkDerivation {
    inherit version;
  
    name = "nodejs-${version}";
  
    src = fetchurl {
      url = "https://nodejs.org/dist/v${version}/node-v${version}-linux-x64.tar.xz";
      inherit sha256;
    };

    # QUESTION: put glib and autoPatchelfHook in nativeBuildInputs or buildInputs?
    # static (buildtime) dependencies
    nativeBuildInputs = with pkgs; [autoPatchelfHook];
    # dynamic (linked/runtime) dependencies
    buildInputs = with pkgs; [glib];

    installPhase = ''
      mkdir -p $out
      cp -R ./ $out/
    '';
  
    meta = {
      description = "Event-driven I/O framework for the V8 JavaScript engine";
      homepage = https://nodejs.org;
      license = lib.licenses.mit;
      platforms = lib.platforms.linux;
    };
  
    #TODO do I need this?
    #passthru.python = python2; # to ensure nodeEnv uses the same version
  }
