{pkgs, ...}:
{
   
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
  };

  users.extraUsers.pandenko = {
    shell = pkgs.fish;
  };

  users.defaultUserShell = pkgs.zsh;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    ohMyZsh = {
      enable = true;
      theme = "crcandy";
    };
     shellAliases = {
      la = "ls -lah";
    };
   histSize = 10000;
  };

}
