{ config, pkgs, inputs, lib, ... }:

{

  nixpkgs.config.allowUnfree = true;
# Remove unecessary preinstalled packages
  environment.defaultPackages = [ ];

  environment.sessionVariables = { GTK_USE_PORTAL = "1"; };

  services.printing.enable = true;

  programs.zsh.enable = true;

# Laptop-specific packages (the other ones are installed in `packages.nix`)
  environment.systemPackages = with pkgs; [
    acpi tlp git pciutils greetd.tuigreet
  ];

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --greeting 'Welcome to PwNixOS!' --cmd Hyprland";
        user = "d3fault";
      };
    };
  };



# Adding XWayland support
  programs.hyprland.xwayland.enable = true;

# Install fonts
  fonts = {
    fonts = with pkgs; [
      jetbrains-mono
        roboto
        openmoji-color
        (nerdfonts.override { fonts = [ "FiraCode" ]; })
        (nerdfonts.override { fonts = [ "FantasqueSansMono" ];})
    ];

    fontconfig = {
      hinting.autohint = true;
      defaultFonts = {
        emoji = [ "OpenMoji Color" ];
      };
    };
  };


# Wayland stuff: enable XDG integration
  xdg = {
    icons.enable = true;
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-hyprland
        xdg-desktop-portal-gtk
      ];
    };
  };

# DBUS??
  
  programs.dconf.enable = true;
  services.dbus.packages = with pkgs; [ dconf ];
  services.dbus.enable = true;

  services.gvfs = {
    enable = true;
    package = lib.mkForce pkgs.gnome3.gvfs;
  };

# Nix settings, auto cleanup and enable flakes
  nix = {
    settings.auto-optimise-store = true;
    settings.allowed-users = [ "d3fault" ];
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs = true
      keep-derivations = true
      '';
  };

# Boot settings: clean /tmp/, latest kernel and enable bootloader
  boot = {
    tmp.cleanOnBoot = true;
    loader = {
      systemd-boot.enable = true;
      systemd-boot.editor = false;
      efi.canTouchEfiVariables = true;
      timeout = 0;
    };
  };

# Set up locales (timezone and keyboard layout)
  time.timeZone = "Europe/Madrid";
  i18n.defaultLocale = "es_ES.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "es";
  };

# Set up user and enable sudo
  users.users.d3fault = {
    isNormalUser = true;
    extraGroups = [ "input" "wheel" "networkmanager" ];
    shell = pkgs.zsh;
  };

# Set up networking and secure it
  networking = {
    networkmanager.enable = true;
  };

# Set environment variables
  environment.variables = {
    NIXOS_CONFIG = "$HOME/.config/nixos/configuration.nix";
    NIXOS_CONFIG_DIR = "$HOME/.config/nixos/";
    NIXPKGS_ALLOW_INSECURE = "1";
    XDG_DATA_HOME = "$HOME/.local/share";
    GTK_RC_FILES = "$HOME/.local/share/gtk-1.0/gtkrc";
    GTK2_RC_FILES = "$HOME/.local/share/gtk-2.0/gtkrc";
    MOZ_ENABLE_WAYLAND = "1";
    EDITOR = "nvim";
    DIRENV_LOG_FORMAT = "";
    ANKI_WAYLAND = "1";
    DISABLE_QT5_COMPAT = "0";
    LIBSEAT_BACKEND = "logind";
    GTK_USE_PORTAL = "1";
  };

# Security 
  security = {
    sudo.enable = true;
# Extra security
    protectKernelImage = true;
    pam.services.swaylock = {};
  };

# Sound (PipeWire)
  sound.enable = true; 
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

# Disable bluetooth, enable pulseaudio, enable opengl (for Wayland)
  hardware = {
    bluetooth.enable = false;
    opengl = {
      enable = true;
      driSupport = true;
    };
  };

# Do not touch
  system.stateVersion = "23.05";
}
