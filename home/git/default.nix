{ ... }:
{
  programs.git = {
    enable = true;
    userName = "sebastianselander";
    userEmail = "sebastian.selander@gmail.com";
    delta.enable = true;
    extraConfig = {
      branch.sort = "-committerdate";
      commit.verbose = true;
      diff = {
        algorithm = "histogram";
        colorMoved = "plain";
        mnemonicPrefix = true;
        renames = true;
      };
      merge.conflictstyle = "zdiff3";
      pull.rebase = true;
      push.autoSetupRemote = true;
      rebase = {
        autoSquash = true;
        autoStash = true;
      };
      url."git@github.com:" = {
        insteadOf = "https://github.com/";
      };
    };
  };
}
