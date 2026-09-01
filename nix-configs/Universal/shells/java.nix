{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = with pkgs; [
    jdk21
    maven
    gradle
    jdt-language-server
    git
    gnumake
  ];

  shellHook = ''
    export JAVA_HOME="${pkgs.jdk21}"

    echo "Java development shell"
    java --version | head -n1
    javac --version
    mvn --version | head -n1
    gradle --version | grep Gradle | head -n1
    echo "JAVA_HOME: $JAVA_HOME"
  '';
}
