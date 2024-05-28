#=======================================\
#
#           Better Defaults
#
#=======================================/
alias vi='nvim'
alias ls='eza -al --color=always --icons --group-directories-first'
alias rm='trash-put'
alias cat='bat -pp'
alias dig='doge'

#=======================================\
#
#            Misc Aliases
#
#=======================================/
alias spt='spotify_player'
alias yeet='yay -Rcs'
alias s='kitten ssh'
alias st='SpeedTest'
alias fixcode='sudo chown -R $(whoami) /opt/visual-studio-code'
alias updatep10k='git -C ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k pull'

#=======================================\
#
#            Yubikey Woes
#
#     The Yubikey is locked down to
#       just one thing, signing or
#         ssh, we fix this by
#             using these 
#               aliases
#=======================================/

#=======================================\
#
#         Yubikey Singing Ready
#
#=======================================/
function fs {
  ssh-add -D 1&> /dev/null
  rm -rf $HOME/.gnupg/private-keys-v1.d
  pkill gpg-agent
  sleep 0.5
  gpg --card-status
  echo $'\n \nYubikey setup for signing.'
}

#=======================================\
#
#         Yubikey SSH Ready
#
#=======================================/
function fss {
  pkill gpg-agent
  sleep 0.2
  ssh-add -l 1&> /dev/null
  echo 'Yubikey SSH Enabled'
}
