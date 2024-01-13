{ pkgs ? import <nixpkgs> { system = builtins.currentSystem; }
, lib ? pkgs.lib
}:

pkgs.stdenv.mkDerivation {
  name = "nix-rtl-test";
  src = ./.;

  postInstall = ''
    mkdir -p $out/etc/udev/rules.d
    cp dist/nix/99-rtl-sdr.rules $out/etc/udev/rules.d/10-rtl-sdr.rules
  '';
}
