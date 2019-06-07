#!/usr/bin/env bash

osascript <<OSA
tell application "iTerm2"
  set newWindow to (create window with default profile)
  tell current session of newWindow
    write text "brew upgrade && echo 'Done! Closing in 5 seconds...' && sleep 5 && exit 0"
  end tell
end tell
OSA
