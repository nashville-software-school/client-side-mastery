# Create SSH key
PUBLIC_KEY=$HOME/.ssh/id_nss.pub
if [ ! -f "$PUBLIC_KEY" ]; then
  echo -e "\n\nGenerating an SSH key so you can backup your code to Github..."
  echo "yes" | ssh-keygen -t rsa -f ~/.ssh/id_nss -N "" -b 4096 -C $emailAddress
  eval `ssh-agent`
  ssh-add ~/.ssh/id_nss
  echo -e "Host *\n\tAddKeysToAgent yes\n\tIdentityFile ~/.ssh/id_nss" >> ~/.ssh/config
fi

# Add SSH key to Github account
echo -e "\n\nAdding your SSH key to your Github account..."
PUBLIC_KEY_CONTENT=$(cat $PUBLIC_KEY)
curl \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $githubPassword"\
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/user/keys \
  -d '{"key":"$PUBLIC_KEY_CONTENT","title":"NSS Automated Key"}'

# User settings for git
git config --global user.name "$studentName"
git config --global user.email $emailAddress

