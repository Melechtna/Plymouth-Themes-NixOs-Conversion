{ stdenv, fetchurl }:
  stdenv.mkDerivation rec {
    pname = "plymouth-vinyl-theme";
    version = "1.0";
    src = fetchurl {
    url = "https://raw.githubusercontent.com/Melechtna/Plymouth-Themes-NixOs-Conversion/vinyl/vinyl.tar.gz";
    sha256 = "2df4ae288d5498ee6a9c343f34826d0f5ad8eebf1c1e3ac6f71a7ce454fb76ad";
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
