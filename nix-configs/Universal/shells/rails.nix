{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = with pkgs; [
    ruby
    bundler
    nodejs
    pnpm
    gcc
    gnumake
    pkg-config
    openssl
    libyaml
    libffi
    zlib
    readline
    sqlite
    postgresql
    git
  ];

  shellHook = ''
    export GEM_HOME="$PWD/.gem"
    export GEM_PATH="$GEM_HOME"
    export PATH="$GEM_HOME/bin:$PATH"

    mkdir -p "$GEM_HOME"

    echo "Ruby on Rails development shell"
    ruby --version
    bundle --version
    echo "Install Rails with:"
    echo "  gem install rails"
  '';
}
