{ ... }:
{  
  age.secrets.syncthing = {
    file = "/home/pandenko/dotfiles/nixos/secrets/syncthing.age";
  };
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    guiAddress = "0.0.0.0:8384";
    settings.gui = {
      user = "pandenko";
      password = "pass";
    };
  };
}
