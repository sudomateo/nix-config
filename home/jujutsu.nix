{ identity, ... }:
{
  programs.jujutsu = {
    enable = true;
    settings = {
      user = identity.personal;

      "--scope" = [
        {
          "--when" = {
            repositories = [ identity.oxide.workDir ];
          };
          user.email = identity.oxide.email;
        }
      ];

      ui.default-command = [ "log" ];

      git.colocate = true;

      templates.git_push_bookmark = "'sudomateo/' ++ change_id.short()";

      "template-aliases"."format_timestamp(timestamp)" = "timestamp.ago()";

      remotes.origin.auto-track-bookmarks = "sudomateo/*";
    };
  };
}
