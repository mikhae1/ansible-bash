# ssh autocomplete
_complete_ssh_hosts()
{
        COMPREPLY=()
        cur="${COMP_WORDS[COMP_CWORD]}"
        comp_ssh_hosts=`cat ~/.ssh/known_hosts | \
                        cut -f 1 -d ' ' | \
                        sed -e s/,.*//g | \
                        grep -v ^# | \
                        uniq | \
                        grep -v "\[" ;
                cat /etc/ssh_config | \
                        grep "^Host " | \
                        awk '{print $2}'
                `
        COMPREPLY=( $(compgen -W "${comp_ssh_hosts}" -- $cur))
        return 0
}
complete -F _complete_ssh_hosts ssh

# bash autocomplete
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# git completions "g" alias:
source /usr/local/etc/bash_completion.d/git-completion.bash
__git_complete g __git_main

# load in the git branch prompt script.
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"
PS1="\[$txtylw\]@air\[$txtrst\] \w \[$txtblk\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\[$txtylw\]\$\[$txtrst\] "

# aliases
alias ll='ls -lG'
alias l='ls -G'
alias p='ping'
alias s='sudo'
alias g='git'
alias h='host'
alias nd='~/nd-tasks/bin/nd'
alias hg='history | grep'
alias tailf='tail -f'
alias ip="ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'"
alias pw='pwgen 10'
alias dc='docker-compose'
alias dud='docker-compose up && docker-compose down'

# homebrew access key
export HOMEBREW_GITHUB_API_TOKEN=

# pyenv completions
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# rbenv completions
eval "$(rbenv init -)"

export PATH=$PATH:~/xsclient:~/xsclient/bin

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

# docker API
# export DOCKER_TLS_VERIFY=1
# export DOCKER_HOST=host:2376
