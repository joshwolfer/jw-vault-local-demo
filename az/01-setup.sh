vault secrets enable azure

vault write azure/config \
subscription_id=$AZURE_SUBSCRIPTION_ID \
tenant_id=$AZURE_TENANT_ID \
client_id=$AZURE_CLIENT_ID \
client_secret=$AZURE_CLIENT_SECRET

vault write azure/roles/my-role ttl=20s azure_roles=-<<EOF
    [
        {
            "role_name": "Contributor",
            "scope":  "/subscriptions/${AZURE_SUBSCRIPTION_ID}/resourceGroups/vault-demo"
        }
    ]
EOF
