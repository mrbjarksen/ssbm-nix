{ stdenvNoCC
, appimageTools
, fetchurl
, makeDesktopItem
, copyDesktopItems
, makeWrapper
}:

stdenvNoCC.mkDerivation rec {
  pname = "slippi-launcher";
  version = "2.11.10";

  src = appimageTools.wrapType2 rec {
    inherit pname version;
    src = fetchurl {
      url = "https://github.com/project-slippi/slippi-launcher/releases/download/v${version}/Slippi-Launcher-${version}-x86_64.AppImage";
      hash = "sha256-OrWd0jVqe6CzNbVRNlm2alt2NZ8uBYeHiASaB74ouW4=";
    };
  };

  desktopItems = [
    (makeDesktopItem {
      name = "slippi-launcher";
      exec = "slippi-launcher-${version}";
      icon = "slippi-launcher";
      desktopName = "Slippi Launcher";
      comment = "The way to play Slippi Online and watch replays";
      type = "Application";
      categories = [ "Game" ];
      keywords = [ "slippi" "melee" "rollback" ];
    })
  ];

  installPhase = ''
    runHook preInstall

    mkdir -p "$out/bin"
    cp -r "$src/bin" "$out"

    runHook postInstall
  '';

  nativeBuildInputs = [ copyDesktopItems ];
}
