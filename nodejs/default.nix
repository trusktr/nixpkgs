{pkgs ? import <nixpkgs> {}}: {
  "13.6.0" = pkgs.callPackage ./nodejs.nix {
    inherit pkgs;
    version = "13.6.0";
    sha256 = "00f01315a867da16d1638f7a02966c608e344ac6c5b7d04d1fdae3138fa9d798";
  };
}
