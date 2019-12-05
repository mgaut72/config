# Config

Dotfiles and Other Configuration

## Clone / Init on New Machine

[Init Script Gist](https://gist.github.com/mgaut72/c03065e35e57db27bc676bb6d28db0a2)


```
curl -Lks https://git.io/mgaut72-config-clone | /bin/sh
```

## `.local` files
Have non-generic stuff? don't put it in here.  Instead, source/reference a `.local` file from a file included here.
Ex:
`.zshrc`
```
# other zshrc stuff
# ...
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
```

## Env Config Inspiration

Check means implemented, unchecked is potential stuff to try

- [ ] [base16 color themes](http://chriskempson.com/projects/base16/)
- [x] [This Repo's Methodology](https://www.atlassian.com/git/tutorials/dotfiles)
- [x] [Github URL Shortener](https://github.blog/2011-11-10-git-io-github-url-shortener/)
- [x] [Vim + FZF + RipGrep](https://medium.com/@sidneyliebrand/how-fzf-and-ripgrep-improved-my-workflow-61c7ca212861)
- [ ] https://www.wezm.net/technical/2019/10/useful-command-line-tools/
- [ ] https://github.com/gpakosz/.tmux or some other nice tmux config?
- [ ] [jq](https://stedolan.github.io/jq/) / [jq cookbook](https://github.com/stedolan/jq/wiki/Cookbook#list-keys-used-in-any-object-in-a-list)
- [ ] [py env](https://github.com/pyenv/pyenv/) - not yet automated into this repo
