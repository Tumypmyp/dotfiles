{ config
, lib
, pkgs
, inputs
, ...
}: {
  imports = [
    ../common
  ];

  wsl.enable = true;
  wsl.defaultUser = "pandenko";
  networking.hostName = "heart";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  # Enable the XFCE desktop environment
  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.xfce.enable = true;

  environment.systemPackages = with pkgs; [
    go

    tigervnc
    xorg.xinit
    cargo

    brave
    zed-editor
    anytype
  ];

  users.users.pandenko.extraGroups = [ "docker" ];
  virtualisation.docker.enable = true;
  virtualisation.docker.rootless = {
    #    enable = true;
    #    setSocketVariable = true;
  };


  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    };
  };
  system.stateVersion = "24.11";
}
