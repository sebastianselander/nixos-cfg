{pkgs, ...}: {
  imports =
    [
      ./nixos-module.nix
    ];

  environment.systemPackages = with pkgs; [
    haskellPackages.kmonad
  ];

  services.kmonad = {
   enable = true;
     keyboards = {
       myKMonadOutput = {
         device = "/dev/input/by-id/usb-04d9_USB-HID_Keyboard-event-kbd";
         config = builtins.readFile ./kmonad.kbd;
       };
     };

    # If you've installed KMonad from a different source, update this property
    package = pkgs.haskellPackages.kmonad;
  };

}
