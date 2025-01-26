{ config, lib, pkgs, modulesPath, ... }:

{
  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "mpt3sas" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];
  powerManagement.cpuFreqGovernor = "powersave";

  # fileSystems."/" =
  #   { device = "rpool/root";
  #     fsType = "zfs";
  #   };
  #
  # fileSystems."/home" =
  #   { device = "rpool/home";
  #     fsType = "zfs";
  #   };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/2AD5-541F";
      fsType = "vfat";
    };

  swapDevices = [];

## zfs disks
############
## fast - mirrow
# nvme-Samsung_SSD_980_PRO_1TB_S5GXNU0WC27180T
# nvme-WD_BLACK_SN850X_1000GB_24127V4A2P01
#
## rust - data pool
# mirror0 - ata-ST12000NM001G-2MV103_WL20ND10
# mirror0 - ata-ST12000NM001G-2MV103_ZL24PT7Z
# mirror0 - ata-ST12000NM0558_ZHZ1SH9J
#
## boot device
# ata-KINGSTON_SA400S37480G_50026B7283146D60
#

# media storage disks etc
  fileSystems."/mnt/jbod" =
    { device = "/mnt/disks/disk*";
      fsType = "mergerfs";
      options = ["defaults" "minfreespace=250G" "fsname=mergerfs-jbod"];
    };

  fileSystems."/mnt/disks/disk1" =
    { device = "/dev/disk/by-id/ata-ST12000NM001G-2MV103_WL20ND10-part1";
      fsType = "ext4";
    };

  fileSystems."/mnt/disks/disk2" =
    { device = "/dev/disk/by-id/ata-ST12000NM001G-2MV103_ZL24PT7Z-part";
      fsType = "xfs";
    };

  fileSystems."/mnt/disks/disk3" =
    { device = "/dev/disk/by-id/ata-ST12000NM0558_ZHZ1SH9J-part1";
      fsType = "xfs";
    };

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  networking.hostId = "7f8ded12";
  # networking.interfaces.eno1.useDHCP = lib.mkDefault true;
  # networking.interfaces.eno2.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
