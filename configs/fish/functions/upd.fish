function upd --wraps='yay && flatpak update' --description 'alias upd=yay && flatpak update'
    yay && flatpak update $argv
end
