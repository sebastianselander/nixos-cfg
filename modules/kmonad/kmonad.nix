{pkgs, ...}: {
  imports =
    [
      ./nixos-module.nix
    ];

  environment.systemPackages = with pkgs; [
    kmonad
  ];

  services.kmonad = {
   enable = true;
     keyboards = {
       myKMonadOutput = {
         device = "/dev/input/by-id/usb-04d9_USB-HID_Keyboard-event-kbd";
         config = builtins.readFile ./kmonad.kbd;
       };
     };
  };
}
