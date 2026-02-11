{inputs, config, pkgs, ...}:

{
  boot.initrd.kernelModules = [ "amdgpu" ];

  # xserver
  services.xserver = {
    enable = true;
    videoDrivers = [ "amdgpu" ];
  };

}
