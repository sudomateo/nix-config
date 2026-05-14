{ pkgs, lib, ... }:
{
  time.timeZone = lib.mkDefault "America/New_York";

  # home-manager inherits this because `useGlobalPkgs = true`.
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "1password-cli"
      "terraform"
    ];

  # Minimal system packages; user tools live in home-manager.
  environment.systemPackages = with pkgs; [
    curl
    git
    vim
  ];
}
