{ config, pkgs, ... }:

{
  imports = [ ];

  home.stateVersion = "25.05";
  home.username = "v";
  home.homeDirectory = "/home/v";
  programs.home-manager.enable = true;
}
