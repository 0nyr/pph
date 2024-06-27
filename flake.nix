{
  description = "LaTex Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = github:numtide/flake-utils;
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        # development environment
        devShells.default = pkgs.mkShell {
          packages = [
            # LaTeX
            pkgs.texlive.combined.scheme-full
            pkgs.biber
            pkgs.gnumake
            
            # Adding Java for LTeX spell checker (vscode extension)
            pkgs.openjdk11
          ];

          # environment variables for Java
          JAVA_HOME = "${pkgs.openjdk11}";
          JAVA_OPTS = "-Xms64m -Xmx512m";
        };
      }
    );
}
