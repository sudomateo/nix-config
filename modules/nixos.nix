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

  # Shell.  Keep bash as the login shell so /etc/profile and friends run, but
  # hand off to nushell for interactive sessions (e.g., SSH).  The nushell
  # binary itself is provided by home-manager in the user profile.
  environment.loginShellInit = ''
    if [[ $- == *i* ]] && [ -x "$(command -v nu)" ]; then
      exec nu -l
    fi
  '';

  # Boot.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Networking.  Configure connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  # SSH.
  services.openssh.enable = true;

  # Allow dynamically linked executables built for generic Linux (e.g.,
  # binaries installed outside of Nix like the Amp CLI) to find a dynamic
  # linker and common libraries.  See https://nix.dev/permalink/stub-ld.
  programs.nix-ld.enable = true;
}
