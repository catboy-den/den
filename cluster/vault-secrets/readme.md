# Unsealing
- `kubectl exec --stdin=true --tty=true vault-0 -- vault operator init`
- `kubectl exec --stdin=true --tty=true vault-0 -- vault operator unseal # ... Unseal Key`