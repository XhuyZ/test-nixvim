{ pkgs, lib, ... }:
{
  imports = [
		./keymaps.nix
    ./treesitter.nix
    ./toggleterm.nix
  ];

  config = {
    globals = {
      mapleader = " ";
    };

    opts = {
      number = true;
      colorcolumn = "80";
      relativenumber = true;
      shiftwidth = 2;
      tabstop = 2;
      wrap = false;
      swapfile = false; # Undotree
      backup = false; # Undotree
      undofile = true;
      hlsearch = false;
      incsearch = true;
      termguicolors = true;
      scrolloff = 8;
      signcolumn = "yes";
      updatetime = 50;
      foldlevelstart = 99;
    };
    extraPackages = with pkgs; [
      # base
      fzf
      ripgrep
      fd
      # Formatters
      stylua # Lua formatter
      csharpier # C# formatter
      nixfmt-rfc-style # Nix formatter
      # Linters
      golangci-lint # Go linter
      shellcheck # Shell script linter
      eslint_d # JavaScript/TypeScript linter
      # Debuggers
      netcoredbg # C# debugger
      asm-lsp # Assembly LSP
      bashdb # Bash debugger
      delve # Go debugger

    ];
  };
}
