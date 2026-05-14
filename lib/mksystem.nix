{
  nixpkgs,
  inputs,
}:

name:
{
  system,
  username,
  darwin ? false,
}:

let
  systemFunc = if darwin then inputs.nix-darwin.lib.darwinSystem else nixpkgs.lib.nixosSystem;
  hmModule =
    if darwin then
      inputs.home-manager.darwinModules.home-manager
    else
      inputs.home-manager.nixosModules.home-manager;
in
systemFunc {
  specialArgs = {
    inherit username;
  };
  modules = [
    {
      nixpkgs.hostPlatform = system;
      nixpkgs.config.allowUnfree = true;
    }
    ../machines/${name}.nix
    hmModule
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.backupFileExtension = "bak";
      home-manager.extraSpecialArgs = {
        inherit username;
        helix = inputs.helix;
        flox = inputs.flox.packages.${system}.default;
      };
      home-manager.users.${username} = import ../home;
    }
  ]
  ++ (
    if darwin then
      [ inputs.determinate.darwinModules.default ]
    else
      [ inputs.determinate.nixosModules.default ]
  );
}
