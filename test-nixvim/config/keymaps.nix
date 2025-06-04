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
  ];
}

