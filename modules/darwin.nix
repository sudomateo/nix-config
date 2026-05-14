{ pkgs, username, ... }:
{
  # User.
  users.users.${username} = {
    name = username;
    home = "/Users/${username}";
  };
  system.primaryUser = username;

  # Nix.  Determinate Nix manages /etc/nix/nix.conf for us.
  determinateNix = {
    enable = true;
    customSettings = {
      eval-cores = 0;
      extra-experimental-features = [ "build-time-fetch-tree" ];
      extra-trusted-substituters = [ "https://cache.flox.dev" ];
      extra-trusted-public-keys = [
        "flox-cache-public-1:7F4OyH7ZCnFhcze3fJdfyXYLQw/aV7GEed86nQ7IsOs="
      ];
    };
  };

  # Shells.  nix-darwin uses zsh for its own scripts.
  programs.zsh.enable = true;
  environment.shells = [ pkgs.nushell ];

  # macOS system defaults.
  system.defaults.NSGlobalDomain = {
    AppleICUForce24HourTime = true;
    AppleIconAppearanceTheme = "RegularAutomatic";
    AppleInterfaceStyleSwitchesAutomatically = true;
    KeyRepeat = 2;
    InitialKeyRepeat = 15;
  };

  # AppleAccentColor isn't a typed nix-darwin option, so write it through the
  # CustomUserPreferences escape hatch.
  system.defaults.CustomUserPreferences.NSGlobalDomain.AppleAccentColor = 1;

  # Reload macOS preferences after activation so changes apply without a
  # logout/login cycle.
  system.activationScripts.postActivation.text = ''
    sudo -u ${username} \
      /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
  '';

  # Homebrew.  Casks shared across all Darwin machines; per-machine extras can
  # be appended in the machine module.
  homebrew = {
    enable = true;
    onActivation.autoUpdate = true;
    onActivation.cleanup = "uninstall";
    casks = [
      "1password"
      "appcleaner"
      "claude"
      "discord"
      "element"
      "ghostty"
      "karabiner-elements"
      "linear"
      "logi-options+"
      "microsoft-teams"
      "mullvad-vpn"
      "obs"
      "orbstack"
      "slack"
      "tunnelblick"
      "zoom"
    ];
  };
}
