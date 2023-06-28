{ stdenv, fetchTarBall }:
{
   PlyTheme = stdenv.mkDerivation rec {
    pname = "sddm-vinyl-theme";
    version = "1.0";
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
  src = fetchTarball {
    url = "https://ocs-dl.fra1.cdn.digitaloceanspaces.com/data/files/1460735537/147344-vinyl.tar.bz?response-content-disposition=attachment%3B%2520147344-vinyl.tar.bz&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=RWJAQUNCHT7V2NCLZ2AL%2F20230628%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20230628T122425Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Signature=8b04209333a792cec5466ca8c6917266ca989a5600d9dc4f71c3c2310676181d";
    sha256 = "3f19134003b2cc7f36967f5a0601fa3efb659320c99c86d6566e6c60ab3c7262";
    };
  };
}
