{ config, inputs, pkgs, lib, unstablePkgs, ... }:
{
  home.stateVersion = "24.11";

  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    tmux.enableShellIntegration = true;
    defaultOptions = [
      "--no-mouse"
    ];
  };

  programs.git = {
    enable = true;
    userEmail = "10490273+nikolajjsj@users.noreply.github.com";
    userName = "nikolajjsj";
    diff-so-fancy.enable = true;
    lfs.enable = true;
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
      merge = {
        conflictStyle = "diff3";
        tool = "meld";
      };
      pull = {
        rebase = true;
      };
    };
  };

  programs.htop = {
    enable = true;
    settings.show_program_path = true;
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
  };

  programs.tmux = {
    enable = true;
    #keyMode = "vi";
    clock24 = true;
    historyLimit = 10000;
    plugins = with pkgs.tmuxPlugins; [
      gruvbox
      vim-tmux-navigator
    ];
    extraConfig = ''
      new-session -s main
      bind-key -n C-a send-prefix
    '';
  };

  programs.home-manager.enable = true;
  programs.nix-index.enable = true;

  programs.bat.enable = true;
  programs.bat.config.theme = "Nord";

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
    extraLuaConfig = ''
      ${builtins.readFile ../../nvim/init.lua}
    '';
  };

  programs.ssh = {
    enable = true;
    extraConfig = ''
  StrictHostKeyChecking no
    '';
    matchBlocks = {
      "m morpheus" = {
        hostname = "morpheus";
        user = "nikolaj";
      };
      # "pihole" = {
      #   hostname = "10.42.0.253";
      #   user = "root";
      # };
    };
  };
}
