{pkgs, ...}:
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
  
  # users.defaultUserShell = pkgs.bash;
  #
  # programs.zsh = {
  #   enable = true;
  #   enableCompletion = true;
  #   autosuggestions.enable = true;
  #   syntaxHighlighting.enable = true;
  #
  #   ohMyZsh = {
  #     enable = true;
  #     theme = "crcandy";
  #   };
  #    shellAliases = {
  #     la = "ls -lah";
  #   };
  #  histSize = 10000;
  # };
  #
}
