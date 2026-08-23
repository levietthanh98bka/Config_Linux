bash_prompt() {
    TBC_USER='\e[0;36m  \u'
    if [[ $(whoami) = 'root' ]]; then
        TBC_USER='\e[0;31m  \u'
    fi

    if [[ "$TBC_SHOW_HOSTNAME" =~ ^(true|yes|ok|1)$ ]]; then
        declare -p SSH_TTY &>/dev/null &&
            TBC_HOST_ICO='' ||
            TBC_HOST_ICO='󰍹'

        if [[ -n "$TBC_OVERRIDE_HOSTNAME" ]]; then
            TBC_HOSTNAME='\e[0;33m '$TBC_HOST_ICO' '$TBC_OVERRIDE_HOSTNAME
        else
            TBC_HOSTNAME='\e[0;33m '$TBC_HOST_ICO' '$HOSTNAME
        fi
    fi

    echo ${TBC_USER}${TBC_HOSTNAME}' \e[0;34m󰉋 `cwd`\e[00m `bash_git_prompt`\n  '
}
