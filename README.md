# MyConfig

## Create MyConfig from scratch

```bash
git init --bare $HOME/.myconfig
alias config="git --git-dir=$HOME/.myconfig/ --work-tree=$HOME"
config config status.showUntrackedFiles no
```

## Clone to new system

```bash
git clone --bare [repo-url] $HOME/.myconfig
alias config="git --git-dir=$HOME/.myconfig/ --work-tree=$HOME"
config checkout
```

## Checkout a branch

Run the `.initialize-myconfig.sh` script, passing in the branch name you wish to
checkout as the only argument.

```bash
./.initialize-myconfig.sh [branch-name]
```

If there are no conflicts, the branch will be checked-out.

If there are conflicts, the script will automatically move the conflicting
files into `$HOME/.myconfig-conflicts` and try the checkout again.  
You need to be careful not to run the script again until you've manually dealt
with the conflicting files, or you risk overwriting them.

Once the checkout is completed, `.initialize-myconfig.sh` will call the setup
script for the branch.

Each branch of the myconfig repository is expected to have a shell script called
`.setup-<branch>.sh` that will perform the activities required to set up the
system. This script is where you do things like setting up symbolic links,
creating directories, setting default fonts, editing the hosts file, etc.

## Creating a New Branch for a Different OS or System

1. Checkout the master branch.

    ```bash
    ./initialize-myconfig.sh master
    ```

2. Checkout your new branch

    ```bash
    config checkout -b <example-branch>
    ```

3. Create a `.setup-<branch>.sh` script for your new branch (it can be a
simple placeholder for now)

    ```bash
    #!/usr/bin/env bash

    echo "Setting up example-branch... This is a placeholder script!"
    ```

4. Add and commit the `.setup-<branch>.sh` script

    ```bash
    config add $HOME/.setup-example-branch.sh
    config commit -m "Create setup script."
    ```

5. Now you are free to add and commit whatever files you want!

    ```bash
    config add "$HOME/.bashrc" "$HOME/.bash_profile" "$HOME/.bash_aliases"
    config commit -m "bash: add config"
    config add "$HOME/.vimrc"
    config commit -m "vim: add config"
    ```
