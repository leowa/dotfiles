# dotfiles
configuration files for various tools

## TODO

- [ ] Include more other configurations such as vimrc

## Links

```sh
ln -sf $(PWD)/vscode/user-setting.json "$HOME/Library/Application Support/Code/User/settings.json"
ln -sf $(PWD)/vscode/user-keybindings.json "$HOME/Library/Application Support/Code/User/keybindings.json"
ln -sf $(PWD)/vscode/flake8.ini "$HOME/.config/flake8"
ln -sf $(PWD)/vscode/golangci.yml "$(GOPATH)/.golangci.yml"
ln -sf $(PWD)/vscode/pycodestyle.ini "$HOME/.config/pycodestyle"
ln -sf $(PWD)/ansible/ansible.cfg ~/.ansible.cfg
ln -sf $PWD/vim/vimrc ~/.vimrc
ln -sf $PWD/tmux/tmux.conf ~/.tmux.conf
ln -sf $PWD/sh/zshrc  ~/.zshrc
ln -sf $PWD/sh/common_profile.sh  ~/.sh_profile
[[ -d ~/.profile.d ]] || mkdir ~/.profile.d
ln -sf $PWD/sh/functions.sh ~/.profile.d/function.sh
```

## Install with ansible

First configure your global ansible hosts in `/etc/ansible/hosts`, add two groups like this:

```inf
[all]
andyub

[linux]
andyub

[dev]
andyub
```

Then run command like this to configure remove linux dev box: `ansible-playbook linux.yml -K`.
If you don't want to input password for second run, just run `ansible-playbook linux.yml -l dev --skip-tags sudo`.
