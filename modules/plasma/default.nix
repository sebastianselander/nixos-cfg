{ ... }:
{
  services = {
    xserver = {
      desktopManager = {
        plasma6.enable = true;
      };
      displayManager.sddm.enable = true;
    };
  };

}
