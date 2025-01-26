{ inputs, pkgs, unstablePkgs, ... }:
let
  inherit (inputs) nixpkgs nixpkgs-unstable;
in
{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    nixpkgs-unstable.legacyPackages.${pkgs.system}.beszel

    ## stable
    btop
    coreutils
    fd
    ffmpeg
    fira-code
    fira-code-nerdfont
    fira-mono
    git-crypt
    go
    iperf3
    jetbrains-mono # font
    just
    nerdfonts
    nmap
    qemu
    ripgrep
    tree
    unzip
    watch
    wget
    wireguard-tools
    zoxide

    # requires nixpkgs.config.allowUnfree = true;
    # vscode-extensions.ms-vscode-remote.remote-ssh
  ];
}
