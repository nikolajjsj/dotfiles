{ config, inputs, pkgs, name, ... }:
{
  imports = [
      ./hardware-configuration.nix
      ./../../common/nixos-common.nix
      ./../../common/common-packages.nix
    ];

  ## DEPLOYMENT
  deployment = {
    targetHost = name;
    targetUser = "root";
    buildOnTarget = true;
    allowLocalDeployment = true;
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelModules = [ "drivetemp" ];
  boot.kernel.sysctl."net.ipv4.ip_forward" = 1;
  boot.kernelParams = ["i915.fastboot=1"];

  boot.supportedFilesystems = [ "zfs" ];
  boot.zfs.extraPools = [ "fast" "rust" ];
  services.zfs.autoScrub.enable = true;

  time.timeZone = "Europe/Copenhagen";

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  #home-manager.backupFileExtension = "bak";
  home-manager.users.nikolaj = { imports = [ ./../../../home/nikolaj.nix ]; };
  users.users.nikolaj = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" ];
    packages = with pkgs; [
      home-manager
    ];
  };

  services.zfs = {
    autoSnapshot.enable = true;
    autoScrub.enable = true;
    trim.enable = true;
  };

  environment.systemPackages = with pkgs; [
    git
    figurine
    hddtemp
    htop
    intel-gpu-tools
    iotop
    powertop
    python3
    tmux
    wget
  ];

  networking = {
    firewall.enable = false;
    hostName = "morpheus";
    interfaces = {
      enp2s0 = {
        useDHCP = false;
        ipv4.addresses = [ {
          address = "192.168.20.100";
          prefixLength = 21;
        } ];
      };
    };
    defaultGateway = "192.168.20.0";
    nameservers = [ "192.168.20.1" ];
    # localCommands = ''
    # ip rule add to 10.42.0.0/21 priority 2500 lookup main
    # '';
  };

  virtualisation = {
    docker = {
      enable = true;
      autoPrune = {
        enable = true;
        dates = "weekly";
      };
    };
  };

  services.fstrim.enable = true;
  services.openssh.enable = true;
  services.tailscale.enable = true;

  services.samba-wsdd.enable = true; # make shares visible for windows 10 clients
  services.samba = {
    enable = true;
    securityType = "user";
    settings = {
      global = {
        "workgroup" = "WORKGROUP";
        "server string" = "morpheus";
        "netbios name" = "morpheus";
        "security" = "user";
        "guest ok" = "yes";
        "guest account" = "nobody";
        "map to guest" = "bad user";
        "load printers" = "no";
      };
    };
  };

  nix = {
    settings = {
        experimental-features = [ "nix-command" "flakes" ];
        warn-dirty = false;
    };
  };
}
