# dotfiles (NixOS)

NixOS + home-manager, no flakes. Sources are pinned with [npins](https://github.com/andir/npins).

```
default.nix          entry point: one attribute per host
npins/               pinned nixpkgs (nixos-unstable), home-manager, nixos-hardware
hosts/common.nix     system config shared by all hosts
hosts/<host>/        default.nix (system), home.nix (user), hardware.nix
home/                home-manager config shared by all hosts
```

## Usage

```
sudo nixos-rebuild switch --file . --attr $(hostname)   # fish abbreviation: rebuild
npins update                                            # bump pins, then commit sources.json
```

## Per-project environments

Put a `shell.nix` and an `.envrc` containing `use nix` in the project; direnv
loads it on `cd`. `<nixpkgs>` resolves to the system's pinned nixpkgs.
