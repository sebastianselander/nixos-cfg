{ pkgs, ... }: {
  services = {
    plex = {
      enable = true;
      openFirewall = true;
      dataDir = "/home/sebastian/Videos";
      user = "sebastian";
      group = "plex";
    };
  };
  environment.systemPackages = with pkgs; [ plex-media-player ];
}
