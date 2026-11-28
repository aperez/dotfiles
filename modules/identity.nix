# Who I am. Imported by both NixOS (hosts/common.nix) and home-manager (home/).
{ lib, ... }:
let
  str =
    description:
    lib.mkOption {
      type = lib.types.str;
      readOnly = true;
      inherit description;
    };
in
{
  options.my = {
    user = str "Unix username.";
    fullName = str "Full name, used for git etc.";
    email = str "Primary email.";
  };

  config.my = {
    user = "aperez";
    fullName = "Alexandre Perez";
    email = "alexandrecperez@gmail.com";
  };
}
