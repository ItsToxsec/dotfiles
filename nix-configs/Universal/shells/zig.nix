{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = with pkgs; [
    zig
    gdb
    lldb
    git
  ];

  shellHook = ''
    echo "Zig development shell"
    zig version
  '';
}
