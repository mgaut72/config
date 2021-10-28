# Config

Dotfiles and Other Configuration

## Clone / Init on New Machine

[Init Script Gist](https://gist.github.com/mgaut72/c03065e35e57db27bc676bb6d28db0a2)

```
curl -Lks https://git.io/mgaut72-config-clone | /bin/sh
```


Run `.cfg.bootstrap.sh` to install and instantiate templates


## `.local` files
Have non-generic stuff? don't put it in here.  Instead, source/reference a `.local` file from a file included here.
Ex:
`.zshrc`
```
# other zshrc stuff
# ...
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
```

## Auto-TMUX when SSHing onto a remote desktop
* My .zshrc is setup such that when I ssh onto a host with that zshrc, it starts up or resumes and existing tmux session: https://github.com/mgaut72/config/blob/c974d39cdbdb224eca0189c98f4ac49763642d3a/.zshrc#L149-L152
* I followed this blog: https://werat.dev/blog/happy-ssh-agent-forwarding/ to ensure that when I ssh and resume a tmux session, my ssh agent gets refreshed
  * https://github.com/mgaut72/config/blob/master/.zshrc#L145-L147
  * https://github.com/mgaut72/config/blob/master/.ssh/rc
  * https://github.com/mgaut72/config/blob/c974d39cdbdb224eca0189c98f4ac49763642d3a/.tmux.conf.local#L299-L303
* I personally use oh-my-tmux, which has some niceties built in, but this is not strictly necessary.

Now when I ssh onto my remote desktop, I resume any previous ssh session.  To sign off of my remote desktop for the day, I first DETACH FROM TMUX, then logout of the remote desktop.

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
