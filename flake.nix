{
  description = "My NixOS configuration flake";

  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mandelbrust = {
      url = "github:EthanJ-Brady/mandelbrust";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-gaming.url = "github:fufexan/nix-gaming";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    raise.url = "github:knarkzel/raise";
    quill.url = "github:EthanJ-Brady/quill";
    sourceweaver.url = "github:EthanJ-Brady/SourceWeaver";
    stylix.url = "github:danth/stylix";
  };

  outputs = {
    nixpkgs,
    nix-darwin,
    home-manager,
    ...
  } @ inputs: let
    systems = ["x86_64-linux" "aarch64-darwin"];
    forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f system);
  in {
    nixosConfigurations = {
      "bernoulli" = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/bernoulli/configuration.nix
          ./hosts/bernoulli/hardware-configuration.nix
          ./modules/nixos
          inputs.nixos-hardware.nixosModules.asus-zephyrus-ga502
          inputs.stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {
              inherit inputs;
            };
            home-manager.users.ethan = {
              imports = [
                ./hosts/bernoulli/home.nix
                ./modules/home
              ];
            };
          }
        ];
      };

      "morse" = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/morse/configuration.nix
          ./hosts/morse/hardware-configuration.nix
          ./modules/nixos
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {
              inherit inputs;
            };
            home-manager.users.ethan = {
              imports = [
                ./hosts/morse/home.nix
                ./modules/home
              ];
            };
          }
        ];
      };

      "mohs" = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/mohs/configuration.nix
          ./hosts/mohs/hardware-configuration.nix
          ./modules/nixos
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {
              inherit inputs;
            };
            home-manager.users.ethan = {
              imports = [
                ./hosts/mohs/home.nix
                ./modules/home
              ];
            };
          }
        ];
      };
    };

    darwinConfigurations."newton" = nix-darwin.lib.darwinSystem {
      modules = [
        ./hosts/newton/configuration.nix
        ./modules/darwin
        home-manager.darwinModules.home-manager
        inputs.stylix.darwinModules.stylix
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = {
            inherit inputs;
          };
          home-manager.users.ethanbrady = {
            imports = [
              ./hosts/newton/home.nix
              ./modules/home
            ];
          };
        }
      ];
    };

    homeConfigurations = {
      newton = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {system = "aarch64-darwin";};
        extraSpecialArgs = {inherit inputs;};
        modules = [
          ./hosts/newton/home.nix
          ./modules/home
        ];
      };
    };

    devShells = forAllSystems (
      system: let
        pkgs = import nixpkgs {inherit system;};
      in {
        js = import ./shells/js.nix {inherit pkgs;};
        lua = import ./shells/lua.nix {inherit pkgs;};
        python = import ./shells/python.nix {inherit pkgs;};
        rust = import ./shells/rust.nix {inherit pkgs;};
      }
    );
  };
}
