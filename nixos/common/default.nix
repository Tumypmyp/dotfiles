{pkgs, ...}:
{
  imports = [
    ./git.nix
    ./nvim.nix
    ./shell.nix
    ./tmux.nix
  ];
  time.timeZone = "Asia/Almaty";
  
  environment.SystemPackages = with pkgs; [
#    wget
    tree
  ];
}
