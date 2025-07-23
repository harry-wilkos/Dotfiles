function update --wraps=eos-update --description 'alias update=eos-update'
    eos-update $argv
    sudo paccache -r
    sudo pacman -Rns $(pacman -Qtdq)
    sudo journalctl --vacuum-time=7d
    sudo pacman -Sc --noconfirm
end
