# dotfiles
configuration files for various tools

## TODO

- [ ] Include more other configurations such as vimrc

## Install brew and ansible

```sh
# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install oh-my-zsh
/bin/sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install python3
brew install python3 Rust
pip3 install -U pip
pip3 install ansible
```

TIPS: run `brew search <app>` to search formula in `cask`, and then install it like `brew install --cask adobe-acrobat-reader`

## Install with ansible

First configure your global ansible hosts in `/etc/ansible/hosts`, add two groups like this:

```inf
[all]
andyub
localhost

[mac]
localhost

[linux]
andyub

[dev]
andyub
```

Then run command like this to configure remote linux dev box: `ansible-playbook linux.yml -K`.
If you don't want to input password for second run, just run `ansible-playbook linux.yml -l dev --skip-tags sudo`.

For mac book: run command: `ansible-playbook`

## Create soft links

```sh
ln -sf $(PWD)/vscode/user-setting.json "$HOME/Library/Application Support/Code/User/settings.json"
ln -sf $(PWD)/vscode/user-keybindings.json "$HOME/Library/Application Support/Code/User/keybindings.json"
ln -sf $(PWD)/vscode/flake8.ini "$HOME/.config/flake8"
ln -sf $(PWD)/vscode/pyproject.toml "$HOME/.config/pyproject.toml"
# ln -sf $(PWD)/vscode/golangci.yml "$(GOPATH)/.golangci.yml"
ln -sf $(PWD)/vscode/pycodestyle.ini "$HOME/.config/pycodestyle"
ln -sf $(PWD)/ansible/ansible.cfg ~/.ansible.cfg
ln -sf $PWD/vim/vimrc ~/.vimrc
ln -sf $PWD/tmux/tmux.conf ~/.tmux.conf
ln -sf $PWD/sh/zshrc  ~/.zshrc
ln -sf $PWD/sh/common_profile.sh  ~/.sh_profile
[[ -d ~/.profile.d ]] || mkdir ~/.profile.d
ln -sf $PWD/sh/functions.sh ~/.profile.d/function.sh
```


# Mac extra setups

## Install [Karabiner-Elements](https://karabiner-elements.pqrs.org/)

After installing, make sure to enable it both on `general` and `privacy` tab
Add mapping from `caps_lock` to `f10`, alsl switch `command` and `option` key for USB keyboard by adding mapping for that device

## Configure vim

Just run `vim/setup_vim.sh`

## Configure tmux

```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# start tmux and then install plugins by pressing prefix + I (capital i, as in Install) 
tmux
```

## Configure ITerm2

- Add a new Profile called `Andy`and set it as default one
`Profiles->Colors->Color Presets`: Load `color-scheme/base16-monokai.dark.256.itermcolors` and choose it

- Install powerline font

```sh
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts

```
Then fix iterm2 following `Profiles>Andy>Text>Font` to choose a font such as `Noto Mono for Powerline` as discussed in [this issue](https://github.com/powerline/fonts/issues/44)

## Configure vscode

- Install vscode extensions provided with the list with cli
```sh
for x in `cat vscode/ext.txt`; do code --install-extension $x; done
```

- Configure `black` for python formatter

```sh
# reference: https://black.readthedocs.io/en/stable/usage_and_configuration/the_basics.html#configuration-via-a-file
```

## Configure sublime text

- Install *Package Control*

Open menu: View > Show Console menu, and then input the following script:

```py
import urllib.request,os; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); open(os.path.join(ipp, pf), 'wb').write(urllib.request.urlopen( 'http://sublime.wbond.net/' + pf.replace(' ','%20')).read())
```

- Manually install packages by `Package Control` for those listed in [subl readme](./sublime/README.md)

- Configure sidebar for installed theme following [subl readme](./sublime/README.md)

- Configure user key mapping
Use [keymap.json](./sublime/keymap.json)

- Configure user settings
Use [user-setting.json](./sublime/user-setting.json)

## Configure Acrobat Reader

- Change `Page Background` color in `Accessibility` tab to RGB(246,245,216)
- Enable `single-key accelerators` in `General` tab

## Configure goland

- For python2, you can install `pyenv`, install `v2.7.18` by `pyenv install  2.7.18`, and configure this env with path like `/Users/azhang/.pyenv/versions/2.7.18`.

## Install formulas from other tap

- install mongodb community version
```sh
brew tap mongodb/brew
brew install mongodb-community@4.2
echo 'export PATH="/opt/homebrew/opt/mongodb-community@4.2/bin:$PATH"' >> ~/.zshrc
```
