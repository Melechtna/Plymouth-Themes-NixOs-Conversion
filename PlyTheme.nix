{ stdenv, fetchurl }:
  stdenv.mkDerivation rec {
    pname = "plymouth-vinyl-theme";
    version = "1.0";
    src = fetchurl {
    url = "https://raw.githubusercontent.com/Melechtna/Plymouth-Themes-NixOs-Conversion/vinyl/vinyl.tar.gz";
    sha256 = "f4d82c21e7b7461c2011361b3d3ad89b0ae75bc70f152a262910c66ec8524278";
  };

    dontConfigure = true;
    dontBuild = true;

    installPhase = ''
      runHook preInstall

      mkdir -p $out/share/plymouth/themes/
      tar -xvf $src -C $out/share/plymouth/themes/
      substituteInPlace $out/share/plymouth/themes/vinyl/*.plymouth --replace '@ROOT@' "$out/share/plymouth/themes/vinyl/"

      runHook postInstall
    '';
  }
