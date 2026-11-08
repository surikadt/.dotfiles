# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc
. "$HOME/.cargo/env"
export XDG_RUNTIME_DIR=/run/user/1000
export AWS_VAULT_BACKEND=file
export TCELL_TRUECOLOR=disable

# system
alias sdu="sudo dnf upgrade --refresh"
alias fu="flatpak update"

# python venv
function va() {
    if [ "$#" -eq 0 ]; then
	ENV=".venv"
    else
	ENV="$1"
    fi

	source $ENV/bin/activate
}

# fzf and create sessions
bind '"\C-a\C-f":"tmxs\n"'
# direnv
eval "$(direnv hook bash)"
# fzf: navigable Ctrl-R history + Ctrl-T files + completion
eval "$(fzf --bash)"

# jupyter notebook
function jp() {
    if [[ $# -gt 0 ]]; then
    case "$1" in
      -a)
        va
        ;;
      *)
        echo "Unknown option: $1"
        return 1
        ;;
    esac
	fi

    jupyter notebook
}

# tmux sessionizer
tmxs() {
    $HOME/.local/bin/tmux-sessionizer
}
. "$HOME/.cargo/env"


. "/home/surikadt/.local/share/bob/env/env.sh"
