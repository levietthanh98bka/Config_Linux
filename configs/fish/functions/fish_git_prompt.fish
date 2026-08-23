function ___branch_info
    # Failsafe
    if not set -q TFC_GIT_PROMPT_LOCK
        return
    end

    set -f bare_repo $argv[1]
    set -f head_sha $argv[2]

    if test $bare_repo = true
        echo $TFC_WHITE_N"   BARE"
        echo false
        return
    end

    set -f branch_name (command git branch --show-current)
    if test -z "$branch_name"
        echo $TFC_YELLOW_N'  '$TFC_PINK_N(string shorten -m8 -c "" -- $head_sha)
        echo true # this is a detached head
        return
    end

    echo $TFC_YELLOW_N'  '$TFC_PURPLE_N$branch_name
    echo false # this is not a detached head
end

function ___worktree_prompt
    # Failsafe
    if not set -q TFC_GIT_PROMPT_LOCK
        return
    end

    # Assume we are inside the worktree
    set -f git_status (command git -c core.fsmonitor= status --porcelain -z -unormal | string split0)

    # Init dirty and untracked status
    set -f dirty false
    set -f untracked false

    # Update dirty and untracked status of git repos
    string match -qr '^\s*[ACDMR]' -- $git_status; and set dirty true
    string match -qr '^\?\?' -- $git_status; and set untracked true

    # Clean case
    if test $dirty = false; and test $untracked = false
        echo $TFC_WHITE_N'  '$TFC_GREEN_N''
        return
    end

    set -f worktree_dirty $TFC_YELLOW_N''
    set -f worktree_untrack $TFC_BLUE_N''

    set -f worktree_string ''

    # Update worktree string
    if test $dirty = true
        set worktree_string $worktree_dirty
    end

    if test $untracked = true
        if test -z $worktree_string
            set worktree_string $worktree_untrack
        else
            set worktree_string $worktree_string' '$worktree_untrack
        end
    end

    echo $TFC_WHITE_N'  '$worktree_string
end

function ___relative_upstream
    # Failsafe
    if not set -q TFC_GIT_PROMPT_LOCK
        return
    end

    set -f count (command git rev-list --count --left-right @{upstream}...HEAD 2>/dev/null | string replace \t " ")
    if test $status -ne 0
        echo ''
        return
    end

    echo $count | read -f behind ahead
    switch "$count"
        case '' # no upstream
        case "0 0" # equal to upstream
            echo ''
        case "0 *" # ahead of upstream
            echo $TFC_GREEN_N' '$ahead
        case "* 0" # behind upstream
            echo $TFC_YELLOW_N' '$behind
        case '*' # diverged from upstream
            echo $TFC_RED_N''
    end
end

function fish_git_prompt
    if not command -sq git
        echo ''
        return
    end

    set -f git_info (command git rev-parse --is-inside-git-dir --is-bare-repository --is-inside-work-tree HEAD 2>/dev/null)
    if test -z "$git_info"
        echo ''
        return
    end

    set -f inside_gitdir $git_info[1]
    set -f bare_repo $git_info[2]
    set -f inside_workspace $git_info[3]
    set -f last_commit_id $git_info[4]

    if test $inside_gitdir = true; and test $bare_repo = false
        echo $TFC_YELLOW_B'   GIT_DIR'
        return
    end

    if test -z "$last_commit_id"; and test $bare_repo = false
        echo $TFC_RED_B'   INVALID'
        return
    end

    set -g TFC_GIT_PROMPT_LOCK
    # No longer inside git directory from here
    # Unless is a BARE repository
    set -f branch_info (___branch_info $bare_repo $last_commit_id)
    set -f branch_name $branch_info[1]
    set -f detached $branch_info[2]
    set -f worktree_prompt ''
    set -f relative_upstream ''

    if test "$TFC_GIT_STATUS" = true; and test "$inside_workspace" = true
        set worktree_prompt (___worktree_prompt)
    end

    if test -n "$worktree_prompt"; and test "$TFC_GIT_RELATIVE_COUNT" = true; and test "$detached" = false
        set relative_upstream (___relative_upstream)
        if test -n "$relative_upstream"
            set relative_upstream ' '$relative_upstream
        end
    end

    echo $branch_name$relative_upstream$worktree_prompt
    set -e TFC_GIT_PROMPT_LOCK
end
