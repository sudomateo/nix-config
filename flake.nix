{
  description = "Matthew Sanabria's nix configuration.";

  inputs = {
    flox.url = "github:flox/flox/latest";
    nixpkgs-unstable.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1";
    determinate = {
      url = "https://flakehub.com/f/DeterminateSystems/determinate/3";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    nix-darwin = {
      url = "https://flakehub.com/f/nix-darwin/nix-darwin/0.1";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    home-manager = {
      url = "https://flakehub.com/f/nix-community/home-manager/0.1";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    helix = {
      url = "github:helix-editor/helix";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs =
    {
      self,
      nixpkgs-unstable,
      nix-darwin,
      ...
    }@inputs:
    let
      supportedSystems = [
        "aarch64-darwin"
        "x86_64-linux"
        "aarch64-linux"
      ];
      forAllSystems = f: nixpkgs-unstable.lib.genAttrs supportedSystems f;
      mkSystem = import ./lib/mksystem.nix {
        nixpkgs = nixpkgs-unstable;
        inherit inputs;
      };
    in
    {
      darwinConfigurations.ms-macbook-air = mkSystem "ms-macbook-air" {
        system = "aarch64-darwin";
        username = "sudomateo";
        darwin = true;
      };

      nixosConfigurations.ms-fw-desktop = mkSystem "ms-fw-desktop" {
        system = "x86_64-linux";
        username = "ms";
      };

      formatter = forAllSystems (system: nixpkgs-unstable.legacyPackages.${system}.nixfmt);

      devShells = forAllSystems (
        system:
        let
          pkgs = import nixpkgs-unstable { inherit system; };
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
