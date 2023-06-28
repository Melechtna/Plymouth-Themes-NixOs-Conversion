{ stdenv, fetchFromGitHub }:
{
   PlyTheme = stdenv.mkDerivation rec {
    pname = "plymouth-vinyl-theme";
    version = "1.0"
    dontBuild = true;
    installPhase = ''
    mkdir -p ${out}/share/plymouth/themes/
    cp -aR ${src} ${out}/share/plymouth/themes/
    '';
    src = fetchFromGitHub {
      owner = "Melechtna";
      repo = "Plymouth-Themes-NixOs-Conversion/tree/vinyl";
      rev = "v${version}";
      sha256 = "dunno yet";
    };
  };
}
