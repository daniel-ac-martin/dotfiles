function fish_prompt --description 'Write out the prompt'
  # Save the return status of the previous command
  set last_status $status

  # Just calculate these once, to save a few cycles when displaying the prompt
  if not set -q __fish_prompt_hostname
    set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
  end

  if not set -q __fish_bgstyle_statusline
    set -g __fish_bgstyle_statusline (set_color -b "#111111")
  end
  if not set -q __fish_bgstyle_normal
    set -g __fish_bgstyle_normal (set_color -b normal)
  end

  if not set -q __fish_style_statusline
    set -g __fish_style_statusline (set_color normal -b "#111111")
  end
  if not set -q __fish_style_normal
    set -g __fish_style_normal (set_color normal)
  end
  if not set -q __fish_style_user
    set -g __fish_style_user (set_color cyan)
  end
  if not set -q __fish_style_hostname
    set -g __fish_style_hostname (set_color blue)
  end
  if not set -q __fish_style_cwd
    switch $USER
      case root toor
        if set -q fish_color_cwd_root
          set -g __fish_style_cwd (set_color $fish_color_cwd_root)
        else
          set -g __fish_style_cwd (set_color $fish_color_cwd)
        end
      case '*'
        set -g __fish_style_cwd (set_color $fish_color_cwd)
    end
  end
  if not set -q __fish_style_suffix
    set -g __fish_style_suffix (set_color -o brgrey)
  end

  if not set -q __fish_git_prompt_show_informative_status
    set -g __fish_git_prompt_show_informative_status 1
  end
  if not set -q __fish_git_prompt_hide_untrackedfiles
    set -g __fish_git_prompt_hide_untrackedfiles 1
  end
  if not set -q __fish_git_prompt_showupstream
    set -g __fish_git_prompt_showupstream "informative"
  end

  if not set -q __fish_git_prompt_char_upstream_ahead
    set -g __fish_git_prompt_char_upstream_ahead "↑"
  end
  if not set -q __fish_git_prompt_char_upstream_behind
    set -g __fish_git_prompt_char_upstream_behind "↓"
  end
  if not set -q __fish_git_prompt_char_upstream_prefix
    set -g __fish_git_prompt_char_upstream_prefix ""
  end
  if not set -q __fish_git_prompt_char_stagedstate
    set -g __fish_git_prompt_char_stagedstate "●"
  end
  if not set -q __fish_git_prompt_char_dirtystate
    set -g __fish_git_prompt_char_dirtystate "✚"
  end
  if not set -q __fish_git_prompt_char_untrackedfiles
    set -g __fish_git_prompt_char_untrackedfiles "…"
  end
  if not set -q __fish_git_prompt_char_conflictedstate
    set -g __fish_git_prompt_char_conflictedstate "✖"
  end
  if not set -q __fish_git_prompt_char_cleanstate
    set -g __fish_git_prompt_char_cleanstate "✔"
  end

  if not set -q __fish_git_prompt_color_branch
    #set -g __fish_git_prompt_color_branch magenta --bold
    set -g __fish_git_prompt_color_branch magenta
  end
  if not set -q __fish_git_prompt_color_dirtystate
    set -g __fish_git_prompt_color_dirtystate blue
  end
  if not set -q __fish_git_prompt_color_stagedstate
    set -g __fish_git_prompt_color_stagedstate yellow
  end
  if not set -q __fish_git_prompt_color_invalidstate
    set -g __fish_git_prompt_color_invalidstate red
  end
  if not set -q __fish_git_prompt_color_untrackedfiles
    set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
  end
  if not set -q __fish_git_prompt_color_cleanstate
    set -g __fish_git_prompt_color_cleanstate green --bold
  end

  if not set -q __fish_prompt_status_good
    set __fish_prompt_status_good (set_color -o green)🗸$__fish_style_statusline
  end
  if not set -q __fish_prompt_status_bad
    set __fish_prompt_status_bad (set_color -o red)✘$__fish_style_statusline
  end

  # Set the color for the status depending on the value
  set stat $__fish_prompt_status_good
  if test $last_status -gt 0
    set stat $__fish_prompt_status_bad
  end

  switch $USER
    case root toor
      set suffix '#'
    case '*'
      set suffix '$'
  end

  set vcs (__fish_vcs_prompt)"$__fish_style_statusline"

  printf '%s%s [%s] %s%s%s@%s%s%s:%s%s%s%s \x1B[K\f\r%s%s%s %s' "$__fish_bgstyle_statusline" "$stat" (date "+%H:%M:%S") "$__fish_style_user" $USER "$__fish_style_statusline" "$__fish_style_hostname" $__fish_prompt_hostname "$__fish_style_statusline" "$__fish_style_cwd" (prompt_pwd) "$__fish_style_statusline" "$vcs" "$__fish_bgstyle_normal" "$__fish_style_suffix" "$suffix" "$__fish_style_normal"
end
