{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
  };

  users.users.pandenko = {
    shell = pkgs.fish;
  };

  programs.direnv = {
    enable = true;
    enableFishIntegration = true;
  };

  environment.systemPackages = with pkgs; [
    # fishPlugins.done
    fishPlugins.fzf-fish
#    fishPlugins.forgit
#    fishPlugins.plugin-git
#    fishPlugins.git-abbr
    # fishPlugins.hydro
    fzf
    fishPlugins.grc
    grc
  ];
}
