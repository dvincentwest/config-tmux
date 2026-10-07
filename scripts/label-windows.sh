#!/usr/bin/env bash
names=(editor git claude)
i=0
for name in "${names[@]}"; do
  if tmux list-windows -F '#{window_index}' | grep -qx "$i"; then
    tmux rename-window -t "$i" "$name"
  else
    tmux new-window -t "$i" -n "$name"
  fi
  ((i++))
done
