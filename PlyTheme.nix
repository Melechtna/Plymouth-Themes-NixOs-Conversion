{ stdenv, fetchurl }:
  stdenv.mkDerivation rec {
    pname = "plymouth-vinyl-theme";
    version = "1.0";
    src = fetchurl {
    url = "https://raw.githubusercontent.com/Melechtna/Plymouth-Themes-NixOs-Conversion/vinyl/vinyl.tar.gz";
    sha256 = "50ca06c520bed5eb7b1913e1fdfe588671645bee754ac011de1688ea5776243a";
  };

    dontConfigure = true;
    dontBuild = true;

    installPhase = ''
      runHook preInstall

      mkdir -p $out/share/plymouth/themes/
      tar -xzvf $src -C $out/share/plymouth/themes/
      substituteInPlace $out/share/plymouth/themes/vinyl/*.plymouth --replace '@IMAGES@' "$out/share/plymouth/themes/vinyl/images"

      runHook postInstall
    '';
  }
