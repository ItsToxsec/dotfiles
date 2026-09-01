{
  description = "Multi-language development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, rust-overlay }:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;

        overlays = [
          rust-overlay.overlays.default
        ];
      };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          # -------------------------
          # Rust
          # -------------------------
          (rust-bin.stable.latest.default.override {
            extensions = [
              "rust-src"
              "rust-analyzer"
            ];
          })

          cargo-edit
          cargo-watch

          # -------------------------
          # JavaScript / TypeScript
          # -------------------------
          nodejs
          nodePackages.npm
          yarn
          pnpm

          # -------------------------
          # Python
          # -------------------------
          python3
          python3Packages.pip
          python3Packages.virtualenv

          # -------------------------
          # Go
          # -------------------------
          go
          gopls
          delve

          # -------------------------
          # C / C++
          # -------------------------
          gcc
          clang
          clang-tools
          cmake
          ninja
          gnumake
          gdb

          # -------------------------
          # Zig
          # -------------------------
          zig

          # -------------------------
          # Ruby / Rails
          # -------------------------
          ruby
          bundler

          # -------------------------
          # Rails / native build deps
          # -------------------------
          pkg-config
          openssl
          libyaml
          libffi
          zlib
          readline
          sqlite
          postgresql

          # -------------------------
          # General development tools
          # -------------------------
          git
          curl
          wget
          jq
        ];

        shellHook = ''
          # ==========================================================
          # Python virtual environment
          # ==========================================================

          if [ ! -d ".venv" ]; then
            echo "Creating Python virtual environment..."
            python -m venv .venv
          fi

          source .venv/bin/activate


          # ==========================================================
          # Ruby project-local gems
          # ==========================================================

          export GEM_HOME="$PWD/.gem"
          export GEM_PATH="$GEM_HOME"
          export PATH="$GEM_HOME/bin:$PATH"

          mkdir -p "$GEM_HOME"


          # ==========================================================
          # Environment information
          # ==========================================================

          echo
          echo "Development shell ready"
          echo "────────────────────────────────────────"
          echo "Rust:       $(rustc --version)"
          echo "Cargo:      $(cargo --version)"
          echo "Node:       $(node --version)"
          echo "npm:        $(npm --version)"
          echo "Python:     $(python --version)"
          echo "Go:         $(go version)"
          echo "GCC:        $(gcc --version | head -n1)"
          echo "Clang:      $(clang --version | head -n1)"
          echo "Zig:        $(zig version)"
          echo "Ruby:       $(ruby --version)"
          echo "Bundler:    $(bundle --version)"
          echo "────────────────────────────────────────"
          echo "Python venv: $VIRTUAL_ENV"
          echo "Ruby gems:   $GEM_HOME"
          echo
        '';
      };
    };
}