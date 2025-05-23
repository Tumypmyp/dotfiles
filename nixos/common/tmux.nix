{...}:
{
  programs.tmux = {
    enable = true;
    clock24 = true;
    baseIndex = 1;
    extraConfig = '' # used for less common options, intelligently combines if defined in multiple places.
     # https://old.reddit.com/r/tmux/comments/mesrci/tmux_2_doesnt_seem_to_use_256_colors/
      set -g default-terminal "xterm-256color"
      set -ga terminal-overrides ",*256col*:Tc"
      set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'
      set-environment -g COLORTERM "truecolor"

      # Mouse works as expected
      set-option -g mouse on
    '';
  };
}
