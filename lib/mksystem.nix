# Build a darwin or NixOS system configuration from this repo's modules.
{ inputs }:
{
  name,
  system,
  username,
  darwin ? false,
}:
let
  identity = import ./identity.nix;

  # The system is built from `nixpkgs-unstable`; `nixpkgs` is the stable
  # input, used only to expose `pkgs-stable` for selective per-package use.
  systemFunc =
    if darwin then inputs.nix-darwin.lib.darwinSystem else inputs.nixpkgs-unstable.lib.nixosSystem;
  platformModule = if darwin then ../modules/darwin.nix else ../modules/nixos.nix;
  hmModule =
    if darwin then
      inputs.home-manager.darwinModules.home-manager
    else
      inputs.home-manager.nixosModules.home-manager;
  determinateModule =
    if darwin then
      inputs.determinate.darwinModules.default
    else
      inputs.determinate.nixosModules.default;

  # Stable Nixpkgs, exposed as the `pkgs-stable` argument in any module.
  pkgs-stable = import inputs.nixpkgs { inherit system; };
in
systemFunc {
  specialArgs = { inherit username identity pkgs-stable; };
  modules = [
    { nixpkgs.hostPlatform = system; }
    ../modules/common.nix
    platformModule
    ../machines/${name}
    determinateModule
    hmModule
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.backupFileExtension = "bak";
      home-manager.extraSpecialArgs = {
        inherit username identity pkgs-stable;
        helix = inputs.helix.packages.${system}.default;
        flox = inputs.flox.packages.${system}.default;
      };
      home-manager.users.${username} = import ../home;
    }
  ];
}
