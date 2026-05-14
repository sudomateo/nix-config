{ ... }:
{
  imports = [
    ./hardware.nix
  ];

  networking.hostName = "ms-fw-desktop";

  # Set when host was first installed; do not change.
  system.stateVersion = "25.11";
}
