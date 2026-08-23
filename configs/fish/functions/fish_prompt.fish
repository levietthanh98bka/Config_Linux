function fish_prompt --description 'Write out the prompt'
    set -f _user $TFC_CYAN_N' '$USER
    set -f _cwd $TFC_BLUE_N' 󰉋 '(pwd)
    set -f _git_str (fish_git_prompt)
    set -f _cmd_prefix $TFC_WHITE_N'󰶻 '$TFC_CL_NONE

    # Change color if root user
    if test $USER = root
        set _cmd_prefix $TFC_RED_N'# 󰶻 '$TFC_CL_NONE
    end

    # Shorten path if enabled
    if test "$TFC_SHORTENT_PATH" = true
        set _cwd $TFC_BLUE_N' 󰉋 '(prompt_pwd --full-length-dirs=2 --dir-length=1)
    end

    # Construct prompt
    set -f _prompt_string $_user$_cwd$_git_str$TFC_CL_NONE

    # Output
    printf "$_prompt_string\n"
    printf "$_cmd_prefix"
end
