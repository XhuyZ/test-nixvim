{pkgs, ...}: {
  keymaps = [
    {
      key = "<C-\>";
      mode = "n";
      action = "<cmd>ToggleTerm<CR>";
      options = {
        silent = true;
        noremap = true;
      };
    }
  ];
}

