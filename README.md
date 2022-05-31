# Script_Instalacao

# Inserir o comando abaixo para baixar o repositório de assistente de instalação.
cd / && git clone https://github.com/LeonardoSalomao/Script_Instalacao.git && cd /./Script_Instalacao/ && chmod +777 script-docker-mysql.sh && chmod +777 smartsac-assistente.sh && chmod +777 file.sql && chmod +777 testeProjeto.jar && ./smartsac-assistente.sh

# Remove todos os containers
docker rm $(docker ps -aq) -f

# Interage com o container via bash
docker exec -it contsmart bash

# Conecta com o mysql local
mysql -h localhost -uroot -proot smart_sac

# select dos registros
select * from log_registros;