{ ... }:
{
  programs.k9s = {
    enable = true;
    settings.k9s.ui.skin = "gruvbox-light";
    skins = {
      gruvbox-dark = import ./gruvbox-dark.nix;
      gruvbox-light = import ./gruvbox-light.nix;
    };
  };
}
