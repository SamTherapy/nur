# This file was generated by GoReleaser. DO NOT EDIT.
# vim: set ft=nix ts=2 sw=2 sts=2 et sta
{
system ? builtins.currentSystem
, lib
, fetchurl
, installShellFiles
, stdenvNoCC
}:
let
  shaMap = {
    i686-linux = "1my6rz56j1pr00cbxgd5rdbi502s9c4g1mpwqyfkj7krac3p81x7";
    x86_64-linux = "0z1g58a2i145hnavwjspwkdnrv8n5m5r34yl9dsrzyakyd7ccy9i";
    armv6l-linux = "06z8lq1gcmsz2igf0pgf0jnp14ikvlkkxdzwkgynmhdzi2y3sw6n";
    aarch64-linux = "04qbxgxxn7pfd0miyymap82sn2m0n32b1hzrmcwhyacfgaa2m3jm";
    x86_64-darwin = "1384nfknvd2yk0myzs6ni69q6hy3dsh6wkr2cv05zjsbw2wv3bpg";
    aarch64-darwin = "1384nfknvd2yk0myzs6ni69q6hy3dsh6wkr2cv05zjsbw2wv3bpg";
  };

  urlMap = {
    i686-linux = "https://git.froth.zone/sam/awl/releases/download/v0.6.14/awl_Linux_i386.tar.gz";
    x86_64-linux = "https://git.froth.zone/sam/awl/releases/download/v0.6.14/awl_Linux_amd64.tar.gz";
    armv6l-linux = "https://git.froth.zone/sam/awl/releases/download/v0.6.14/awl_Linux_arm.tar.gz";
    aarch64-linux = "https://git.froth.zone/sam/awl/releases/download/v0.6.14/awl_Linux_arm64.tar.gz";
    x86_64-darwin = "https://git.froth.zone/sam/awl/releases/download/v0.6.14/awl_MacOS_all.tar.gz";
    aarch64-darwin = "https://git.froth.zone/sam/awl/releases/download/v0.6.14/awl_MacOS_all.tar.gz";
  };
in
stdenvNoCC.mkDerivation {
  pname = "awl";
  version = "0.6.14";
  src = fetchurl {
    url = urlMap.${system};
    sha256 = shaMap.${system};
  };

  sourceRoot = ".";

  nativeBuildInputs = [ installShellFiles ];

  installPhase = ''
    mkdir -p $out/bin
    cp -vr ./awl $out/bin/awl
    installManPage ./docs/awl.1.gz
    installShellCompletion ./completions/*
  '';

  system = system;

  meta = {
    description = "A DNS query client";
    homepage = "https://dns.froth.zone/awl";
    license = lib.licenses.bsd3;

    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];

    platforms = [
      "aarch64-darwin"
      "aarch64-linux"
      "armv6l-linux"
      "i686-linux"
      "x86_64-darwin"
      "x86_64-linux"
    ];
  };
}
