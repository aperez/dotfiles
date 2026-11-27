# Entry point. Build a host with:
#   sudo nixos-rebuild switch --file . --attr <hostname>
let
  sources = import ./npins;

  nixos =
    host:
    import "${sources.nixpkgs}/nixos" {
      configuration = ./hosts/${host};
    };
in
{
  beastmode = nixos "beastmode";
  logris = nixos "logris";
}
