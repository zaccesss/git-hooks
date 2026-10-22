# the pre-commit hook stopping a commit that stages the example access key from AWS's own
# documentation, never a real one. Run through record.sh, which adds the theme.
Hide
Type "clear; exec /tmp/demo/start"
Enter
Sleep 4s
Type "cd ../hook-demo"
Enter
Sleep 1s
Ctrl+L
Sleep 500ms
Show
Sleep 1s
Type "git status --short"
Sleep 400ms
Enter
Sleep 1.5s
Type "cat config.env"
Sleep 400ms
Enter
Sleep 1.5s
Type "git commit -m 'feat: add config'"
Sleep 400ms
Enter
Sleep 3s
Screenshot "/tmp/demo/shots/git-hooks.png"
Sleep 1s
