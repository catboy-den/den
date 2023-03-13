# Unsealing
- `kubectl exec -n vault --stdin=true --tty=true vault-0 -- vault operator init`
- `kubectl exec -n vault --stdin=true --tty=true vault-0 -- vault operator unseal # ... Unseal Key #`, this needs to be done however many times the key threshold is