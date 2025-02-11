{...}:
{
   
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      la = "ls -lah";
      rebuild = "~/dotfiles/nixos/rebuild.sh";
    };
    shellInit = ''
      export LANG=en_US.UTF-8
    '';
    histSize = 10000;
  };

}
