{ pkgs, ... }:

{
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        devices = [ "nodev" ];
        efiSupport = true;
        enable = true;
      };
    };
  };

  # Enable networking
  networking = {
    networkmanager.enable = true;
    firewall.enable = false;
  };

  nix = {
    settings = { experimental-features = [ "nix-command" "flakes" ]; };

  };
  fonts.packages = with pkgs; [
    julia-mono
    iosevka
    ibm-plex
    victor-mono
    nerdfonts
    monaspace
    font-awesome
    hack-font
    corefonts
    vistafonts
  ];

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
    openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = false;
      };
    };
    fstrim = {
      interval = "weekly";
      enable = true;
    };

    xserver = {
      enable = true;
      xkb = {
        layout = "us,se";
        variant = "";
        options = "grp:win_space_toggle,compose:ralt,caps:escape";
      };
    };
    pipewire = {
      enable = true;
      audio.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      jack.enable = true;
    };

    printing.enable = true;
    mullvad-vpn.enable = true;
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  security.rtkit.enable = true;

  virtualisation.docker.enable = true;
  virtualisation.podman.enable = true;

  users.users.sebastian = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "video"
    ];
    shell = pkgs.zsh;
  };

  nixpkgs.config.allowUnfree = true;
  nix.optimise = { automatic = true; };
  programs = {
    zsh.enable = true;
    dconf.enable = true;
    command-not-found.enable = false;
    nix-index-database.comma.enable = true;
  };

  xdg.mime = {
    defaultApplications = {
      "application/pdf" = "org.pwmt.zathura-pdf-mupdf.desktop";
    };
  };

  environment.systemPackages = with pkgs; [
    mullvad-vpn
    zsh
    pulseaudioFull
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
