let
  # Normally you could just use the latest (tested) version of nixpkgs via:
  # pkgs = import (builtins.fetchTarball channel:nixos-unstable) {};

  # but since CFI wasn't working (https://github.com/NixOS/nixpkgs/pull/85925)
  # we have to pull the PR'ed version for now:
  pkgs = import (builtins.fetchTarball {
    url = "https://github.com/andir/nixpkgs/archive/d17650b654aa649ee5161b629d70b62c265b1825.tar.gz";
    sha256 = "1jqqs8kp5wys53mwg1pn617nsdqp0qflbra26jh07sz4mfh26v2d";
  }) {};

in pkgs.mkShell {
  buildInputs = with pkgs; [
    clang_10
    gnumake
  ];
}
