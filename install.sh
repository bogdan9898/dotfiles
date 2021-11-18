RED=$'\033[0;31m'
RESET=$'\033[0m' # No Color

read -p "${RED}+---------------------------------WARNING----------------------------------+
|                                                                          |
|${RESET}        This operation is going to override the original dotfiles.        ${RED}|
|${RESET}               Are you sure you want to continue? [y/n]                   ${RED}|
|                                                                          |
+--------------------------------------------------------------------------+${RESET}
" continue

if [ "$continue" == "y" ]; then
	ln -svf "$(pwd)/bashrc/.bashrc" ~/.bashrc
	ln -svf "$(pwd)/xonshrc/.xonshrc" ~/.xonshrc
	ln -svf "$(pwd)/zshrc/.zshrc" ~/.zshrc
	ln -svf "$(pwd)/gitconfig/.gitconfig" ~/.gitconfig
	mkdir -p ~/.ssh && ln -svf "$(pwd)/ssh/config" ~/.ssh/config
	mkdir -p ~/.config/konsave && ln -svf "$(pwd)/konsave/conf.yaml" ~/.config/konsave/conf.yaml
fi
