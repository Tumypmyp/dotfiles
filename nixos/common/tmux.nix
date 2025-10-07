{ ... }:
{
  programs.tmux = {
    enable = true;
    clock24 = true;
    baseIndex = 1;
    #    mouse = true;
    extraConfig = ''
      set -g default-terminal "xterm-256color"
      set -ga terminal-overrides ",*256col*:Tc"
      set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'
      set-environment -g COLORTERM "truecolor"

      set -g status-left ""

      set-option -g mouse on
    '';
  };
}
