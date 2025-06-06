{pkgs, ...}:
{
  imports = [
    ./git.nix
    ./nvim
    ./shell.nix
    ./tmux.nix
    ./syncthing.nix
  ];
  time.timeZone = "Asia/Almaty";
  
  environment.systemPackages = with pkgs; [
#    wget
    tree
  ];
}
