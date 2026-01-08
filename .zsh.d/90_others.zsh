
function is_osx() { [[ $OSTYPE == darwin* ]]; }

if ! is_osx; then
	export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

	# for llvm
	export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
	export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
	# tarball nvim
	# https://github.com/neovim/neovim/releases
	# https://qiita.com/qq8244353/items/94cea37bf85c09dc4742
fi
	export PATH=$PATH:~/nvim-linux64/bin

# ビープ音の停止
setopt no_beep

# ビープ音の停止(補完時)
setopt nolistbeep

export HISTSIZE=1000			# メモリに保存される履歴の件数
export SAVEHIST=100000			# 履歴ファイルに保存される履歴の件数
setopt hist_ignore_dups			# 重複を記録しない
setopt hist_ignore_all_dups		# 同じコマンドをヒストリに残さない

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'


# alias command
alias gcm='git commit -m'
alias gd='git diff'
if is_osx; then
	alias ls='ls -AFLG'
else
	alias ls='ls -AFLG --width=120'
fi
# alias rmf='rm -fr'
alias bat='batcat -A'
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
pss () {
    ps aux | grep -E "PID|$1" | grep -v grep
}
 if type trash-put &> /dev/null
then
    alias rm=trash-put
fi

# --------------------------------------------------
#  $ tree でディレクトリ構成表示
# --------------------------------------------------

# alias tree="pwd;find . | sort | sed '1d;s/^\.//;s/\/\([^/]*\)$/|--\1/;s/\/[^/|]*/| /g'"
alias tree="tree -al"


# https://home.hirosaki-u.ac.jp/heroic-2020/989/
# https://uguisu.skr.jp/Windows/less_color.html
# https://qiita.com/akinoriikeda/items/27f95bb1cc8c99ddcbc0
# https://qiita.com/delphinus/items/b04752bb5b64e6cc4ea9
export LESS='-i -M -R'
export PAGER=less
export LESS_TERMCAP_mb=$'\E[01;31m'      # Begins blinking.
export LESS_TERMCAP_md=$'\E[01;31m'      # Begins bold.
export LESS_TERMCAP_me=$'\E[0m'          # Ends mode.
export LESS_TERMCAP_se=$'\E[0m'          # Ends standout-mode.
export LESS_TERMCAP_so=$'\E[00;47;30m'   # Begins standout-mode.
export LESS_TERMCAP_ue=$'\E[0m'          # Ends underline.
export LESS_TERMCAP_us=$'\E[01;32m'      # Begins underline.
# if which lesspipe.sh > /dev/null; then
#     export LESSOPEN='| /usr/share/source-highlight/src-hilite-lesspipe.sh %s'
# fi
# if which src-hilite-lesspipe.sh > /dev/null; then
if is_osx; then
	export LESSOPEN='| /opt/homebrew/bin/src-hilite-lesspipe.sh %s'
else
	export LESSOPEN='| /usr/share/source-highlight/src-hilite-lesspipe.sh %s'
fi



# for tmux start function
function is_exists() { type "$1" >/dev/null 2>&1; return $?; }
function is_screen_running() { [ ! -z "$STY" ]; }
function is_tmux_runnning() { [ ! -z "$TMUX" ]; }
function is_screen_or_tmux_running() { is_screen_running || is_tmux_runnning; }
function shell_has_started_interactively() { [ ! -z "$PS1" ]; }
function is_ssh_running() { [ ! -z "$SSH_CONECTION" ]; }

function tmux_automatically_attach_session()
{
    if is_screen_or_tmux_running; then
        ! is_exists 'tmux' && return 1

        if is_tmux_runnning; then
            echo "${fg_bold[red]} _____ __  __ _   ___  __ ${reset_color}"
            echo "${fg_bold[red]}|_   _|  \/  | | | \ \/ / ${reset_color}"
            echo "${fg_bold[red]}  | | | |\/| | | | |\  /  ${reset_color}"
            echo "${fg_bold[red]}  | | | |  | | |_| |/  \  ${reset_color}"
            echo "${fg_bold[red]}  |_| |_|  |_|\___//_/\_\ ${reset_color}"
        elif is_screen_running; then
            echo "This is on screen."
        fi
    else
        if shell_has_started_interactively && ! is_ssh_running; then
            if ! is_exists 'tmux'; then
                echo 'Error: tmux command not found' 2>&1
                return 1
            fi

            if tmux has-session >/dev/null 2>&1 && tmux list-sessions | grep -qE '.*]$'; then
                # detached session exists
                tmux list-sessions
                echo -n "Tmux: attach? (y/N/num) "
                read
                if [[ "$REPLY" =~ ^[Yy]$ ]] || [[ "$REPLY" == '' ]]; then
                    tmux attach-session
                    if [ $? -eq 0 ]; then
                        echo "$(tmux -V) attached session"
                        return 0
                    fi
                elif [[ "$REPLY" =~ ^[0-9]+$ ]]; then
                    tmux attach -t "$REPLY"
                    if [ $? -eq 0 ]; then
                        echo "$(tmux -V) attached session"
                        return 0
                    fi
                fi
            fi

            if is_osx && is_exists 'reattach-to-user-namespace'; then
                # on OS X force tmux's default command
                # to spawn a shell in the user's namespace
                tmux_config=$(cat $HOME/.tmux.conf <(echo 'set-option -g default-command "reattach-to-user-namespace -l $SHELL"'))
                tmux -f <(echo "$tmux_config") new-session && echo "$(tmux -V) created new session supported OS X"
            else
                tmux new-session && echo "tmux created new session"
            fi
        fi
    fi
}
tmux_automatically_attach_session

