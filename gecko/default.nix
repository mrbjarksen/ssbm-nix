{ stdenv, fetchFromGitHub, buildGoModule }:

buildGoModule rec {
  pname = "gecko";
  version = "5.0.0";

  src = fetchFromGitHub {
    owner = "JLaferri";
    repo = "gecko";
    rev = "v${version}";
    sha256 = "0jdz3gprafyhkfzxvnp16ss9yahsxvcm58r11c3kiyc0cf9xhyzj";
  };

  vendorHash = null;
}
