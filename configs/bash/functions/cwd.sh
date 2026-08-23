cwd() {
    local dir_trim=2
    local dir_size=3
    local support_trim_path=true

    if [[ "$TBC_PROMPT_DIR_TRIM" =~ ^[0-9]+$ ]]; then
        dir_trim=$TBC_PROMPT_DIR_TRIM
    fi

    if [[ "$TBC_PROMPT_DIR_SIZE" =~ ^[0-9]+$ ]]; then
        dir_size=$TBC_PROMPT_DIR_SIZE
    fi

    if [[ "$TBC_SUPPORT_TRIM_PATH" == false ]]; then
        support_trim_path=false
    fi

    local perl_cmd="print join( '/', map { \$i++ < @F - ${dir_trim} ? substr \$_,0,${dir_size} : \$_ } @F)"

    if [[ "$support_trim_path" == true ]]; then
       pwd | sed "s#$HOME#~#" | perl -F/ -ane "$perl_cmd"
    else
       pwd | sed "s#$HOME#~#"
    fi
}
