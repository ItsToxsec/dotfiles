{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = with pkgs; [
    gcc
    clang
    clang-tools
    cmake
    ninja
    gnumake
    gdb
    lldb
    pkg-config
    git
  ];

  shellHook = ''
    echo "C/C++ development shell"
    gcc --version | head -n1
    clang --version | head -n1
  '';
}
