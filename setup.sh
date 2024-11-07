#!/bin/zsh

###########
# Homebrew
###########
echo -e "-----\nCheck Homebrew"
if [ -f ~/.zshrc ]; then
    if [ "$(echo $PATH | grep '/opt/homebrew/bin')" ]; then
        echo '✅ Homebrew PATH already exist'
    else
        echo '🙅 Homebrew PATH was not exist\n...update .zshrc'
        echo 'export PATH=/opt/homebrew/bin:/usr/local/bin:$PATH' >>~/.zshrc
        source ~/.zshrc
    fi
else
    echo '🙅 .zshrc was not exist\n...update .zshrc'
    echo 'export PATH=/opt/homebrew/bin:/usr/local/bin:$PATH' >>~/.zshrc
    source ~/.zshrc
fi

if type "brew" >/dev/null 2>&1; then
    echo -e "✅ brew already exist"
else
    echo -e "🙅 Homebrew was not exist\nInstall Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    exit
fi

##########
# Ansible
##########
echo -e "-----\nCheck Ansible"
if type "ansible" >/dev/null 2>&1; then
    echo -e "✅ Ansible already exist"
else
    echo -e "🙅 ansible was not installed"
    brew install ansible
fi

##########
# Oh My ZSH
##########
echo -e "-----\nCheck Oh My ZSH"
if [ -f ~/.oh-my-zsh ]; then
    echo -e "✅ Oh My ZSH already exist"
else
    echo -e "🙅 Oh My ZSH was not exist\nInstall Oh My ZSH"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo -e "-----\nAnsible Deploy"
cd ~
curl -O -sfSL https://raw.githubusercontent.com/m2mt-l/mac_setup_personal/refs/heads/master/setup.yml

if [ -f ~/setup.yml ]; then
    ansible-playbook setup.yml -i hosts -v
    rm setup.yml
else
    echo -e "🙅 ansible-playbook was not downloaded"
fi
