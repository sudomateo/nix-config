{
  description = "Matthew Sanabria's nix configuration.";

  inputs = {
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0";
    nixpkgs-unstable.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1";
    determinate = {
      url = "https://flakehub.com/f/DeterminateSystems/determinate/3";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "https://flakehub.com/f/nix-darwin/nix-darwin/0.1";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    home-manager = {
      url = "https://flakehub.com/f/nix-community/home-manager/0.1";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      determinate,
      nix-darwin,
      home-manager,
      ...
    }@inputs:
    let
      supportedSystems = [
        "aarch64-darwin"
        "x86_64-linux"
        "aarch64-linux"
      ];
      forAllSystems = f: nixpkgs.lib.genAttrs supportedSystems f;
      mkSystem = import ./lib/mksystem.nix {
        inherit nixpkgs inputs;
      };
    in
    {
      darwinConfigurations.ms-macbook-air = mkSystem "ms-macbook-air" {
        system = "aarch64-darwin";
        user = "sudomateo";
        darwin = true;
      };

      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.nixfmt);

      devShells = forAllSystems (
        system:
        let
          pkgs = import nixpkgs { inherit system; };
          isDarwin = pkgs.stdenv.isDarwin;
        in
        {
          default = pkgs.mkShellNoCC {
            packages = [
              (pkgs.writeShellApplication {
                name = "apply";
                runtimeInputs = pkgs.lib.optionals isDarwin [
                  nix-darwin.packages.${system}.darwin-rebuild
                ];
                text =
                  if isDarwin then
                    ''
                      sudo darwin-rebuild switch \
                        --flake ".#''${1:-$(hostname -s)}"
                    ''
                  else
                    ''
                      sudo nixos-rebuild switch \
                        --flake ".#''${1:-$(hostname -s)}"
                    '';
              })
              self.formatter.${system}
            ];
          };
        }
      );
    };
}
