{ ... }:
{  
  age.secrets.syncthing = {
    file = "/home/pandenko/dotfiles/nixos/secrets/syncthing.age";
  };
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    user = "pandenko";
    guiAddress = "0.0.0.0:8384";
    configDir = "/home/pandenko/.config/syncthing";
    settings.gui = {
      user = "pandenko";
      password = "pass";
    };
    settings = {
      folders = {
        "backups" = {
          path = "/home/pandenko/backups";
        };
      };
      devices = {
        "moon" = { id = "VLDXORB-JOJBJTZ-GQ23PN4-K4JSJ67-VSNWUCX-TBKB6F6-4KDWJSE-OUGSVQF"; };
      };
    };
  };
}
