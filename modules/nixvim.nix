{ pkgs, ... }: {
  programs.nixvim = {
    enable = true;

    keymaps = [ ] ++ import ./nixvim/keymaps.nix;

    globals = {
      mapleader = " ";
      have_nerd_font = true;
    };
    performance.byteCompileLua = {
      enable = true;
      nvimRuntime = true;
      plugins = true;
    };

    colorschemes.tokyonight.enable = true;

    plugins = {
      web-devicons.enable = true;
      telescope = {
        enable = true;
        keymaps = {
          "<leader>sg" = "live_grep";
          "<leader>sf" = "find_files";
        };
      };

      neo-tree.enable = true;

      cmp = {
        autoEnableSources = true;
        settings.snippet = {
          expand = ''
            function(args)
            require("luasnip").lsp_expand(args.body)
            end
          '';
        };
        settings.sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
          {
            name = "luasnip";
            option = { show_autosnippets = true; };
          }
        ];
      };

      lsp-format = { enable = true; };

      none-ls = {
        enable = true;
        sources.formatting = {
          rubocop.enable = true;
          nixfmt.enable = true;
        };
      };

      luasnip = {
        enable = true;
        settings.enable_autosnippets = true;
      };

      lualine.enable = true;

      treesitter = {
        enable = true;

        settings = {
          # NOTE: You can set whether `nvim-treesitter` should automatically install the grammars.
          auto_install = true;
          ensure_installed = [
            "git_config"
            "git_rebase"
            "gitattributes"
            "gitcommit"
            "gitignore"
          ];
        };
      };
      lsp = {
        enable = true;
        inlayHints = true;
        keymaps = {
          diagnostic = {
            "<leader>j" = "goto_next";
            "<leader>k" = "goto_prev";
          };
        };
        servers = {
          nixd = {
            enable = true;
            settings.formatting.command = [ "nixpkgs-fmt" ];
            cmd = [ "nixd" ];
          };
          ruby_lsp = {
            enable = true;
            cmd = [ "bundle" "exec" "ruby-lsp" ];
          };
        };
      };

    };
  } // import ./nixvim/opts.nix;
}
