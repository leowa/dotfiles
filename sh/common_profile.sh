
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

[[ -d ~/.profile.d ]] && source ~/.profile.d/*.sh

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

export KUBECONFIG="/Users/andyz/.kube/config"
export PROMPT_COMMAND='history -a'
export PATH=$PATH:$more_path
export PYTHONBREAKPOINT=ipdb.set_trace
