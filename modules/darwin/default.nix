{
  pkgs,
  username,
  ...
}:
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
    sudo -u ${username} defaults write NSGlobalDomain AppleAccentColor -int 1
    sudo -u ${username} \
      /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
  '';

  system.primaryUser = username;
}
