{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = with pkgs; [
    rustc
    cargo
    rust-analyzer
    cargo-edit
    cargo-watch
    pkg-config
    openssl
    git
    gdb
  ];

  shellHook = ''
    echo "Rust development shell"
    rustc --version
    cargo --version
  '';
}
