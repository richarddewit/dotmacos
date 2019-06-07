#!/usr/bin/env bash

app="Homebrew"
message="No updates available"
execute=""

brew="/usr/local/bin/brew"
notifier="/usr/local/bin/terminal-notifier"

outdated="$($brew outdated | wc -l | sed 's/[^0-9]//g')"

if [ "$outdated" != "0" ]; then
  submessage="are ${outdated} outdated formulae"
  if [ "$outdated" == "1" ]; then
    submessage="is ${outdated} outdated formula"
  fi
  echo "$submessage"
  message="$(printf "There %s ready to update. \nClick this banner to start upgrading." "$submessage")"
  execute="~/bin/iterm-brew-upgrade.sh"
fi

$notifier \
  -title "$app" \
  -message "$message" \
  -appIcon "https://brew.sh/assets/img/homebrew-256x256.png" \
  -group "$app" \
  -remove "$app" \
  -execute "$execute"
