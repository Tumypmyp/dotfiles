{pkgs, ...}:
{
  imports = [
    ./git.nix
    ./nvim
    ./shell.nix
    ./tmux.nix
  ];
  time.timeZone = "Asia/Almaty";
  
  environment.systemPackages = with pkgs; [
#    wget
    tree
  ];
}
