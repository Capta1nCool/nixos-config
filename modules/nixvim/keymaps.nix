[
  {
    action = "<cmd>Neotree toggle<CR>";
    key = "<C-e>";
    options = { silent = true; };
  }
  {
    action = ":Ex<CR>";
    key = "<leader>pv";
    options = { };
  }
  {
    action = "<C-w><C-h>";
    key = "<C-h>";
    options = { desc = "Move focus to the left window"; };
  }
  {
    action = "<C-w><C-l>";
    key = "<C-l>";
    options = { desc = "Move focus to the right window"; };
  }
  {
    action = "<C-w><C-j>";
    key = "<C-j>";
    options = { desc = "Move focus to the lower window"; };
  }
  {
    action = "<C-w><C-k>";
    key = "<C-k>";
    options = { desc = "Move focus to the upper window"; };
  }
  {
    action = ":qa!<CR>";
    key = "<leader>qq";
    options = { };
  }
  {
    action = ":m '>+1<CR>gv=gv";
    key = "J";
    mode = [ "v" ];
    options = { };
  }
  {
    action = ":m '<-2<CR>gv=gv";
    key = "K";
    mode = [ "v" ];
    options = { };
  }
  {
    action = "mzJ`z";
    key = "J";
    mode = [ "n" ];
    options = { };
  }
  {
    action = "<C-d>zz";
    key = "<C-d>";
    mode = [ "n" ];
    options = { };
  }
  {
    action = "<C-u>zz";
    key = "<C-u>";
    mode = [ "n" ];
    options = { };
  }
  {
    action = "nzzzv";
    key = "n";
    mode = [ "n" ];
    options = { };
  }
  {
    action = "Nzzzv";
    key = "N";
    mode = [ "n" ];
    options = { };
  }
]
