# Script_Instalacao

cd / && git clone https://github.com/LeonardoSalomao/Script_Instalacao.git

chmod +777 script-docker-mysql.sh && chmod +777 script.sh && chmod +777 script.sql && chmod +777 testeProjeto.jar

docker rm $(docker ps -aq) -f