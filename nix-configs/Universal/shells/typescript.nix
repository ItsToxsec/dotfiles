{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = with pkgs; [
    nodejs
    pnpm
    yarn
    nodePackages.typescript
    nodePackages.typescript-language-server
    git
  ];

  shellHook = ''
    echo "TypeScript development shell"
    node --version
    tsc --version
  '';
}
