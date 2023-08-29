{ config, pkgs, ... }:

let
    kmonad = (import ./kmonad-deriv/derivation.nix) pkgs;
in

{
    imports = [ ./kmonad-deriv/kmonad.nix ];

    boot.loader = {
        efi.canTouchEfiVariables = true;
        grub = {
            devices = [ "nodev" ];
            efiSupport = true;
            enable = true;
        };
    };

    # Enable networking
    networking.networkmanager.enable = true;

    nix = {
        settings.experimental-features = [ "nix-command" "flakes" ];
    };

    time.timeZone = "Europe/Stockholm";

    i18n = {
        defaultLocale = "en_US.UTF-8";
        extraLocaleSettings = {
            LC_ADDRESS = "sv_SE.UTF-8";
            LC_IDENTIFICATION = "sv_SE.UTF-8";
            LC_MEASUREMENT = "sv_SE.UTF-8";
            LC_MONETARY = "sv_SE.UTF-8";
            LC_NAME = "sv_SE.UTF-8";
            LC_NUMERIC = "sv_SE.UTF-8";
            LC_PAPER = "sv_SE.UTF-8";
            LC_TELEPHONE = "sv_SE.UTF-8";
            LC_TIME = "sv_SE.UTF-8";
        };
    };


    services = {
        xserver = {
            enable = true;
            layout = "us";
            xkbVariant = "";
            xkbOptions = "compose:ralt";
            displayManager.sddm.enable = true;
            desktopManager.plasma5.enable = true;
            autoRepeatDelay = 230;
            autoRepeatInterval = 55;
        };
        kmonad = {
            enable = true;
            configfiles = [ ../kmonad/laptop.kbd ];
            package = kmonad; 
        };
        pipewire = {
            enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
            pulse.enable = true;

        };
        printing.enable = true;
        blueman.enable = true;
        mullvad-vpn.enable = true;
    };

    sound.enable = true;
    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;

    virtualisation.docker.enable = true;

    users.users.sebastian = {
        isNormalUser = true;
        extraGroups = [
            "networkmanager"
                "wheel"
                "input"
                "uinput"
                "docker"
        ];
        shell = pkgs.zsh;
    };

    programs.zsh.enable = true;

    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
        mullvad-vpn
    ];

# This value determines the NixOS release from which the default
# settings for stateful data, like file locations and database versions
# on your system were taken. It‘s perfectly fine and recommended to leave
# this value at the release version of the first install of this system.
# Before changing this value read the documentation for this option
# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "23.05"; # Did you read the comment?
}
