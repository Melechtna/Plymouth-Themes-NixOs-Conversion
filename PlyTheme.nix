{ stdenv, fetchFromGitHub }:
  stdenv.mkDerivation rec {
    pname = "plymouth-vinyl-theme";
    version = "1.0";
    dontBuild = true;
        src = fetchFromGitHub {
      owner = "Melechtna";
      repo = "Plymouth-Themes-NixOs-Conversion";
      rev = "v${version}";
      sha256 = "8992f0a19c497e6dc17e6bdb22c7f3e260f342582071ff09f01c88aecdda4e56";
    };
    installPhase = ''
    mkdir -p $out/share/plymouth/themes/
    mv * $out/share/plymouth/themes/
    '';
  }
