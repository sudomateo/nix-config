{
  pkgs,
  lib,
  username,
  ...
}:
let
  isDarwin = pkgs.stdenv.isDarwin;
  homeDir = if isDarwin then "/Users/${username}" else "/home/${username}";
in
{
  time.timeZone = "America/New_York";

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "1password-cli"
      "terraform"
    ];

  environment.systemPackages = with pkgs; [
    btop
    curl
    git
    jq
    ripgrep
    tree
    vim
  ];

  users.users.${username} = {
    name = username;
    home = homeDir;
  }
  // lib.optionalAttrs (!isDarwin) {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO9B5TmYgH16K521eYHE5+6vlfkh/8lRUXNglEosIX4R"
    ];
  };
}
