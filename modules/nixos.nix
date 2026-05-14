{
  pkgs,
  identity,
  username,
  ...
}:
{
  # User.
  users.users.${username} = {
    name = username;
    home = "/home/${username}";
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    openssh.authorizedKeys.keys = identity.sshKeys;
  };

  # Boot.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Networking.  Configure connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  # SSH.
  services.openssh.enable = true;
}
