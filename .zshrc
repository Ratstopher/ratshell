# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Load a specific theme (fallback if random fails)
ZSH_THEME="alanpeabody"

# Enable command auto-correction.
ENABLE_CORRECTION="true"

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# ---  ^=^p^ RATPUTER 3000 STARTUP ---

# Show welcome banner
if command -v figlet >/dev/null && command -v lolcat >/dev/null; then
  echo
  figlet -f slant "Rathacker 3000" | lolcat
  echo
else
  echo " ^=^p^ Welcome to Rathacker 3000"
fi

# Set locale to prevent Perl issues
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# ---  ^=   Prompt setup with randomized rainbow colors ---
function rat_prompt() {
  local colors=(red yellow green cyan blue magenta)
  local c=$((RANDOM % ${#colors[@]}))
PROMPT='%F{cyan}🐀 Rathacker@%m %F{white}%~ %F{red}❯ %f'
RPROMPT='%{%F{magenta}%}🕒 %D{%H:%M:%S}%{%f%}'



}
autoload -U add-zsh-hook
add-zsh-hook precmd rat_prompt

# ---  ^z^y  ^o Aliases & tools ---
alias l='ls -lah --color=auto'
alias update='sudo apt update && sudo apt upgrade -y'
alias matrix='cmatrix -C green'
alias glitter='fortune | cowsay -f dragon | lolcat'
alias rlog='echo " ^=^p^ $(date): Initiate." | lolcat'

# Use nano unless you like pain
export EDITOR=nano

# ---  ^=^p^= Asciiquarium (optional startup) ---
#if [[ -x "$HOME/asciiquarium_1.1/asciiquarium" ]]; then
#  echo
#  "$HOME/asciiquarium_1.1/asciiquarium"
#fi


export EDITOR=vim
