{ lib, pkgs, config, ... }:
with lib;
let
  cfg = config.mayniklas.programs.rofi;
  vars = import ../vars.nix;
in {
  options.mayniklas.programs.rofi.enable = mkEnableOption "enable rofi";

  config = mkIf cfg.enable {
    programs.rofi = {

      # General
      enable = true;
      cycle = true;
      # extraConfig = "";

      # Geometry
      fullscreen = true;
      borderWidth = 0;
      lines = 3;
      padding = 400;
      rowHeight = 2;

      colors = {

        window = {
          background = "#${vars.colors.base00}";
          # foreground = "#${vars.colors.base00}";
          separator = "#${vars.colors.base0D}";
          border = "#${vars.colors.base00}";
        };

        rows = {
          normal = {
            background = "#${vars.colors.base00}";
            foreground = "#${vars.colors.base05}";
            backgroundAlt = "#${vars.colors.base00}";
            highlight = {
              background = "#${vars.colors.base02}";
              foreground = "#${vars.colors.base07}";
            };
          };
          active = {
            background = "#${vars.colors.base00}";
            foreground = "#${vars.colors.base0D}";
            backgroundAlt = "#${vars.colors.base00}";
            highlight = {
              background = "#${vars.colors.base00}";
              foreground = "#${vars.colors.base0D}";
            };
          };
          urgent = {
            background = "#${vars.colors.base00}";
            foreground = "#${vars.colors.base08}";
            backgroundAlt = "#${vars.colors.base00}";
            highlight = {
              background = "#${vars.colors.base00}";
              foreground = "#${vars.colors.base08}";
            };
          };
        };
      };
    };
  };
}
