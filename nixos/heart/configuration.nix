# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL
{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    # include NixOS-WSL modules
    # <nixos-wsl/modules>
    ../common
  ];

  wsl.enable = true;
  wsl.defaultUser = "pandenko";

  networking.hostName = "heart";

  nix.settings.experimental-features = ["nix-command" "flakes"];

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    go

    cargo
    #    dioxus-cli
  ];

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    ruby
    openssl
    rpm
    gtk3
    libdrm
    mesa
    libxkbcommon
    libxcrypt
    #    libxcrypt-compat

    binutils
    glibc.static
    gcc
    protobuf3_21
    protoc-gen-grpc-web
    protoc-gen-js
  ];
  services.envfs.enable = true;

  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  system.stateVersion = "24.11";
}
