{ ... }:
{
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
    onActivation.autoUpdate = true;
    onActivation.cleanup = "uninstall";
  };

  # Set when host was first installed; do not change.
  system.stateVersion = 5;
}
