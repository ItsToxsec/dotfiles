{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = with pkgs; [
    nodejs
    pnpm
    yarn
    typescript
    typescript-language-server
    git
  ];

  shellHook = ''
    echo "TypeScript development shell"
    node --version
    tsc --version
  '';
}
