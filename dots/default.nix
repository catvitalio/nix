{ config, pkgs, ... }:

{
  imports = [ ];

  home.username = "v";
  home.homeDirectory = "/home/v";
  programs.home-manager.enable = true;
}
