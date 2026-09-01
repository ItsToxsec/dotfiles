{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = with pkgs; [
    ruby
    bundler
    gcc
    gnumake
    pkg-config
    openssl
    libyaml
    libffi
    zlib
    readline
    git
  ];

  shellHook = ''
    export GEM_HOME="$PWD/.gem"
    export GEM_PATH="$GEM_HOME"
    export PATH="$GEM_HOME/bin:$PATH"

    mkdir -p "$GEM_HOME"

    echo "Ruby development shell"
    ruby --version
    bundle --version
    echo "Gems: $GEM_HOME"
  '';
}
