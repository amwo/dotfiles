{ pkgs }:
{
  hello = pkgs.writeShellScriptBin "hello" ''
    echo Hello from custom package
  '';
}
