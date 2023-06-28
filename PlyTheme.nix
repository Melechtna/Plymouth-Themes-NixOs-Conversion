{ stdenv, fetchurl }:
  stdenv.mkDerivation rec {
    pname = "plymouth-vinyl-theme";
    version = "1.0";
    src = fetchurl {
    url = "https://raw.githubusercontent.com/Melechtna/Plymouth-Themes-NixOs-Conversion/vinyl/vinyl.tar.gz";
    sha256 = "865da99638fbadf1e91b318ac856f6809c3f7e2095b9718711b59b9f2786bb1e";
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
