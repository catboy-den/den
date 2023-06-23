# Unsealing

- `kubectl exec -n vault --stdin=true --tty=true vault-0 -- vault operator init`
- `kubectl exec -n vault --stdin=true --tty=true vault-0 -- vault operator unseal # ... Unseal Key #`, this needs to be done however many times the key threshold is

Example: `cat github-oauth.yaml | kubeseal --scope cluster-wide --format yaml > github-oauth-sealed.yaml`

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: github-oauth
  namespace: kube-system
  annotations:
  sealedsecrets.bitnami.com/cluster-wide: "true"
stringData:
  client-id:
  client-secret:
type: Opaque
```
