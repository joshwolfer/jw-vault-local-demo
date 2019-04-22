vault secrets enable gcp
vault write gcp/config credentials=@.gcp-vault-demo-235001-7f2caf55d1b5.json \
    ttl=30 max_ttl=7200

vault write gcp/roleset/my-key-roleset \
    project="gcp-vault-demo" \
    secret_type="service_account_key"  \
    bindings=-<<EOF
      resource "//cloudresourcemanager.googleapis.com/projects/gcp-vault-demo" {
        roles = ["roles/viewer"]
      }
EOF
