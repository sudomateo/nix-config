{ pkgs, ... }:
{
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Let Determinate Nix handle Nix configuration.
  determinateNix = {
    enable = true;
    customSettings = {
      eval-cores = 0;
      extra-experimental-features = [
        "build-time-fetch-tree"
      ];
    };
  };

  # nix-darwin uses zsh for its own scripts.
  programs.zsh.enable = true;

  environment.shells = [ pkgs.nushell ];

  system.defaults.NSGlobalDomain.KeyRepeat = 2;
  system.defaults.NSGlobalDomain.InitialKeyRepeat = 15;

  system.activationScripts.postActivation.text = ''
    sudo -u sudomateo \
      /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
  '';

  system.primaryUser = "sudomateo";

  homebrew = {
    enable = true;
    casks = [
      "1password"
      "appcleaner"
      "claude"
      "discord"
      "element"
      "ghostty"
      "karabiner-elements"
      "linear-linear"
      "logi-options+"
      "microsoft-teams"
      "obs"
      "orbstack"
      "slack"
      "tunnelblick"
      "zoom"
    ];
    onActivation.autoUpdate = true;
    onActivation.cleanup = "uninstall";
  };

  system.stateVersion = 5;
}
