{ stdenv, fetchurl }:
  stdenv.mkDerivation rec {
    pname = "plymouth-vinyl-theme";
    version = "1.0";
    dontBuild = true;
    src = fetchurl {
    url = "https://raw.githubusercontent.com/Melechtna/Plymouth-Themes-NixOs-Conversion/vinyl/vinyl.tar.gz";
     sha256 = "abc90b1b26ae315df22e37b89ab04c1733df6c90bac1ca0bc612ab312636d6dc";
  };
    installPhase = ''
    sed -i 's:\(^ImageDir=\)/usr:\1'"$out"':' vinyl.plymouth
    mkdir -p $out/share/plymouth/themes/vinyl
    mv * $out/share/plymouth/themes/vinyl
    '';
  }
