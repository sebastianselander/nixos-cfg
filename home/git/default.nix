{ ... }:
{
  programs.git = {
    enable = true;
    userName = "Sebastian Selander";
    userEmail = "sebastian.selander@gmail.com";
    delta.enable = true;
    extraConfig = {
      branch.sort = "-committerdate";
      commit.verbose = true;
      gpg.format = "ssh";
      user.signingKey = "/home/sebastian/.ssh/id_ed25519.pub";
      commit.gpgSign = true;
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
