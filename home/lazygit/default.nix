{ ... }:
{
  programs.lazygit = {
    enable = true;
    settings = {
      promptToReturnFromSubprocess = false;
      git = {
        diffRenderers = [
          { command = "delta --paging=never"; }
        ];
      };
    };
  };
}
