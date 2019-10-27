{ hydraLib, ... }: let
in {
  node-hydra-connector-master = {
    description = "Node Hydra connector master";
    nixexprinput = "node_hydra_connector";
    checkinterval = 300;
    schedulingshares = 1;
    inputs = {
      nixpkgs = hydraLib.mkNixosChannel "18.03";
      node_hydra_connector = hydraLib.mkInput { type = "git"; value = "https://github.com/svanderburg/node-hydra-connector.git"; };
      officialRelease = hydraLib.mkInput { type = "boolean"; value = "true"; };
    };
  };
}
