{ ... }:
let
  identity = import ./identity.nix;
in
{
  programs.git = {
    enable = true;
    signing.format = null;
    ignores = [
      ".scratch"
      "**/.claude/settings.local.json"
    ];
    settings = {
      user = identity.personal // {
        useConfigOnly = true;
      };
      pull.rebase = true;
      url."git@github.com:".insteadOf = "https://github.com/";
    };
    includes = [
      {
        condition = "gitdir:~/Projects/Oxide/";
        contents = {
          user = identity.oxide // {
            useConfigOnly = true;
          };
        };
      }
    ];
  };
}
