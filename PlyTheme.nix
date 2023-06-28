{ stdenv, fetchFromGitHub }:
{
   PlyTheme = stdenv.mkDerivation rec {
    pname = "plymouth-vinyl-theme";
    dontBuild = true;
    installPhase = ''
    mkdir -p ${out}/share/plymouth/themes/
    cp -aR ${src} ${out}/share/plymouth/themes/
    '';
    src = fetchFromGitHub {
      owner = "Melechtna";
      repo = "Plymouth-Themes-NixOs-Conversion";
      branch = "vinyl";
      sha256 = "dunno yet";
    };
  };
}
