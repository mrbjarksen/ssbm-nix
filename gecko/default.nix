{ stdenv, fetchFromGitHub, buildGoPackage }:

buildGoPackage rec {
  pname = "gecko";
  version = "5.0.0";

  src = fetchFromGitHub {
    owner = "JLaferri";
    repo = "gecko";
    rev = "v${version}";
    sha256 = "1jqxcimpl58czvxi52jndrnzhhqmg0i4v5dp6amibg2wxwyy12w3";
  };

  goPackagePath = "gecko";
}
