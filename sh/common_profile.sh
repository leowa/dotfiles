
#### Only for bash
if [[ $SHELL =~ "bash" ]]; then
    [[ -d ~/.bash_profile.d ]] && source ~/.bash_profile.d/*.bash
    [[ -f ~/.bashrc ]] && source ~/.bashrc
    [[ -f ~/.bashrc_local ]] && source ~/.bashrc_local

    if [[ -n $(uname -a | grep -i darwin) ]];then
        if [ -f $(brew --prefix)/etc/bash_completion ];then
           source $(brew --prefix)/etc/bash_completion
        fi
    fi
	#### Command history related configurations######
	# ignore some commands from history
	export HISTIGNORE="pwd:ls:ls -ltr:"
	HISTCONTROL=ignoreboth
	# format history with time 
	export HISTTIMEFORMAT='%F %T '
	export HISTIGNORE="pwd:ls:ls -ltr:"
	# The resulting history line is loaded into the Readline editing buffer,
	# allowing further modification.
	shopt -s histverify
	# always append histories
	shopt -s histappend
fi

[[ -d ~/.profile.d ]] && {
	 for f in ~/.profile.d/*.sh; do source $f; done
}

#### Locale relaed settings ####
# Set  LC and LANG for tmux to accept utf-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8


#### brew serttings
export HOMEBREW_NO_AUTO_UPDATE=1

more_path=/usr/local/sbin:/usr/local/Cellar/mosquitto/1.5.8/bin/:/usr/local/opt/gnu-getopt/bin

### programming lanuage settings
[[ -f /usr/libexec/java_home ]] && export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

# golang setting
if test -d /opt/gopath/; then
    export GOPATH=/opt/gopath
    export GOROOT=`go env GOROOT`
	more_path=$more_path:${GOPATH//://bin:}/bin:$GOROOT/bin/
fi

# mactex path
if test -d /Library/TeX/textin; then
	more_path=$more_path:/Library/TeX/textbin/
fi

# py3 venv
if test -d $HOME/dev/py3/bin; then
	more_path=$more_path:$HOME/dev/py3/bin
fi

# pipenv
# if type -a pipenv &> /dev/null; then
# 	eval "$(pipenv --completion)"
# fi

export KUBECONFIG="$HOME/.kube/config"
export PROMPT_COMMAND='history -a'
export PATH=$PATH:$more_path
export PYTHONBREAKPOINT=ipdb.set_trace
if type -a rbenv | grep -v "shell" &> /dev/null;then
  if type -a rbenv &> /dev/null; then
    eval "$(rbenv init -)"
  fi
fi

if test -z $VIRTUAL_ENV -a -d ~/dev/py3;then
  source ~/dev/py3/bin/activate
fi
