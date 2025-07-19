{
  stdenv,
  pkg,
  installShellFiles,
  autoPatchelfHook,
  libcxx,
  libgcc,
  fusePackages,
  ...
}:
stdenv.mkDerivation {
  name = "megacmd";
  src = pkg;

  nativeBuildInputs = [
    installShellFiles
    autoPatchelfHook
    libcxx
    libgcc
    fusePackages.fuse_2
  ];

  installPhase = ''
    mkdir $out
    cp -ar $src/usr/bin $out/bin
    cp -ar $src/opt/megacmd/lib $out/lib
    installShellCompletion --bash --name megacmd.bash etc/bash_completion.d/megacmd_completion.sh
  '';
}
