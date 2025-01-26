{
  description = "Infrastructure as code for my personal devices";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-darwin.url = "github:NixOS/nixpkgs/nixpkgs-24.11-darwin";

    # nix-darwin.url = "github:lnl7/nix-darwin/nix-darwin-24.11";
    # nix-darwin.inputs.nixpkgs.follows = "nixpkgs-darwin";
    # nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    # homebrew-core = { url = "github:homebrew/homebrew-core"; flake = false; };
    # homebrew-cask = { url = "github:homebrew/homebrew-cask"; flake = false; };
    # homebrew-bundle = { url = "github:homebrew/homebrew-bundle"; flake = false; };

    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # sops-nix.url = "github:Mic92/sops-nix";
    # sops-nix.inputs.nixpkgs.follows = "nixpkgs";

    # disko.url = "github:nix-community/disko";
    # disko.inputs.nixpkgs.follows = "nixpkgs";

    # vscode-server.url = "github:nix-community/nixos-vscode-server";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
    } @ inputs: let
      inherit (self) outputs;
    in {
      # NixOS configuration entrypoint
      # Available through 'nixos-rebuild --flake .#your-hostname'
      nixosConfigurations = {
        # FIXME replace with your hostname
        morpheus = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs outputs;};
          # > Our main nixos configuration file <
          modules = [./nixos/configuration.nix];
        };
      };

      # darwinConfigurations = {
      #   darwin = libx.mkDarwin { hostname = "darwin"; };
      # };

      # Standalone home-manager configuration entrypoint
      # Available through 'home-manager --flake .#your-username@your-hostname'
      homeConfigurations = {
        # FIXME replace with your username@hostname
        "your-username@your-hostname" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = {inherit inputs outputs;};
          # > Our main home-manager configuration file <
          modules = [./home-manager/home.nix];
        };
      };
    };
}
