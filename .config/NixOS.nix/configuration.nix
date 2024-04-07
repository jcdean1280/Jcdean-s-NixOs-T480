# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.joey = {
    isNormalUser = true;
    description = "joey";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.steam.enable = true; 

 #Laptop power managment services
  services.thermald.enable = true;
  services.tlp.enable = true;
  

  #lightdm login manager   
#  services.xserver = {
#    enable = true;
#    autorun = true;
#    displayManager = {
#    sddm.enable = true;
#    };
#    
#
#    };
 


  #Chosen desktop environment
  #programs.hyprland.enable = true;

  #moving over to sway
  programs.sway.enable = true;

  #secure waylock with pam
  security.pam.services.swaylock = {};

  fonts.packages = with pkgs; [
   font-awesome
 ];   
  
  #enabled flatpak support
  services.flatpak.enable = true;  

  #Secure sound config with pipewire, alsa and pulse audio
  security.rtkit.enable = true;
  services.pipewire = { 
  enable = true;
  alsa.enable = true;
  alsa.support32Bit = true;
  pulse.enable = true;


};


#  s
#  hardware.pulseaudio.enable = true;
#  hardware.pulseaudio.support32Bit = true;   
#  users.extraUsers.joey.extraGroups = [ "audio" ... ];  
  
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    kitty
    alacritty
    xterm
    python3
    openssh
    waybar
    swayimg
    mpv
    mako
    swaybg
    swayidle
    swaylock-effects
    git
    firefox
    wev
    alsa-oss
    alsa-utils
    pavucontrol
    pipewire
    pulseaudio
    brightnessctl
    wlsunset
    tlp
    pkgs.xfce.thunar
    pkgs.xfce.thunar-volman
    pkgs.gtk4
    pkgs.lxappearance
    pkgs.font-awesome_5
    pkgs.font-awesome_4
    pkgs.font-awesome
    pkgs.grim
    pkgs.slurp
    pkgs.gimp
    pkgs.vlc
    pkgs.neofetch
    pkgs.htop
    pkgs.elinks
    pkgs.p7zip
    pkgs.unzip 
 #  pkgs.steam
     
 ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
    services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
