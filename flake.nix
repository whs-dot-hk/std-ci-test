{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    std.url = "github:divnix/std";

    std.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    std,
    ...
  } @ inputs:
    std.growOn {
      inherit inputs;

      cellsFrom = std.incl ./cells ["cell1"];
      cellBlocks = with std.blockTypes; [
        (installables "packages" {ci.build = true;})
      ];
    }
    {
      packages = std.harvest self ["cell1" "packages"];
    }
    (std.grow {
      inherit inputs;

      cellsFrom = std.incl ./cells ["cell2"];
      cellBlocks = with std.blockTypes; [
        (installables "packages" {ci.build = true;})
      ];
    })
    {
      packages = std.harvest self ["cell2" "packages"];
    };
}
