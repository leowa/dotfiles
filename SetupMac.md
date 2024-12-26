- [ ] System level configuration
    + Function keys: search "Functions Keys" and then check "Use F1, F2, etc keys as standard function keys"
    + "Silent Clicking" for Trackpad: "System Settings/Preferences" → "Trackpad" → "Point & Click". It's gone after M1, the left option is to enable "Tap to click", also a good option.

- [ ] Set up z shell
```bash
ln -sf $PWD/sh/zshrc  ~/.zshrc
ln -sf $PWD/sh/common_profile.sh  ~/.sh_profile
[[ -d ~/.profile.d ]] || mkdir ~/.profile.d
ln -sf $PWD/sh/functions.sh ~/.profile.d/function.sh
ln -sf $PWD/sh/alias.sh ~/.profile.d/alias.sh
# TODO: Fix slow git branch update
```

- [x] Configure ITerm2
    + "Silence Bell" in "Settings -> Profiles -> Terminal"

- [x] Set up vscode:
  + Install vscode command line
> Open the Command Palette (Cmd+Shift+P) and type 'shell command' to find the Shell Command: Install 'code' command in PATH command. https://code.visualstudio.com/docs/setup/mac
  + Link keyboard mapping, and user setting files:
```bash
# do this under root of dotfiles directory
  ln -sf $(PWD)/vscode/user-setting.json "$HOME/Library/Application Support/Code/User/settings.json"
  ln -sf $(PWD)/vscode/user-keybindings.json "$HOME/Library/Application Support/Code/User/keybindings.json"
```
  + enable VIM mode by installing extensions: `for x in `cat vscode/ext.txt`; do code --install-extension $x; done`


- [ ] Configure Homebrew mirror provided by SJTU
```bash
cat << EOF > ~/.zprofile
  export HOMEBREW_PIP_INDEX_URL=https://mirror.sjtu.edu.cn/pypi/web/simple
  export HOMEBREW_API_DOMAIN=https://mirror.sjtu.edu.cn/homebrew-bottles/api  #ckbrew
  export HOMEBREW_BOTTLE_DOMAIN=https://mirror.sjtu.edu.cn/homebrew-bottles
  eval $(/opt/homebrew/bin/brew shellenv) #ckbrew
EOF
```

- [ ] Install those packages:
```
vim
watch
tmux
wget
git
telnet
colordiff
bash-completion
font-hack-nerd-font
tree
jq
zip
autossh
minikube
kubernetes-cli
kubectx
helm
# firefox
golang
the_silver_searcher
ripgrep
hub
pyenv
mtr
pwgen
awscli
coreutils
ncdu
gh
java
moreutils
terraform
terragrunt
packer
libffi
fzf
wireshark
```
- [ ] Set up Sublime Text
- [ ] Set up tmux
## Configure tmux

```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# start tmux and then install plugins by pressing prefix + I (capital i, as in Install)
tmux
```
- [ ] Set up Sync