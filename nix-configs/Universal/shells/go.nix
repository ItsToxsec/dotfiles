{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = with pkgs; [
    go
    gopls
    delve
    git
    gnumake
  ];

  shellHook = ''
    echo "Go development shell"
    go version
  '';
}
