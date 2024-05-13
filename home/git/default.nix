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
      diff.algorithm = "histogram";
      merge.conflictstyle = "zdiff3";
      pull.rebase = false;
      push.autoSetupRemote = true;
      rebase.autosquash = true;
      url."git@github.com:" = {
        insteadOf = "https://github.com/";
      };
    };
  };
}
