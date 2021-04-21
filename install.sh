read -p "WARNING! This is gonna override the original dotfiles. Are you sure you want to continue? (y/n) " continue
#echo $continue

if [ "$continue" == "y" ]; then
	ln -svf "$(pwd)/.xonshrc" ~/.xonshrc
	ln -svf "$(pwd)/.gitconfig" ~/.gitconfig
	mkdir -p ~/.ssh && ln -svf "$(pwd)/.ssh/config" ~/.ssh/config
fi
