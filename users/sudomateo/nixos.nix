{ ... }:
{
  users.users.sudomateo = {
    name = "sudomateo";
    home = "/home/sudomateo";
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };
}
