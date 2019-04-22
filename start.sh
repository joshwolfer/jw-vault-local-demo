

export VAULT_ADDR=http://127.0.0.1:8200

unset VAULT_TOKEN
rm ~/.vault-token 2>/dev/null
. .env 2>/dev/null

./00-start-vault.sh
./01-mysql-db-setup.sh
./02-setup-seceng.sh
./03-create-policy.sh
./04-setup-approle.sh
./namespace-setup.sh
./kv/kv-put.sh

#clear

#./05-start-agent.sh

