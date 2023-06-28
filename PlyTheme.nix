{ stdenv, fetchFromGitHubl }:
{
   PlyTheme = stdenv.mkDerivation rec {
    pname = "plymouth-vinyl-theme";
    dontBuild = true;
    installPhase = ''
    mkdir -p ${out}/share/plymouth/themes/
    cp -aR ${src} ${out}/share/plymouth/themes/
    echo "[Plymouth Theme]
    Name=Vinyl
    Description=My Little Pony bootsplash Vinyl Scratch DJ Pon3 version
    ModuleName=script


    [script]
    ImageDir=/run/current-system/sw/share/plymouth/themes/vinyl
    ScriptFile=/run/current-system/sw/share/plymouth/themes/vinyl/vinyl.script" > ${out}share/plymouth/themes/vinyl/vinyl.script
    "
    '';
    src = fetchFromGitHub {
      owner = "Melechtna";
      repo = "Plymouth-Themes-NixOs-Conversion";
      branch = "vinyl";
      sha256 = "dunno yet";
    };
  };
}
