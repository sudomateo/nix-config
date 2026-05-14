{ identity, ... }:
{
  programs.git = {
    enable = true;
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
        condition = "gitdir:${identity.oxide.workDir}/";
        contents.user = {
          name = identity.oxide.name;
          email = identity.oxide.email;
          useConfigOnly = true;
        };
      }
    ];
  };
}
