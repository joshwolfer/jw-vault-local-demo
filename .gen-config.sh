while [ 1 ]; do
  export VAULT_TOKEN=`cat token-sink` 
  consul-template  \
        -vault-renew-token=false \
        -template "etc/config.php.tpl:etc/config.php"  \
        -once
  sleep 1
done

