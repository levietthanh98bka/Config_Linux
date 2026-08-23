# Append some paths into PATH variable
if not contains "$HOME/.cargo/bin" $PATH
    set -p PATH $HOME/.cargo/bin
end

if not contains "$HOME/.local/bin" $PATH
    set -p PATH $HOME/.local/bin
end

if not contains /opt/homebrew/bin $PATH
    set -p PATH /opt/homebrew/bin
end

# Abbreviations
abbr -a chmox 'chmod +x'
abbr -a rf 'rm -rf'
abbr -a update 'sudo apt update && sudo apt upgrade -y'

# Fish builtin variables
set -g fish_color_valid_path
set -g fish_term24bit 1
set -g fish_greeting

# Recommend for user config
# set -g TFC_GIT_STATUS true
# set -g TFC_GIT_RELATIVE_COUNT true
# set -g fish_greeting    $TFC_GREEN_B"ARMORED RESPONSE COALITION - TOGETHER WE SURVIVE"
