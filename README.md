# Dotfiles and Stuff

Most applications are configured via the files maintained within this repo.

Simple tweaks are instead listed below.

### GTK Dark Theme

Enable dark theme for GTK applications.

File: `.config/gtk-{3,4}.0/settings.ini`

```
[Settings]
gtk-application-prefer-dark-theme=1
```

### Firefox

Disable `quit` shortcut
- open `about:config`
- search for `quitShortcut.disabled`
- set it to `true`
