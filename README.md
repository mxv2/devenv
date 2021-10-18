# devenv

### iterm2
```
cp ./iterm2/Profiles.json ~/Library/ApplicationSupport/iTerm2/DynamicProfiles/
```

### scripts
```
ln -s /Users/m.kiryanov/Codebase/Personal/devenv/scripts/git-tag-commit.sh ~/bin/git-tag-commit
chmod +x ~/bin/git-tag-commit

ln -s /Users/m.kiryanov/Codebase/Personal/devenv/scripts/ssh-add-keys.sh ~/bin/ssh-add-keys
chmod +x ~/bin/ssh-add-keys
ln -s /Users/m.kiryanov/Codebase/Personal/devenv/scripts/auto-add-key ~/bin/auto-add-key
chmod +x ~/bin/auto-add-key
```

### Pitfalls

* https://rabexc.org/posts/pitfalls-of-ssh-agents
