# ----------------------
# Environment
# ----------------------
export EDITOR=nano
export TERMINAL=kitty

# ----------------------
# Pywal colors
# ----------------------
if [ -f "$HOME/.cache/wal/colors.sh" ]; then
  source "$HOME/.cache/wal/colors.sh"
fi

# ----------------------
# Starship prompt
# ----------------------
eval "$(starship init zsh)"

# ----------------------
# Zsh behavior
# ----------------------
setopt autocd
setopt correct
setopt interactivecomments

# ----------------------
# History
# ----------------------
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt share_history

# ----------------------
# Plugins (lightweight)
# ----------------------
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
