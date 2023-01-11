# Dotfiles and Stuff

## Desktop Essential Applications

Follows a list of selected essentials mostly to improve desktop usability.

### Utilities

- wob: wayland overlay bar (volume/backlight/progress)
- amixer (alsa-utils package): control audio volume over command line
- brightnessctl: control display brightness over command line
- rofi: window switcher, application launcher, dmenu replacement
- waybar: hightly customizable wayland bar for sway

## Configurations

Most involved configurations are provided via configuration files maintained within this repo.

Simple tweaks are instead listed below.

### GTK Dark Theme

Enable dark theme for GTK applications.

File: `.config/gtk-{3,4}.0/settings.ini`

```
[Settings]
gtk-application-prefer-dark-theme=1
```
