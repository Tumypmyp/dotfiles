let
  moon = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHZVKaa6j9gij1Y+K8IwyZWYa0ipUIJZj5cHKGufzFjm";
  heart = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGOfYoJjDMAbjcTvmJAt0r4yYpN7gIpSW0pF2yFQE1B8";
in
{
  "secrets.age".publicKeys = [ moon heart ];
  "photoprism.age".publicKeys = [ moon ];
}
