# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install oh-my-tmux
git clone https://github.com/gpakosz/.tmux.git $HOME/.tmux

sh $HOME/.config/nvim/bootstrap.sh
sh $HOME/.config/ripgrep/bootstrap.sh

# git config
git config --global pull.rebase true
git config --global core.excludesfile ~/.gitignore_global
