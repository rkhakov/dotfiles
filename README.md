<div align="center">

# Dotfiles :house:</span>

<span style="font-size: 0.9em;">__Always WIP__ &nbsp; :sparkles:</span>

</div>

## 📌 &nbsp; Overview
This repository contains all my dotfiles managed by [chezmoi](https://github.com/twpayne/chezmoi/)


## 🚀 &nbsp; Install

1. Install chezmoi
    ```shell
    sh -c "$(curl -fsLS chezmoi.io/get)" -- -b $HOME/.local/bin
    ```
1. Clone dotfiles
    ```shell
    chezmoi init git@github.com:rkhakov/dotfiles.git
    ```
1. Apply
    ```shell
    chezmoi apply
    ```

Also you can do this with one line
```shell
chezmoi init --apply https://github.com/rkhakov/dotfiles.git
```

## 📦 &nbsp; Dependencies

## 📜 &nbsp; Cheatsheet
