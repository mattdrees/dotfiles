#
#  .bashrc is run by bash when starting interactive shells, unless it's a login shell
#
#   > ~/.bashrc is the place to put stuff that applies only to bash itself,
#   > such as alias and function definitions, shell options, and prompt settings.
#      - from https://gist.github.com/korya/bd0de47f36dbb5c29a90
#
# I've added a line to .bash_profile to source this file
# so these are run for login shells as well

#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

source ~/.aliases
source ~/.functions

#source ~/git-completion.bash

complete -C '/usr/local/bin/aws_completer' aws

if [ -f /usr/local/share/bash-completion/bash_completion ]; then
  . /usr/local/share/bash-completion/bash_completion
fi

# from http://djromero.wuonm.com/git-branch-bash-prompt/
# thanks Julián Romero
get_dir() {
    printf "%s" $(pwd | sed "s:$HOME:~:")
}

rename_tab() {
    echo -ne "\033]0;"$@"\007"
}

rename_tab_to_dir() {
    rename_tab $(get_dir)
}

git_prompt_command() {
    local me_or_username="\u"
    if [ "$USER" == "mattdrees" ]; then
        me_or_username="me"
    fi
    __git_ps1 "\n$me_or_username@\h:\W" "\n\\$ "
}

#GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWCOLORHINTS=true
GIT_PS1_UNTRACKEDFILES=true
PROMPT_COMMAND='git_prompt_command;rename_tab_to_dir;'

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.bash
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

complete -C /usr/local/bin/terraform terraform
