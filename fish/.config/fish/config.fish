if status is-interactive
	zoxide init fish --cmd cd| source
	atuin init fish | source
	starship init fish | source
end
