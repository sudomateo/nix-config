{ ... }:
{
  programs.nushell = {
    enable = true;

    settings = {
      show_banner = false;
    };

    environmentVariables = {
      PROMPT_COMMAND_RIGHT = "";
      EDITOR = "hx";
      VISUAL = "hx";
    };

    extraConfig = ''
      use std/util "path add"

      # Programming languages.
      $env.CARGO_HOME = ($env.HOME | path join ".local" "cargo")
      $env.GOPATH     = ($env.HOME | path join ".local" "gopath")

      # PATH configuration.
      path add [
          ($env.HOME | path join ".local" "bin"),
          ($env.GOPATH | path join "bin"),
          ($env.CARGO_HOME | path join "bin"),
          ($env.HOME | path join "bin"),
          "/usr/local/bin",
      ]
    '';
  };
}
