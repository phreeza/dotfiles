autoload colors; colors

export EDITOR="/usr/bin/vim"

# number of lines kept in history
export HISTSIZE=1000
# number of lines saved in the history after logout
export SAVEHIST=1000
# location of history
export HISTFILE=~/.zhistory
# append command to history file once executed
setopt inc_append_history

autoload -U compinit
compinit

# Initialize colors.
autoload -U colors
colors
 
# Allow for functions in the prompt.
setopt PROMPT_SUBST
 
# Autoload zsh functions.
fpath=(~/.zsh/functions $fpath)
autoload -U ~/.zsh/functions/*(:t)
 
# Enable auto-execution of functions.
typeset -ga preexec_functions
typeset -ga precmd_functions
typeset -ga chpwd_functions
 
# Append git functions needed for prompt.
preexec_functions+='preexec_update_git_vars'
precmd_functions+='precmd_update_git_vars'
chpwd_functions+='chpwd_update_git_vars'

export PROMPT='$(prompt_git_info)%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m%{$fg[green]%} [ %~ ]%b%{$reset_color%} %# '

#some OS specific adaptations
case `uname` in
  Darwin)
    alias ls='ls -FG'
    ;;
  Linux)
    alias ls='ls -F --color=auto'
    alias gopen='gnome-open'
    ;;
esac

#load local variables if they exist
if [ -e ~/.zsh_profile ]; then
  source ~/.zsh_profile
fi
