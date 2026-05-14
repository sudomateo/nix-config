{
  pkgs,
  flox,
  username,
  ...
}:
{
  imports = [
    ./amp
    ./direnv.nix
    ./ghostty.nix
    ./git.nix
    ./helix.nix
    ./jujutsu.nix
    ./k9s
    ./nushell.nix
    ./ssh.nix
  ];

  home.username = username;

  # Set when home-manager was first applied; do not change.
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    _1password-cli
    btop
    curl
    flox
    gh
    jq
    kind
    kubelogin-oidc
    nodejs
    ripgrep
    terraform
    tree
  ];
}
