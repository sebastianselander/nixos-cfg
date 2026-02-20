{ ... }:
{
  programs.lazygit = {
    enable = true;
    settings = {
      promptToReturnFromSubprocess = false;
      git = {
        paging = [
          { colorArg = "never"; }
          { pager = "delta --paging=never"; }
        ];
      };
    };
  };
}
