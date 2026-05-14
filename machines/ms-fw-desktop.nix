{ pkgs, ... }:
{
  imports = [
    ./ms-fw-desktop-hardware.nix
  ];

  users.users.ms = {
    name = "ms";
    home = "/home/ms";
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO9B5TmYgH16K521eYHE5+6vlfkh/8lRUXNglEosIX4R"
    ];
  };

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "ms-fw-desktop";

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  time.timeZone = "America/New_York";

  environment.systemPackages = with pkgs; [
    btop
    curl
    git
    jq
    ripgrep
    tree
    vim
  ];

  services.openssh.enable = true;

  system.stateVersion = "25.11";
}
