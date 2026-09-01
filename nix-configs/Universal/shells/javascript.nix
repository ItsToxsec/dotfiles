{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = with pkgs; [
    nodejs
    pnpm
    yarn
    git
  ];

  shellHook = ''
    echo "JavaScript development shell"
    node --version
    npm --version
    pnpm --version
  '';
}
