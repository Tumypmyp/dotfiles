{
  services.caddy = {
    enable = true;
    virtualHosts."localhost".extraConfig = ''
      reverse_proxy https://localhost:9000
    '';
  };
}
