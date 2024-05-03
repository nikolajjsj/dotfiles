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
      ];
    };

  };
}
