{ lib, ... }:
{
  options.my.fontSize = lib.mkOption {
    type = lib.types.int;
    description = "Font size, set per host.";
  };
}
