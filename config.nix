{
  # Who to notify if a .jobsets jobset fails
  jobsetsMaintainers = [];

  # Default jobset values
  defaultJobset = {
    enabled = 1;
    type = 0;
    nixexprpath = "release.nix";
    hidden = false;
    description = "";
    checkinterval = 86400;
    schedulingshares = 1000;
    enableemail = false;
    emailoverride = "";
    keepnr = 3;
    inputs = {};
  };
}
