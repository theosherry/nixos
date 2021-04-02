{ lib, pkgs, config, ... }:
with lib;
let cfg = config.mayniklas.docker;
in {

  options.mayniklas.docker = {
    enable = mkEnableOption "activate docker" // { default = true; };
  };

  config = mkIf cfg.enable {

    environment.systemPackages = with pkgs; [ docker-compose ];

    virtualisation.docker = {
      enable = true;
      autoPrune = {
        enable = true;
        dates = "weekly";
      };
    };

    users.extraUsers.${config.mainUser}.extraGroups = [ "docker" ];

  };
}
