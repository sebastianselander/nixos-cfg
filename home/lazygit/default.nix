{ ... }:
{
  programs.lazygit = {
    enable = true;
    settings = {
      git = {
        paging = {
          colorArg = "never";
          pager = "delta --paging=never";
        };
      };
    };
  };
}
