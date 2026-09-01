{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = with pkgs; [
    python3
    python3Packages.pip
    python3Packages.virtualenv
    gcc
    pkg-config
    openssl
    libffi
    zlib
    git
  ];

  shellHook = ''
    if [ ! -d ".venv" ]; then
      echo "Creating Python virtual environment..."
      python -m venv .venv
    fi

    source .venv/bin/activate

    echo "Python development shell"
    python --version
    echo "venv: $VIRTUAL_ENV"
  '';
}
