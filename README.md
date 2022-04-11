# My config files

## Getting started
1. Clone the repo
    ```bash
    git clone git@github.com:rkhakov/dotfiles.git
    ```
1. CD into dotfiles and Make symlinks
    ```bash
    > cd dotfiles
    > ./install # This command will delete existing configs
    ```
1. Install [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
    ```bash
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ```
1. Install [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
    ```bash
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    ```
1. Install [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
    ```bash
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    ```
1. Symlink fonts
    ```bash
    ln -sf ~/dotfiles/local/fonts $HOME/.local/share/fonts
    fc-cache
    ```
1. Copy binaries
    ```bash
    sudo cp ~/dotfiles/local/bin/i3exit /usr/local/bin/
    sudo cp ~/dotfiles/local/bin/blurlock /usr/local/bin/
    # i3wm does't recognize binaries from .local/bin
    ```

## TODO
* Automate installation
