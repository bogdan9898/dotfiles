read -p "WARNING! This is gonna override the original dotfiles. Are you sure you want to continue? (y/n) " continue
#echo $continue

if [ "$continue" == "y" ]; then
	ln -svf ~/dotfiles/.xonshrc ~/.xonshrc
	ln -svf ~/dotfiles/.gitconfig ~/.gitconfig
fi
