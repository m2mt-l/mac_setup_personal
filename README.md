```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# https://brew.sh
git clone https://github.com/m2mt-l/mac_setup_personal.git
brew install ansible
ansible-playbook setup.yml -i hosts -v
# Only check
ansible-playbook setup.yml -i hosts -v --check
```
