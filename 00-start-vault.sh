pkill vault
sleep 0.2
export VAULT_LOG_FORMAT=json

nohup vault server -dev -dev-root-token-id=root \
    >log/vault.log 2>log/vault.err &

sleep 0.5

#egrep 'Root Token:' log/vault.log | cut -f3 -d' ' > .root-token

#vault login `egrep 'Root Token:' log/vault.log | cut -f3 -d' '`
vault login root

vault audit enable file file_path=log/audit

