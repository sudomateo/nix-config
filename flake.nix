{
  description = "Matthew Sanabria's nix configuration.";

  # Inputs use FlakeHub semver pins where possible; github: only when a
  # project doesn't publish to FlakeHub.
  #
  # `nixpkgs` tracks the current stable release (FlakeHub `0`) and is
  # exposed as `pkgs-stable` via specialArgs for selective per-package use.
  # `nixpkgs-unstable` tracks rolling unstable (FlakeHub `0.1`) and drives
  # the system: it is the source of `pkgs` everywhere and what nix-darwin /
  # home-manager / determinate / helix follow, since those flakes are
  # pinned to their unstable lines.
  inputs = {
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0";
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
      url = "https://flakehub.com/f/helix-editor/helix/0.1";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    flox.url = "github:flox/flox/latest";
  };

  outputs =
    {
      self,
      nixpkgs,
      nix-darwin,
      ...
    }@inputs:
    let
      mkSystem = import ./lib/mksystem.nix { inherit inputs; };
      forAllSystems = nixpkgs.lib.genAttrs [
        "aarch64-darwin"
        "x86_64-linux"
      ];
    in
    {
      darwinConfigurations.ms-macbook-air = mkSystem {
        name = "ms-macbook-air";
        system = "aarch64-darwin";
        username = "ms";
        darwin = true;
      };

      nixosConfigurations.ms-fw-desktop = mkSystem {
        name = "ms-fw-desktop";
        system = "x86_64-linux";
        username = "ms";
      };

      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.nixfmt);

      devShells = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          rebuild = if pkgs.stdenv.isDarwin then "darwin-rebuild" else "nixos-rebuild";
        in
        {
          default = pkgs.mkShellNoCC {
            packages = [
              (pkgs.writeShellApplication {
                name = "apply";
                runtimeInputs = pkgs.lib.optionals pkgs.stdenv.isDarwin [
                  nix-darwin.packages.${system}.darwin-rebuild
                ];
                text = ''
                  target="''${1:-$(hostname -s)}"
                  shift || true
                  echo "flake.lock last modified: $(date -r flake.lock)"
                  echo "Building configuration for: ''${target}"
                  sudo ${rebuild} switch --flake ".#''${target}" "$@"
                '';
              })
              self.formatter.${system}
            ];
          };
        }
      );
    };
}
