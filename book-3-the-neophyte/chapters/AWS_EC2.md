# AWS

## Install Pyenv on OSX

> **Prerequisite:** For pyenv to install correctly, you need the Xcode command line tools. Type this command into your terminal and wait. `xcode-select --install`

If you don't, do it now. Then run these commands in order.

```bash
brew install pyenv
```

Open your `~/.zshrc` file and put the following instructions at the end.

```sh
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
```

Then reload the zsh initialization file.

```sh
source ~/.zshrc
```

Now install a new version of Python.

```sh
pyenv install 3.6.4
```

Once that is installed, make it the global, system version

```sh
pyenv global 3.6.4
```

Now, when you check the version of Python with the command below, it should return 3.6.4.

```
python --version
```

## Create IAM Access Key

1. Open the [IAM console](https://console.aws.amazon.com/iam/home?#home).
1. In the navigation pane of the console, choose Users.
1. Choose your IAM user name (not the check box).
1. In the **Select AWS access type** section, check the `Programmatic access` checkbox.

The next step is setting up permissions. Since this is your first visit the AWS, you will create a new group.

1. Click the _Create group_ button
1. Enter `administrators` in the _Group name_ field
1. Check the `AdministratorAccess` checkbox in the _Policy name_ column below it.
1. Click the _Create group_ button at the bottom.

Once you create the group, it's time to assign your user to the group

1. Make sure the group you just created is checked.
1. Click the _Next: Review_ button at the bottom.
1. Click the _Create user_ button.


1. To see the new access key, choose Show. Your credentials will look something like this:

    >    Access key ID: AKIAIOSFODNN7EXAMPLE
    >
    >    Secret access key: wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY

1. To download the key pair, choose Download .csv file. Store the keys in a secure location.

Keep the keys confidential in order to protect your AWS account, and never email them. Do not share them outside your organization, even if an inquiry appears to come from AWS or Amazon.com. No one who legitimately represents Amazon will ever ask you for your secret key.

## Install AWS client

```sh
pip install awscli --upgrade --user
```

Once installed, you need to add the installation location to your system path. Open your `~/.zshrc` file and add the following instruction at the bottom.

```sh
export PATH=$PATH:$HOME/.local/bin
```

Then reload the zsh initialization file.

```sh
source ~/.zshrc
```


## Configure AWS Client with Access Key

```sh
aws configure

# Then fill in the prompts when they appear
AWS Access Key ID [None]: ENTER_YOURS_HERE
AWS Secret Access Key [None]: ENTER_YOURS_HERE
Default region name [None]: us-east-1
Default output format [None]: text
```

## Generate PEM File

1. Click _Services_ and choose _EC2_
1. Click _Key Pairs_ link
1. Click _Create Key Pair_ button
1. Provide any label you want in the input box. (e.g. `stevebrownlee`)
1. Click _Create_

At this point, your browser will download a file. Move this file somewhere besides your download directory. I recommend a new directory in your home directory named `.keys`.

```sh
cd
mkdir .keys
mv ~/Downloads/thefilename.pem .
```

> **Security Note:** This is the secure key that you will use to connect to your remote servers. Do everything in your power to never, ever, ever, ever, delete this file.

## Start Instance

## Enable Public DNS with VPC Settings

1. Go to VPC section
1. Click on VPC link
1. Select item there
1. Click Actions
1. Choose `Edit DNS Hostnames`
1. Activate `Yes`

## Gather Connection Info

1. Go back to EC2.
1. Click on instance you started.
1. Looks in the details panel beneath it and you'll see the public DNS for your instance.

## Connect to VPS

1. Click all buttons launch an instance.
1. _Choose an existing key pair_
1. Make sure the keypair you just created is selected
1. Check the _"I acknowledge that..."_ checkbox.
1. Click _Launch instance_ button

You will see a message that it is now launching

> The following instance launches have been initiated: i-022031a33a72929e9

1. Click the link of the instance id.
1. Check the box next to your instance.
1. Click the _Connect_ button at the top.
1. Copy the connection command near the bottom. It looks like this.
    > ssh -i "keyname.pem" ubuntu@ec2-00-000-00-000.compute-1.amazonaws.com
1. Make sure you are in the directory that contains the `.pem` file. If you followed these instructions to the letter, `cd ~/.keys`.
1. Paste the connection command into your terminal

You should, finally, be connected to your VPS.
