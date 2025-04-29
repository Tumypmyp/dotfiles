# System configuration files

Currently most of configuration is done for my NixOS machines.

## Setup NixOS config file

The main config file should import current cloned repo.

```
{ ... }:
let
  name = "moon";
in {
  networking.hostName = name;
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      (/home/pandenko/dotfiles/nixos + "/${name}/configuration.nix")
    ];
}

```
## Rebuild NixOS

* Run
```
rebuild
```
* Edit config in your file editor
* Safe and Exit

