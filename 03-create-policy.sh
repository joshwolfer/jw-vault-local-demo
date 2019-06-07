echo "Writing db1 policy"

vault policy write db1 -<<EOF
path "database/creds/db1-5s" {
  capabilities = ["read"]
}
path "database/creds/db1-15s" {
  capabilities = ["read"]
}
EOF

