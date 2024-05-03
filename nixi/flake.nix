{
  description = "my minimal flake";
  inputs = {
    # Where we get most of our software
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    # Home Manager - manages dotfiles configs symlinks to home directory
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Controls system level software and settings including fonts
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = inputs: {
    darwinConfigurations = inputs.darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      pkgs = import inputs.nixpkgs { 
        system = "aarch64-darwin";
      };
      modules = [
        ({ pkgs, ... }: {
          services.nix-daemon.enable = true;

          # Here go the darwin preferences and configuration
          programs.zsh.enable = true;
          environment.shells = [ pkgs.bash pkgs.zsh ];
          environment.loginShell = pkgs.zsh;
          nix.extraOptions = ''
            experimental-features = nix-command flakes
          '';
          systemPackages = [ pkgs.coreutils ];
          # Key remapping
          system.keyboard.enableKeyMapping = true;
          system.keyboard.remapCapsLockToEscape = true;
          # Fonts
          fonts.fontDir.enable = true; # DANGER
          fonts.fonts = [ 
            (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; })
          ];

          # Preferences
          system.defaults.finder.AppleShowAllExtensions = true;
          system.defaults.dock.autohide = true;
          system.defaults.NSGlobalDomain.AppleShowAllExtensions = true;
          system.defaults.NGGlobalDomain.KeyRepeat = 1;
          system.defaults.NGGlobalDomain.InitialKeyRepeat = 14;
        })

        (inputs.home-manager.darwinModules.home-manager {
          home-manager = {
            useGlobalPkgs = true;
            useUserPkgs = true;
            users.nikolaj.imports = [
              ({ pkgs, ... }: {
                home.stateVersion = "22.11";
                # Specify the home-manager configuration
                home.packages = [
                  pkgs.ripgrep
                  pkgs.fd
                  pkgs.bat
                  pkgs.fzf
                  pkgs.git
                  pkgs.exa
                ];
                home.sessionVariables = {
                  EDITOR = "nvim";
                };
                programs.zsh.enable = true;
                programs.zsh.enableCompletion = true;
                programs.zsh.enableAutosuggestions = true;
                programs.zsh.enableSyntaxHighlighting = true;
                programs.kitty = {
                  enable = true;
                  enableNerdFonts = true;
                  settings.font = "FiraCode Nerd Font";
                  settings.font.size = 14;
                };
              })
            ];
          };
        })
      ];
    };

  };
}
