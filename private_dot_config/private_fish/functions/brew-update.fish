function brew-update
	brew -v update
	brew upgrade --force-bottle
	brew upgrade
	brew cleanup --prune 60
	brew doctor
	npm-check -g -u
	nix flake update --flake /Users/moksha/.config/nix-darwin
end
