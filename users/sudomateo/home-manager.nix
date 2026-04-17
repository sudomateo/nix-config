{
  lib,
  pkgs,
  flox,
  ...
}:
let
  isLinux = pkgs.stdenv.isLinux;
in
{
  imports = [
    ./direnv.nix
    ./ghostty.nix
    ./git.nix
    ./helix.nix
    ./jujutsu.nix
    ./k9s.nix
    ./nushell.nix
    ./ssh.nix
  ];

  home.username = "sudomateo";
  home.stateVersion = "24.11";

  home.packages =
    with pkgs;
    [
      _1password-cli
      btop
      curl
      flox
      gh
      jq
      nodejs
      kind
      kubelogin-oidc
      ripgrep
      terraform
      tree
    ]
    ++ lib.optionals isLinux [
    ];

  xdg.configFile = {
    "amp/settings.json".source = ./amp-settings.json;
    "amp/AGENTS.md".source = ./amp-AGENTS.md;
  };
}
