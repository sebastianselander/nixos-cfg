{ ... }:
{
  programs.git = {
    enable = true;
    userName = "sebastianselander";
    userEmail = "sebastian.selander@gmail.com";
    difftastic.enable = true;
    extraConfig = {
      branch.sort = "-committerdate";
      commit.verbose = true;
      diff.algorithm = "histogram";
      merge.conflictstyle = "zdiff3";
      pull.rebase = true;
      push.autoSetupRemote = true;
      rebase.autosquash = true;
      url."git@github.com:" = {
        insteadOf = "https://github.com/";
      };
    };
  };
}
