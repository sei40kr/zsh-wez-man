WEZ_MAN_SPLIT_DIRECTION="${WEZMAN_SPLIT_DIRECTION:-right}"
WEZ_MAN_SPLIT_SIZE="${WEZMAN_SPLIT_SIZE:-30%}"

__wez_man() {
  local cmd=( ${=BUFFER} )
  local page="${cmd[1]}"
  local error

  if ! error="$(man -w "$page" 2>&1 1>/dev/null)"; then
    zle -M "$error"
    return 1
  fi

  local -a extra_args

  if [[ "$WEZ_MAN_SPLIT_DIRECTION" == (left|right|top|bottom) ]]; then
    extra_args+=( "--${WEZ_MAN_SPLIT_DIRECTION}" )
  fi

  if [[ "$WEZ_MAN_SPLIT_SIZE" == *% ]]; then
    extra_args+=( "--percent" "${WEZ_MAN_SPLIT_SIZE%%%}" )
  else
    extra_args+=( "--cells" "$WEZ_MAN_SPLIT_SIZE" )
  fi
  
  wezterm cli split-pane "${extra_args[@]}" man "$page"
}

zle -N __wez_man

bindkey '^[h' __wez_man
