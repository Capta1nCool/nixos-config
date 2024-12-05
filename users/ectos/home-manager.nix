{ config, pkgs , ... }:

{
  home.username = "ectos";
  home.homeDirectory = "/home/ectos";

  home.stateVersion = "24.05"; # Please read the comment before changing.
  
  home.packages = [
    # terminals

    pkgs.wezterm
    pkgs.kitty
    pkgs.alacritty
    pkgs.starship
    pkgs.zoxide

    # Apps

    pkgs.brave
    pkgs.telegram-desktop

    pkgs.zed-editor
    pkgs.zig
    pkgs.zls
    pkgs.rust-analyzer
    pkgs.rustup
    # pkgs.obsidian
  ];

  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      ".." = "cd ..";
    };
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.git = {
    enable = true;
    userEmail = "coder0807@gmail.com";
    userName = "Capta1nCool";
  };

  programs.wezterm = {
    enable = true;
    extraConfig = ''
      -- Lua configuration for WezTerm
      local wezterm = require 'wezterm'
      
      local config = wezterm.config_builder()

      -- Rendering fix
      config.enable_wayland = false
      config.front_end = "WebGpu" 

      -- Appearance
      config.color_scheme = 'Catppuccin Mocha'
      config.font = wezterm.font('JetBrainsMono Nerd Font')
      config.font_size = 10;

      -- Tab bar
      config.hide_tab_bar_if_only_one_tab = true;
      config.use_fancy_tab_bar = false
      config.tab_bar_at_bottom = true;

       
      return config
    ''; 
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
