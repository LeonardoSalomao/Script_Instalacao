#!/bin/bash

x="teste"

menu() {
    while true $x != "teste"; do
        clear
        echo
        echo "          SMART-SAC INSTALACAO / MENU DE USO"
        echo
        # echo "                 1 - INICIAR Smart Sac CLI"
        echo "                 1 - INICIAR Smart Sac GUI"
        echo
        echo "    --------------------------------------------------"
        echo
        echo "          instalar - Instalar Smart Sac"
        echo "    iniciar-docker - Iniciar Containers Docker"
        echo "    remover-docker - Remover todos os Containers"
        echo "      it-container - Interagir com Container(Docker)"
        echo
        echo "    --------------------------------------------------"
        echo
        echo "             sair  -  Sair do assistente"
        echo
        echo
        echo "Digite uma opcao:"
        read x

        sleep 1

        case "$x" in

        1) # INICIA O DOCKER
            clear
            cd /./Script_Instalacao/
            echo "       INICIANDO SMART-SAC..."
            clear
            echo
            echo " ESTE É APENAS UM CONSOLE PARA VISUALIZAR OS REGISTROS"
            echo
            java -jar testeProjeto.jar
            sleep 5
            clear
            echo
            echo "         FECHANDO GUI SMART SAC"
            echo "        VOLTANDO PARA MENU ASSISTENTE..."
            sleep 5
            ;;
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
        iniciar-docker) # INICIA O DOCKER
            clear
            cd /./Script_Instalacao/
            source ./script-docker-mysql.sh
            sleep 3
            clear
            echo
            echo "       DOCKER INICIADO COM SUCESSO"
            echo "        VOLTANDO PARA MENU ASSISTENTE..."
            sleep 3
            ;;
        remover-docker) # REMOVER CONTAINERS
            clear
            docker rm $(docker ps -aq) -f
            echo
            echo "    CONTAINERS REMOVIDOS COM SUCESSO"
            echo "        VOLTANDO PARA ASSISTENTE..."
            sleep 3
            ;;
        it-container) # INTERAGIR COM MYSQL BASH
            clear
            echo
            echo "    COMEÇANDO A INTERAGIR COM MYSQL - DOCKER"
            sleep 3
            docker exec -it contsmart bash
            echo
            echo "    SAINDO DO MYSQL - DOCKER E VOLTANDO PARA MENU ASSISTENTE"
            sleep 3
            ;;
        sair) # SAIR
            clear
            echo
            echo "    OBRIGADO POR UTILIZAR SMART SAC"
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
