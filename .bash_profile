source ~/.profile

export PATH=~/Scripts:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
#export PATH=/usr/local/share/npm/bin:$PATH
export JAVA_HOME=`/usr/libexec/java_home`

export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="$(python3 -m site --user-base)/bin:$PATH"

function setjdk() { if [ $# -ne 0 ];then export JAVA_HOME=`/usr/libexec/java_home -v $@`; fi; java -version; }

export ORACLE_HOME='/usr/local/oracle/instantclient_11_2'
export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:$ORACLE_HOME
export TNS_ADMIN=$ORACLE_HOME/network/admin
export PATH=$ORACLE_HOME:$PATH


alias setjh="source ~/Scripts/setjavahome.sh"

export MAVEN_OPTS='-Xmx2024m -XX:MaxPermSize=512m -Djava.awt.headless=true'


# blackbox_edit calls "$EDITOR" instead of $EDITOR,
# and this only works if $EDITOR is one word and is not an alias.
# see https://github.com/StackExchange/blackbox/issues/72
cat > ~/Scripts/code_with_wait <<EDITOR
#!/bin/bash
exec code --wait "\$@"
EDITOR
chmod +x ~/Scripts/code_with_wait

export EDITOR='code_with_wait'

#TODO: do I care about this?
export LESSEDIT='mate -l %lm %f'

# commenting out for now; getting a weird 'bash: [: too many arguments' error
#[[ -s /Users/mattdrees/.nvm/nvm.sh ]] && . /Users/mattdrees/.nvm/nvm.sh # This loads NVM


export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"


#temporarily removing old jenv config; using a newer jenv now
## enable jenv shims and autocompletion
#if which jenv > /dev/null; then eval "$(jenv init -)"; fi

## for some reason, jenv doesn't work quite right for 'system'.
## work around this by putting a symlink in manually.
#if [[ ! -h ~/.jenv/versions/system ]]; then
#	ln -s `/usr/libexec/java_home` ~/.jenv/versions/system
#fi




export PATH=~/.jenv-override-shims:$PATH

#[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
# not sure what happened above; brew didn't have autojump installed; installed it and it had me do the below
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh


LESSOPEN="|/usr/local/bin/lesspipe.sh %s"
export LESSOPEN

binless() {
  hexdump -C $1 | less
}

# from https://blog.kumina.nl/2009/11/gpg-agent-on-macosx/, except I don't need ssh_auth stuff
# Script for ensuring only one instance of gpg-agent is running
# and if there is not one, start an instance of gpg-agent.
if test -f $HOME/.gpg-agent-info && kill -0 `cut -d: -f 2 $HOME/.gpg-agent-info` 2>/dev/null; then
	GPG_AGENT_INFO=`cat $HOME/.gpg-agent-info`
#	SSH_AUTH_SOCK=`cat $HOME/.ssh-auth-sock`
#	SSH_AGENT_PID=`cat $HOME/.ssh-agent-pid`
	export GPG_AGENT_INFO #SSH_AUTH_SOCK SSH_AGENT_PID
else
	echo "Starting gpg-agent"
	eval `gpg-agent --daemon`
	echo $GPG_AGENT_INFO >$HOME/.gpg-agent-info
#	echo $SSH_AUTH_SOCK > $HOME/.ssh-auth-sock
#	echo $SSH_AGENT_PID > $HOME/.ssh-agent-pid
fi
# Imperative that this environment variable always reflects the output
# of the tty command.
GPG_TTY=`tty`
export GPG_TTY

alias bds='$(boot2docker shellinit)'

# but override this, because of our vpn issues
alias bdvpn='export DOCKER_HOST=tcp://boot2docker:2376'

export ANSIBLE_COW_SELECTION=random

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


shopt -s histappend

export HISTCONTROL=ignoreboth:erasedups


# Avoid duplicates
export HISTCONTROL=ignoredups:erasedups  
# Timestamps in history file
export HISTTIMEFORMAT='%F %T '

# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend

# After each command, append to the history file
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a;"
# (But don't clear and reread it)
# see http://unix.stackexchange.com/questions/1288/preserve-bash-history-in-multiple-terminal-windows


export HISTSIZE=
export HISTFILESIZE=1000000



# recommended by https://gist.github.com/korya/bd0de47f36dbb5c29a90
# and in particular, this gets git prompt working for a new Terminal tab
if [ -r ~/.profile ]; then . ~/.profile; fi
case "$-" in *i*) if [ -r ~/.bashrc ]; then . ~/.bashrc; fi;; esac

clear-aws-env() {
  source source-to-clear-AWS-envvars.sh
}

