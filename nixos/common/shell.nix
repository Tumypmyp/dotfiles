{...}:
{
   
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
      rebuild = "~/dotfiles/nixos/common/rebuild.sh";
    };
    shellInit = ''
      export LANG=en_US.UTF-8
    '';
    histSize = 10000;
  };

}
