#!/usr/bin/env bash

# Install dependencies
echo -e "\u001b[36;1mInstalling ripgrep...\u001b[0m"
if command -v dpkg >/dev/null 2>&1 && command -v apt-get >/dev/null 2>&1; then
    curl -sL 'https://github.com/BurntSushi/ripgrep/releases/download/11.0.1/ripgrep_11.0.1_amd64.deb' -o /tmp/ripgrep.deb
    sudo dpkg -i /tmp/ripgrep.deb
    sudo apt-get install -f
elif command -v yum >/dev/null 2>&1; then
    if ! command -v yum-config-manager >/dev/null 2>&1; then
        sudo yum install -y yum-utils 
    fi
    sudo yum-config-manager --add-repo=https://copr.fedorainfracloud.org/coprs/carlwgeorge/ripgrep/repo/epel-7/carlwgeorge-ripgrep-epel-7.repo
    sudo yum install -y ripgrep
else
    echo -e "\u001b[33;1m Cannot install ripgrep\u001b[0m"
fi


echo -e "\u001b[36;1mInstalling fzf...\u001b[0m"
sudo rm -rf /usr/local/opt/fzf
sudo mkdir -p /usr/local/opt/
sudo git clone --depth 1 https://github.com/junegunn/fzf.git /usr/local/opt/fzf
sudo chown -R $USER:$USER /usr/local/opt/fzf
/usr/local/opt/fzf/install --all --no-zsh --no-fish

echo -e "\u001b[36;1mInstalling z.sh...\u001b[0m"
sudo curl -sL https://raw.githubusercontent.com/rupa/z/master/z.sh -o /usr/local/bin/z.sh
sudo chown $USER:$USER /usr/local/bin/z.sh
chmod a+x /usr/local/bin/z.sh

PARENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo -e "\u001b[33;1mBacking up old files...\u001b[0m";
mv -fv ~/.bashrc ~/.bashrc.old
mv -fv ~/.alias ~/.alias.old
mv -fv ~/.tmux.conf ~/.tmux.conf.old
mv -fv ~/.gitconfig ~/.gitconfig.old
mv -fv ~/.vimrc ~/.vimrc.old

echo -e "\u001b[36;1mAdding symlinks...\u001b[0m"
ln -sfnv $PARENT_DIR/dotfiles/.bashrc ~/.bashrc
ln -sfnv $PARENT_DIR/dotfiles/.alias ~/.alias
ln -sfnv $PARENT_DIR/dotfiles/.tmux.conf ~/.tmux.conf
ln -sfnv $PARENT_DIR/dotfiles/.gitconfig ~/.gitconfig
ln -sfnv $PARENT_DIR/dotfiles/.vimrc ~/.vimrc

echo -e "\u001b[36;1mPlease execute 'source $HOME/.bashrc' for changes to take effect.\u001b[0m"
