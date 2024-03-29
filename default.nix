{ project, ... }: let

  # Helper functions
  hydraLib = rec { # Weird name to prevent confusion with nixpkgs lib
    mkInput = { type, value, emailresponsible ? false }: { inherit type value emailresponsible; };
    mkNixosChannel = version: mkInput { type = "git"; value = "https://github.com/nixos/nixpkgs-channels.git nixos-${version}"; };
  };

  # Prepare jobsets
  cfg = import ./config.nix;
  jobsets = import (./projects + "/${project}.nix") { inherit hydraLib; };

in {
  jobsets = derivation {
    name = "${project}-spec.json";
    system = builtins.currentSystem;

    builder = "/bin/sh";
    args = [
      (builtins.toFile "spec-builder.sh" ''
        echo '${builtins.toJSON (builtins.mapAttrs (_: v: cfg.defaultJobset // v) jobsets)}' > "$out"
      '')
    ];
  } // {
    meta.maintainers = cfg.jobsetsMaintainers;
  };
}
