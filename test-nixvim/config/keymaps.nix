{pkgs, ...}: {
  keymaps = [
    {
      key = "<C-t>";
      mode = ["n" "t"];
      action = "<cmd>ToggleTerm<CR>";
      options = {
        silent = true;
        noremap = true;
      };
    }
    {
      key = "<leader>gg";
      mode = ["n"];
      action = "<cmd>LazyGit<CR>";
      options = {
        silent = true;
        noremap = true;
      };
    }
  ];
}

