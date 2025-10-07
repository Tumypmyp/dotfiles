{ inputs
, ...
}:
{
  imports = [ inputs.nixvim.nixosModules.nixvim ];
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    viAlias = true;
    imports = [ ./theme.nix ];

    plugins = {
      blink-cmp.enable = true;
      transparent = {
        enable = true;
        autoLoad = true;
      };
      telescope = {
        enable = true;
        extensions = {
          fzf-native = {
            enable = true;
          };
        };
      };
      web-devicons.enable = true;

      lsp-format = {
        enable = true;
      };
      lsp = {
        enable = true;
        inlayHints = true;
        servers = {

          zls.enable = true;
          # Zig
          # zig-language-server = {
          #   enable = true;
          # };

          # Rust
          rust_analyzer = {
            enable = true;
            installRustc = true;
            installCargo = true;
          };

          # Golang
          gopls = {
            enable = true;
            autostart = true;
          };
        };
        keymaps = {
          silent = true;
          lspBuf = {
            gd = {
              action = "definition";
              desc = "Goto Definition";
            };
            gr = {
              action = "references";
              desc = "Goto References";
            };
            gD = {
              action = "declaration";
              desc = "Goto Declaration";
            };
            gI = {
              action = "implementation";
              desc = "Goto Implementation";
            };
            gT = {
              action = "type_definition";
              desc = "Type Definition";
            };
          };
        };
      };
    };

    keymaps = [
      # Telescope bindings

      {
        action = "<cmd>Telescope live_grep<CR>";
        key = "<leader>fw";
      }
      {
        action = "<cmd>Telescope find_files<CR>";
        key = "<leader>ff";
      }
      {
        action = "<cmd>Telescope git_commits<CR>";
        key = "<leader>fg";
      }
      {
        action = "<cmd>Telescope oldfiles<CR>";
        key = "<leader>fh";
      }
      {
        action = "<cmd>Telescope colorscheme<CR>";
        key = "<leader>ch";
      }
      {
        action = "<cmd>Telescope man_pages<CR>";
        key = "<leader>fm";
      }
    ];

    globals = {
      localleader = " ";
      mapleader = ",";
    };
    opts = {

      # Show line numbers
      number = true;

      # Show relative line numbers
      relativenumber = true;

      # Use the system clipboard
      clipboard = "unnamedplus";

      # Number of spaces that represent a <TAB>
      tabstop = 2;
      softtabstop = 2;

      # Show tabline always
      showtabline = 2;

      # Use spaces instead of tabs
      expandtab = true;

      # Enable smart indentation
      smartindent = true;

      # Number of spaces to use for each step of (auto)indent
      shiftwidth = 2;

      # Enable break indent
      breakindent = true;

      # Highlight the screen line of the cursor
      cursorline = true;

      # Minimum number of screen lines to keep above and below the cursor
      scrolloff = 8;

      # Enable mouse support
      mouse = "a";

      # Set folding method to manual
      foldmethod = "manual";

      # Disable folding by default
      foldenable = false;

      # Wrap long lines at a character in 'breakat'
      linebreak = true;

      # Disable spell checking
      spell = false;

      # Disable swap file creation
      swapfile = false;

      # # Time in milliseconds to wait for a mapped sequence to complete
      # timeoutlen = 300;
      #
      # # Don't show mode in the command line
      # showmode = false;

      # Open new split below the current window
      splitbelow = true;

      # Keep the screen when splitting
      splitkeep = "screen";

      # Open new split to the right of the current window
      splitright = true;

      # Hide command line unless needed
      cmdheight = 0;

      # Remove EOB
      fillchars = {
        eob = " ";
      };
    };
  };
}
