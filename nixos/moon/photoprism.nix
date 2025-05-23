{ 
  pkgs,
  config,
  ... 
}:
{
  age.secrets.photoprism = {
    file = "/home/pandenko/dotfiles/nixos/secrets/photoprism.age";
    path = "/var/lib/photoprism/config/options.yml";
  };
  services.photoprism = {
    enable = true;
    port = 2342;
    originalsPath = "/var/lib/private/photoprism/originals";
    address = "0.0.0.0";
    settings = {
      PHOTOPRISM_CONFIG_PATH = "/var/lib/photoprism/config";
      PHOTOPRISM_ADMIN_USER = "pandenko";
   #   PHOTOPRISM_ADMIN_PASSWORD = "...";
      PHOTOPRISM_DEFAULT_LOCALE = "en";
      PHOTOPRISM_DATABASE_DRIVER = "mysql";
      PHOTOPRISM_DATABASE_NAME = "photoprism";
      PHOTOPRISM_DATABASE_SERVER = "/run/mysqld/mysqld.sock";
      PHOTOPRISM_DATABASE_USER = "photoprism";
    #  PHOTOPRISM_SITE_URL = "http://sub.domain.tld:2342";
      PHOTOPRISM_SITE_TITLE = "My PhotoPrism";

      PHOTOPRISM_UPLOAD_NSFW = "true";
    };
  };
  services.mysql = {
    enable = true;
    dataDir = "/data/mysql";
    package = pkgs.mariadb;
    ensureDatabases = [ "photoprism" ];
    ensureUsers = [ 
      {
        name = "photoprism";
        ensurePermissions = {
          "photoprism.*" = "ALL PRIVILEGES";
        };
      }
    ];
  };
}
