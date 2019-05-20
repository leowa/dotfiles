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
```
