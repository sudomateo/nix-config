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
  platform = if darwin then "darwin" else "nixos";
  systemFunc = if darwin then inputs.nix-darwin.lib.darwinSystem else nixpkgs.lib.nixosSystem;
  hmModule = inputs.home-manager."${platform}Modules".home-manager;
  determinateModule = inputs.determinate."${platform}Modules".default;
in
systemFunc {
  specialArgs = {
    inherit username;
  };
  modules = [
    { nixpkgs.hostPlatform = system; }
    ../modules/common
    (../modules + "/${platform}")
    ../machines/${name}
    determinateModule
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
  ];
}
