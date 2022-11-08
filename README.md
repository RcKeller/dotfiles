Uses [oh-my-zsh](https://ohmyz.sh/) with [Antigen](https://github.com/zsh-users/antigen) to manage dependencies and themes.

### Installation

1. Clone the repo to `~/dotfiles`:
2. Run `install.sh`. This will symlink configs and .zshrc, overwriting anything you already have.
3. Open a new terminal, or `exec zsh`. Antigen bundles will be installed and you should be ready to go.

### Update

If you've made your own copy, you can still pull updates from the main repo by creating an `upstream` origin.

```
git remote add upstream https://github.com/Rckeller/dotfiles
```

Updating your copy can be done with:

```
git pull upstream main --rebase
```

### Customization

The `core` directory contains the framework scripts. Don't alter these unless you want to leave the upgrade path and
do your own thing.

The `personal` directory is where all of your customizations should go. The main repo will not alter these significantly,
so you should be able to easily resolve any merge conflicts during an update.

#### Available customizations

Files are listed in the order they are loaded. Conflicts between files, such as
environment variable definitions, will be resolved by "last definition wins".

Load order can be seen in `.zshrc`.

- `environment.zsh`: Define any environment variables you always want.
- `macos.zsh`: Customizations that should only be run on MacOS.
- `antigen_bundles.zsh`: Define additional zsh plugins to include. Your theme selection should be set here as well (default is Powerlevel10k).
  - .p10k.zsh - config for Powerlevel10K themes
- `dircolors`: Define a custom dircolors file. Optional, falls back to system default.
- `custom.zsh`: Customizations that should apply everywhere. This is the LAST file
  loaded, so any conflicting changes made here will override any previous files.

#### Custom install

`personal/install.sh` is a special case. It is run as part of the `install.sh` script, and should be where you put
any customizations around initial setup and installation. For example, if you want to symlink a config from `personal`
into your home directory, that's where you'd run that command.
