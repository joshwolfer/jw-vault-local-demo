echo "Enabling database secrets engine"
vault secrets enable database

echo "Writing db1 DB secrets engine config"
mysqlpass=`cat .mysql-vault-passwd`
vault write database/config/db1 \
    plugin_name=mysql-database-plugin \
    connection_url="{{username}}:{{password}}@tcp(127.0.0.1:3306)/" \
    allowed_roles="db1-5s,db1-15s" \
    username="vault" \
    password="$mysqlpass"

echo "Writing DB1 5s engine role" 
vault write database/roles/db1-5s \
    db_name=db1 \
    creation_statements="CREATE USER '{{name}}'@'%' IDENTIFIED BY '{{password}}';GRANT ALL ON db1.* TO '{{name}}'@'%';" \
    default_ttl="5s" \
    max_ttl="5s"

echo "Writing DB1 15s engine role" 
vault write database/roles/db1-15s \
    db_name=db1 \
    creation_statements="CREATE USER '{{name}}'@'%' IDENTIFIED BY '{{password}}';GRANT ALL ON db1.* TO '{{name}}'@'%';" \
    default_ttl="15s" \
    max_ttl="15s"

