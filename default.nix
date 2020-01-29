{pkgs ? import <nixpkgs> {}}: {
  nodejs = (import ./nodejs { inherit pkgs; });
}
