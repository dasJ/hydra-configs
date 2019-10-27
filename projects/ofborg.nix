{ hydraLib, ... }: let
  default = {
    nixexprinput = "ofborg";
    checkinterval = 3600;
    schedulingshares = 1000000;
  };
in {
  release = default // {
    inputs = {
      nixpkgs = hydraLib.mkNixosChannel "unstable";
      ofborg = hydraLib.mkInput { type = "git"; value = "https://github.com/grahamc/ofborg.git released"; };
    };
  };

  next = default // {
    inputs = {
      nixpkgs = hydraLib.mkNixosChannel "unstable";
      ofborg = hydraLib.mkInput { type = "git"; value = "https://github.com/grahamc/ofborg.git next"; };
    };
  };
}
