#!/usr/bin/env bash

install_ripgrep_if_required() {
    if ! command -v rg >/dev/null 2>&1; then

        echo -e "\u001b[36;1mInstalling ripgrep...\u001b[0m"
        if command -v dpkg >/dev/null 2>&1 && command -v apt-get >/dev/null 2>&1; then
            curl -sL 'https://github.com/BurntSushi/ripgrep/releases/download/11.0.1/ripgrep_11.0.1_amd64.deb' -o /tmp/ripgrep.deb
            sudo dpkg -i /tmp/ripgrep.deb
            sudo apt-get install -f
        elif command -v brew >/dev/null 2>&1; then
            brew install rg
        elif command -v yum >/dev/null 2>&1; then
            if ! command -v yum-config-manager >/dev/null 2>&1; then
                sudo yum install -y yum-utils 
            fi
            sudo yum-config-manager --add-repo=https://copr.fedorainfracloud.org/coprs/carlwgeorge/ripgrep/repo/epel-7/carlwgeorge-ripgrep-epel-7.repo
            sudo yum install -y ripgrep
        else
            echo -e "\u001b[33;1m Cannot install ripgrep\u001b[0m"
        fi
    else
        echo -e "\u001b[36;1mripgrep is already install\u001b[0m"
    fi
    return 0
}

install_fzf_if_required() {
    if ! command -v fzf >/dev/null 2>&1; then
        echo -e "\u001b[36;1mInstalling fzf...\u001b[0m"
        if command -v brew >/dev/null 2>&1; then
            brew install fzf
        else
            sudo rm -rf /usr/local/opt/fzf
            sudo mkdir -p /usr/local/opt/
            sudo git clone --depth 1 https://github.com/junegunn/fzf.git /usr/local/opt/fzf
            sudo chown -R $USER:`id -gn` /usr/local/opt/fzf
        fi
        /usr/local/opt/fzf/install --all --no-zsh --no-fish
        sudo cp /usr/local/opt/fzf/bin/fzf* /usr/local/bin/
        sudo chown $USER:`id -gn` /usr/local/bin/fzf*
    else
        echo -e "\u001b[36;1mfzf is already install\u001b[0m"
    fi
    return 0
}

install_z_if_required() {
    if command -v brew >/dev/null 2>&1; then
        if [ ! -f $(brew --prefix)/etc/profile.d/z.sh ]; then 
            echo -e "\u001b[36;1mInstalling z.sh...\u001b[0m"
            brew install z
        else
            echo -e "\u001b[36;1mz.sh is already install\u001b[0m"
        fi
    else
        echo -e "\u001b[36;1mInstalling z.sh...\u001b[0m"
        sudo curl -sL https://raw.githubusercontent.com/rupa/z/master/z.sh -o /usr/local/bin/z.sh
        sudo chown $USER:`id -gn` /usr/local/bin/z.sh
        chmod a+x /usr/local/bin/z.sh
    fi
    return 0
}

install_neomutt_if_required() {
    if ! command -v neomutt >/dev/null 2>&1; then

        echo -e "\u001b[36;1mInstalling neomutt...\u001b[0m"
        if command -v apt-get >/dev/null 2>&1; then
            sudo apt-get install neomutt -y
            mkdir -p $HOME/.mutt/cache
        elif command -v brew >/dev/null 2>&1; then
            brew install neomutt/homebrew-neomutt/neomutt
            mkdir -p $HOME/.mutt/cache
        elif command -v yum >/dev/null 2>&1; then
            if ! command -v yum-config-manager >/dev/null 2>&1; then
                sudo yum install -y yum-utils 
            fi
            sudo yum-config-manager --add-repo=https://copr.fedorainfracloud.org/coprs/flatcap/neomutt/repo/epel-7/flatcap-neomutt-epel-7.repo
            sudo yum install -y neomutt
            mkdir -p $HOME/.mutt/cache
        else
            echo -e "\u001b[33;1m Cannot install neomutt\u001b[0m"
        fi
    else
        echo -e "\u001b[36;1mneomutt is already installed\u001b[0m"
    fi
    return 0
}

backup_old_rcs() {
    echo -e "\u001b[33;1mBacking up old files...\u001b[0m";
    test -e ~/.bashrc && cp ~/.bashrc ~/.bashrc.old && rm ~/.bashrc 
    test -e ~/.alias && cp ~/.alias ~/.alias.old && rm ~/.alias 
    test -e ~/.tmux.conf && cp ~/.tmux.conf ~/.tmux.conf.old && rm ~/.tmux.conf 
    test -e ~/.gitconfig && cp ~/.gitconfig ~/.gitconfig.old && rm ~/.gitconfig 
    test -e ~/.vimrc && cp ~/.vimrc ~/.vimrc.old && rm ~/.vimrc 
    test -e ~/.muttrc && cp ~/.muttrc ~/.muttrc.old && rm ~/.muttrc 
    return 0
}

symlink_new_rcs() {
    PARENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
    echo -e "\u001b[36;1mAdding symlinks...\u001b[0m"
    ln -sfnv $PARENT_DIR/dotfiles/.bashrc ~/.bashrc
    ln -sfnv $PARENT_DIR/dotfiles/.alias ~/.alias
    ln -sfnv $PARENT_DIR/dotfiles/.tmux.conf ~/.tmux.conf
    ln -sfnv $PARENT_DIR/dotfiles/.gitconfig ~/.gitconfig
    ln -sfnv $PARENT_DIR/dotfiles/.vimrc ~/.vimrc
    ln -sfnv $PARENT_DIR/dotfiles/.muttrc ~/.muttrc
    return 0
}

copy_binaries() {
    BIN_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/bin" >/dev/null 2>&1 && pwd )"
    for path in $BIN_DIR/*; do
        name=`basename $path`;
        mkdir -p $HOME/bin
        cp $path $HOME/bin/$name;
    done
}

install_ripgrep_if_required
install_fzf_if_required
install_z_if_required
install_neomutt_if_required
backup_old_rcs
symlink_new_rcs
copy_binaries

echo -e "\u001b[36;1mPlease execute 'source $HOME/.bashrc' for changes to take effect.\u001b[0m"
