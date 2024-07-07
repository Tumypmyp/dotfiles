{ config, pkgs, ... }:

{
  virtualisation.oci-containers.enable = true;

  services.vaultwarden = {
    enable = true;
    image = "vaultwarden/server:latest"; # Specify the Docker image
    ports = [ { hostPort = 8081; } ]; # Expose port 80
    volumes = [ "/var/lib/vaultwarden/data:/data" ]; # Persistent storage
  };

  systemd.services.vaultwarden = {
    description = "Vaultwarden Server";
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];
    serviceConfig = {
      Restart = "always";
      User = "root";
      Group = "root";
      ExecStart = "${pkgs.docker}/bin/docker run --rm --detach --publish 80:80 --volume /var/lib/vaultwarden/data:/data ${config.services.vaultwarden.image}";
    };
  };
}

