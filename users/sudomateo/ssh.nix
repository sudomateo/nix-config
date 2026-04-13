{ ... }:
{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    includes = [ "ssh_config.d/*" ];
    matchBlocks."*" = {
      extraOptions = {
        AddKeysToAgent = "yes";
        SetEnv = "TERM=xterm-256color";
      };
    };
  };
}
