# Set up dev box by ansible

## Pre-ansible

### Ubuntu
```bash
# if ssh key is not generated locally, run `ssh-keygen` first
# then add local pub key to authorized_keys
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

# install an virtualenv
sudo apt install python3-venv
[ -d ~/dev/py3 ] || mkdir -p ~/dev/py3
source ~/dev/py3/bin/activate
pip install ansible

# test connection against target machine remotely
ansible -i hosts ubuntu -m ping

# or test against localhost
# NOTE: Using --connection=local tells Ansible to not attempt to run the commands over SSH
ansible -i hosts --connection=local local -m ping

# gather facts
# NOTE: run `ansible-doc --list` to look up available modules
ansible -i hosts ubuntu -m gather_facts
```

# provision

Then run playbook according to your dev box os locally: `ansible-playbook --connection=local -v  <os>.yml -K`, or remotely like this: `ansible-playbook -i hosts <os>.yml -K`
NOTE: `-K` option is to allow prompt for sudo password

