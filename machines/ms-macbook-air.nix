{ pkgs, ... }:
{
  # Let Determinate Nix handle Nix configuration.
  determinateNix = {
    enable = true;
    customSettings = {
      eval-cores = 0;
      extra-experimental-features = [
        "build-time-fetch-tree"
      ];
      extra-trusted-substituters = [
        "https://cache.flox.dev"
      ];
      extra-trusted-public-keys = [
        "flox-cache-public-1:7F4OyH7ZCnFhcze3fJdfyXYLQw/aV7GEed86nQ7IsOs="
      ];
    };
  };

  # nix-darwin uses zsh for its own scripts.
  programs.zsh.enable = true;

  environment.shells = [ pkgs.nushell ];

  system.defaults.NSGlobalDomain.AppleICUForce24HourTime = true;
  system.defaults.NSGlobalDomain.AppleIconAppearanceTheme = "RegularAutomatic";
  system.defaults.NSGlobalDomain.AppleInterfaceStyleSwitchesAutomatically = true;
  system.defaults.NSGlobalDomain.KeyRepeat = 2;
  system.defaults.NSGlobalDomain.InitialKeyRepeat = 15;

  system.activationScripts.postActivation.text = ''
    sudo -u sudomateo defaults write NSGlobalDomain AppleAccentColor -int 1
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
