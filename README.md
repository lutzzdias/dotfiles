# MacOS Dotfiles

This repository aims to keep track of my .config folder for my M2 Macbook Air.
It contains most of the important configurations for my terminal applications,
my main goal with this config is to have a beautiful and functional terminal
environment.

In order for these configurations to work properly you should have a [NerdFont]
(https://www.nerdfonts.com) installed. I, personally, use the _JetBrainsMono
Nerd Font_. If you decide to use another you will have to specify it in some of
the config files.

<details> 
<summary style="font-weight: bold">Table of Contents</summary>

Each "section" contains a brief explanation of the app and the goals of the
config

<!-- start table of contents -->

* [btop](#btop)
* [git](#git)
* [lazygit](#lazygit)
* [nvim](#nvim)
* [starship](#starship)
* [tmux](#tmux)
* [wezterm](#wezterm)
* [zsh](#zsh)

<!-- end table of contents -->
</details>

## btop

This app is similar to the windows task manager. It keeps tracks of processes,
how much RAM each process uses, CPU usage, etc. You can also use it to terminate
a given process, just like in the task manager.

I have to admit that I added this config here intending to better tune it later
and ended up never messing with it. I do not use this app that often and the
defaults are pretty sane. I still plan on tinkering with it in the future
though.

## git

If you're here you obviously know what git is. It helps to keep track of changes
in files within a folder. This config simply specifies a few global settings for
ease of use. The main "customization" here is automatically setting up the
remote on git push.

## lazygit

Lazygit is the application I use in order to interact with git through neovim.
It is a TUI and it's really simple to use. The only configuration here is the
default editor, where I set it up to use nvim.

## nvim

NeoVim is my favourite editor. It is super fast, minimal and completely
customizable. However, it comes pretty barebones when you first install it. I
use a set of plugins in order to extend it's functionality and make it prettier.

This config is separated into what is `core`, i.e intrinsic to neovim config,
and what is `plugin` related, i.e plugin specific configurations. The whole
config is done in lua and I use `lazy.nvim` as the plugin manager.

Each plugin is specified in its own file, which makes it easier for addition,
removal and edition of plugins.

## starship

Starship is a custom cmd prompt written in rust. It is, also, highly
customizable and super fast. I've added my own icons in this config as well as
setting up a (relatively) minimal prompt.

## tmux

Tmux is a terminal multiplexer. This means that it can create multiple
terminals, divide them in panels, keep session info on exit, etc.

My config for tmux is basically editing the default keymaps and making it
prettier. Tmux, by default, has a green line in the bottom. However, since I use
lualine (within nvim) in the bottom of the screen, I've decided to move tmux's
to the top and also customize it in order to make it more minimal and pretty.

## wezterm

WezTerm is a terminal emulator written in rust. It is my favourite due to how
clean and simple the interface looks. It has a way of removing all of the UI and
by pressing _Ctrl + f_ you can achieve the fullscreen without removing the
background (which happens with the macOs default fullscreen).

## zsh

Zsh is the shell I use within the terminal. This will contain mostly paths,
aliases and a few other configs. I also kept a "pure" prompt, which is a pretty
and minimal prompt that does not use starship, in case someone wants to use it.
