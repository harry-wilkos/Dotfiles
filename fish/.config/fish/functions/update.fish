function update --wraps=eos-update --description 'alias update=eos-update'
    eos-update $argv
    flatpak uninstall --unused -y
    hyprpm update --force
    sudo paccache -r
    sudo pacman -Rns $(pacman -Qtdq)
    sudo journalctl --vacuum-time=7d
    sudo pacman -Sc --noconfirm
    sudo find ~/.local/share/Trash/files/ -type f -mtime +7 -delete
    sudo find ~/.local/share/Trash/files/ -type d -empty -delete
    sudo find ~/.local/share/Trash/info/ -type f -mtime +7 -delete
end
