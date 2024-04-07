
#kills Hyprland and returns to login shell
alias logout='loginctl terminate-user $USER'

#one of the two most common commands
alias cfg="sudo vim /etc/nixos/configuration.nix"

#rebuild and switch
alias bld="sudo nixos-rebuild switch"

alias hypr="vim .config/hypr/hyprland.conf"

alias way="vim .config/waybar/config"

alias waycss="mv .config/waybar/style.css .config/waybar/backup.style.css vim style.css"

alias config=' /run/current-system/sw/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias l='ls -a'

alias obs='flatpak run com.obsproject.Studio'

alias mousepad='flatpak run org.xfce.mousepad'

alias swaycfg='vim .config/sway/config'

alias fucking='sudo'

