{ pkgs, ... }: {
  services = {
    plex = {
      enable = false;
      openFirewall = true;
      dataDir = "/home/sebastian/Videos";
      user = "sebastian";
      group = "plex";
    };
  };
  environment.systemPackages = with pkgs; [ plex-desktop ];
}
