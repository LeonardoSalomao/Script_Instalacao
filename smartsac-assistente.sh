#!/bin/bash

x="teste"

menu() {
    while true $x != "teste"; do
        clear
        echo
        echo "          SMART-SAC INSTALACAO / MENU DE USO"
        echo
        # echo "                 1 - INICIAR Smart Sac CLI"
        echo "                 2 - INICIAR Smart Sac GUI"
        echo
        echo "             exit  -  Sair do assistente"
        echo
        echo "    ------------------------------------------------"
        echo "          instalar - Inatalar Smart Sac"
        echo "      start-docker - Iniciar Containers Docker"
        echo "         rm-docker - Remover todos os Containers"
        echo "          instalar - Instalar Smart-Sac Completo"
        echo "      start-docker - Iniciar Docker Completo"
        echo
        echo "Digite uma opcao:"
        read x

        sleep 1

        case "$x" in
        instalar) # INSTALAÇÃO
            clear
            echo "Atualizando pacotes do sistema(1/4)"
            sleep 3
            sudo apt update && sudo apt upgrade -y

            sudo apt install zip -y

            curl -s "https://get.sdkman.io" | bash

            source "/home/$USER/.sdkman/bin/sdkman-init.sh"
            clear
            echo "Instalando java(2/4)"
            sleep 3
            sudo apt install openjdk-11-jre -y

            sudo apt update && sudo apt upgrade -y
            clear
            echo "Instalando docker(3/4)"
            sleep 3
            sudo apt install docker.io -y

            sudo apt install docker-compose -y

            sudo apt-get install \
                ca-certificates \
                curl \
                gnupg \
                lsb-release -y

            curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

            echo \
                "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
             $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

            sudo apt-get update

            sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

            sudo apt-get update

            sudo systemctl enable docker

            clear

            echo "Fazendo download do software smart-sac(4/4)"
            sleep 3

            clear
            echo "Instalação efetuada com sucesso!"
            read -p "Pressione Enter para continuar"
            ;;
        start-docker) # INICIA O DOCKER
            clear
            cd /./Script_Instalacao/
            source ./script-docker-mysql.sh
            sleep 5
            clear
            echo
            echo "       DOCKER INICIADO COM SUCESSO"
            echo "        VOLTANDO PARA ASSISTENTE..."
            sleep 5
            ;;
        rm-docker) # REMOVER CONTAINERS
            clear
            docker rm $(docker ps -aq) -f
            echo
            echo "    CONTAINERS REMOVIDOS COM SUCESSO"
            echo "        VOLTANDO PARA ASSISTENTE..."
            sleep 5
            ;;
        start-mysql) # INTERAGIR COM MYSQL BASH
            clear
            echo
            echo "    COMEÇANDO A INTERAGIR COM MYSQL - DOCKER"
            sleep 5
            mysql -h localhost -uroot -proot smart_sac
            echo
            echo "    SAINDO DO MYSQL E VOLTANDO PARA ASSISTENTE"
            sleep 5
            ;;
        exit) # SAIR
            clear
            exit 0
            ;;
        *)
            clear
            echo
            echo "   ERRO - OPCAO INVALIDA"
            sleep 3
            ;;
        esac
    done
    menu
}
menu
