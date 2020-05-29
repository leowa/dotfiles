# Set up dev box by ansible

First install ansible by `pip`: `sudo pip install ansible`

Make sure to generate ssh-key by running `ssh-keygen`, and then add `rsa.pub` content to `~/.ssh/authorized_keys`

Then run playbook according to your dev box os: `ansible-playbook -i hosts <os>.yml`
