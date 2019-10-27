{ ... }: {
  master = {
    description = "PatchELF trunk jobs";
    type = 1; # Flakes
    flakeref = "github:NixOS/patchelf";
    checkinterval = 7200;
    schedulingshares = 100;
  };
}
