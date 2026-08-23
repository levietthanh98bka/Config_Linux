bash_greeting() {
    if [[ -n "$LVT_BASH_GREETING" ]]; then
        echo -e "$LVT_BASH_GREETING"
    fi
}
