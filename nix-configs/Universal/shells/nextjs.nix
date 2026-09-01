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
    echo "Next.js development shell"
    echo "Create a project with:"
    echo "  pnpm create next-app@latest --typescript"
  '';
}
