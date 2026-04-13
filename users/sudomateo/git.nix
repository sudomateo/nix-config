{ ... }:
{
  programs.git = {
    enable = true;
    signing.format = null;
    ignores = [
      ".scratch"
      "**/.claude/settings.local.json"
    ];
    settings = {
      user = {
        name = "Matthew Sanabria";
        email = "me@matthewsanabria.dev";
        useConfigOnly = true;
      };
      pull.rebase = true;
      url."git@github.com:".insteadOf = "https://github.com/";
    };
    includes = [
      {
        condition = "gitdir:~/src/oxide/";
        contents = {
          user = {
            name = "Matthew Sanabria";
            email = "matthew.sanabria@oxide.computer";
            useConfigOnly = true;
          };
        };
      }
    ];
  };
}
