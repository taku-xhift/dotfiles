# echo $(pwd -P)
ZSHHOME="${HOME}/.zsh.d"
# ZSHHOME="/home/taku/.zsh.d"

if [ -d $ZSHHOME -a -r $ZSHHOME -a \
     -x $ZSHHOME ]; then
    for i in $ZSHHOME/*; do
        [[ ${i##*/} = *.zsh ]] &&
            [ \( -f $i -o -h $i \) -a -r $i ] && . $i
    done
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

