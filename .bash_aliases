alias config="git --git-dir=$HOME/.myconfig/ --work-tree=$HOME"
alias cf='clang-format'

alias q='exit'
alias c='clear'
alias h='history'
alias cs='clear;ls'
alias p='cat'
alias t='time'
alias k='kill'
alias null='/dev/null'


alias home='cd ~'
alias root='cd /'
alias dtop='cd ~/desktop'
alias o='xdg-open'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bashrc'
alias bashalias='vim ~/.bash_aliases'
alias bashprofile='vim ~/.bash_profile'
alias loadbash='source ~/.bashrc'

mkcdd() {
    mkdir -p $1 && cd $1
}

cpp() { 
    cd /home/gary/projects/cpp/$1
}

update() {
    echo "Starting update..."
    sudo apt update -qq
    sudo apt dist-upgrade -y
    sudo apt autoremove -y
    echo "Update complete!"
}

alias dcd='docker-compose down'
alias dcu='docker-compose up -d'
alias docker_clean_images='docker rmi $(docker images -a --filter=dangling=true -q)'
alias docker_clean_ps='docker rm $(docker ps --filter=status=exited --filter=status=created -q)'

docker-remove-cache() {
    docker kill $(docker ps -q)
    docker_clean_ps
    docker rmi $(docker images -a -q)
}
