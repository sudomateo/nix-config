{ pkgs, ... }:
let
  isDarwin = pkgs.stdenv.isDarwin;
in
{
  programs.ghostty = {
    enable = true;
    package = if isDarwin then null else pkgs.ghostty;
    settings = {
      command = if isDarwin then "zsh -lc 'exec nu --interactive'" else "nu --interactive";
      theme = "light:Gruvbox Light,dark:Gruvbox Dark";
      font-family = "Berkeley Mono";
      font-style-bold = "Bold";
      font-style-bold-italic = "SemiBold Oblique";
      font-style-italic = "Light Oblique";
      font-style = "Retina";
      adjust-cell-height = "5%";
      adjust-cell-width = "0%";
      window-padding-x = 5;
      window-padding-y = 5;
      split-divider-color = "#000000";
      unfocused-split-fill = "#000000";
      unfocused-split-opacity = "0.80";
    };
  };
}
