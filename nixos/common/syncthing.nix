{ ... }:
{  
#  age.secrets.syncthing = {
#    file = "/home/pandenko/dotfiles/nixos/secrets/syncthing.age";
#  };
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
          devices = [ "heart" "moon" ];
        };
        "docs, concepts" = {
          id = "gvqru-98eqc";
          path = "/home/pandenko/backups/docs";
          devices = [ "heart" "moon" "tablet" "phone" "windows" ];
        };
      };

      devices = {
        "moon" = { id = "VLDXORB-JOJBJTZ-GQ23PN4-K4JSJ67-VSNWUCX-TBKB6F6-4KDWJSE-OUGSVQF"; };
        "heart" = { id = "FL2RAAG-GV3WN46-5YTHYNV-7FMXJMZ-5MYYVXV-2R2KR6D-A6GOOJ7-FVUTXAY"; };
        "tablet" = { id = "YDT72CO-K63SAP2-DTKYSCJ-HO2ILUZ-MAXSPAW-YOFSHN5-JIXOVN6-MDU5NAM"; };
        "phone" = { id = "HNYOF7D-XFC645Y-EB64VP3-AH7FVSN-ZI4MGB4-TXC676C-6OLWJSK-ENWDXAC"; };
        "windows" = { id = "A25EUXY-MWZ7ZAY-3C3U4XT-SXV7NSN-MA5EE4J-ULSYDSA-34IV6DV-VWIQGAT"; };
      };
    };
  };
}
