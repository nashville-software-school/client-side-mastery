# Setting Up Your Workspace

By default, you will all use `~/workspace` as your working directory. However, some of you may want to put this folder in another location. Here is how you do that.

Let's say you want to keep your workspace under `~/nss/workspace`.
```
mkdir -p ~/nss/workspace
echo "export NSS_WORKSPACE=~/nss/workspace" >> ~/.bash_env
echo "export BASH_ENV=~/.bash_env" >> ~/.bashrc
```
