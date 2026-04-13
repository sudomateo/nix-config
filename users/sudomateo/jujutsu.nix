{ ... }:
{
  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        name = "Matthew Sanabria";
        email = "me@matthewsanabria.dev";
      };

      "--scope" = [
        {
          "--when" = {
            repositories = [ "~/src/oxide" ];
          };
          user.email = "matthew.sanabria@oxide.computer";
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
