clear
echo "Criando Container Docker MySQL"
read -p "Press Enter to continue ..."

portaBanco="3311"
nomeContainer="contsmart"
nomeBanco="smart_sac"
senhaRootBanco="root"
userBanco="urubu100"
senhaUserBanco="urubu100"

docker run -d -p $portaBanco:3306 --name $nomeContainer -e "MYSQL_DATABASE=$nomeBanco" -e "MYSQL_ROOT_PASSWORD=$senhaRootBanco" -e "MYSQL_USER=$userBanco" -e "MYSQL_PASSWORD=$senhaUserBanco" mysql

echo "Aguarde 30 Segundos (Inicializando Container...)"
sleep 30
read -p "Press Enter to continue ..."

file_sql="file.sql"

docker exec -i $nomeContainer sh -c 'exec mysql -uroot -proot smart_sac' < "$file_sql"