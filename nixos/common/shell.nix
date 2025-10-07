{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
     
    '';
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = true; # Keep the prompt on a single line
      # Configure the format to only show the current directory and the prompt character
      format = "$directory$git_branch$git_status$character";
      # format = "$character";
      character = {
        success_symbol = "[>](bold green)";
        error_symbol = "[✗](bold red)";
      };
      # Explicitly disable common noisy modules for a truly minimal experience
      git_branch.disabled = true;
      git_status.disabled = true;
      kubernetes.disabled = true;
      aws.disabled = true;
      username.disabled = true;
      hostname.disabled = true;
      # nix_shell = {
      #   format = "[> ](bold green)";
      #   disabled = false;
      # };

    };
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
