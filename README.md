# Plymouth Themes NixOs Conversion
 NixOS converted Plymouth Themes

I'll do my best to contact the theme owners first, and of course any that wishes to have theirs removed, altered, etc, can easily request to do so.

As most themes with NixOS have to be added in a more manual way, some of the themes that myself and friends would like need to be done up will be added here for simplicity, thusly I'm converting them over.

# Installation:

First, download the PlyTheme.nix for whichever theme you'd like, each can be found in the branches, then copy or move it to /etc/nixos/

Second, you'll need to add these lines to your configuration.nix

  boot.plymouth.enable = true;
  boot.plymouth.themePackages = [ pkgs.plytheme ];
  boot.plymouth.theme = "vinyl";

  nixpkgs.config.packageOverrides = pkgs: rec {
    plytheme = pkgs.callPackage ./PlyTheme.nix {};
  };

  environment.systemPackages = with pkgs; [
  plytheme
  ];


Keeping in mind that some of these may already exist.
