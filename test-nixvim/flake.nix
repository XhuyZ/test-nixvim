{
  description = "xhuyz nixvim configuration";
  
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim/nixos-25.05";
  };

  outputs = { nixpkgs, nixpkgs-unstable, nixvim, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      pkgs-unstable = import nixpkgs-unstable { inherit system; };
      config = import ./config;
      
      nvim = nixvim.legacyPackages.${system}.makeNixvimWithModule {
        inherit pkgs;
        module = config;
      };
    in
    {
      packages.${system}.default = nvim;
      
      checks.${system}.default = nixvim.lib.${system}.check.mkTestDerivationFromNvim {
        inherit nvim;
        name = "A nixvim configuration";
      };
      
      devShells.${system}.default = pkgs.mkShellNoCC {
        shellHook = ''
          echo Welcome to a Neovim dev environment powered by Nixvim
          PS1="Nixvim: \\w \$ "
          alias vim='nvim'
        '';
        packages = [
          nvim
          pkgs.dotnet-sdk
          pkgs.dotnet-aspnetcore
          pkgs.nodePackages_latest.nodejs
        ];
      };
    };
}