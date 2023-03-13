TODO
- Move to a config map or something for static clients for dex, who cares about the secret
- Move to kustomize based stuff instead, make dex a kustomize so that it can be depended on by weave for example, weave needs to depend on dex
  - apparently you can just depend on the yaml file with dependsOn
- Create proper user and admin roles for weave gitops / the infra
- finally we need to add grafana/promo back
```
rules:
  # Flux Resources
  - apiGroups: ["source.toolkit.fluxcd.io"]
    resources: [ "buckets", "helmcharts", "gitrepositories", "helmrepositories", "ocirepositories" ]
    verbs: [ "get", "list", "watch", "patch" ]

  - apiGroups: ["kustomize.toolkit.fluxcd.io"]
    resources: [ "kustomizations" ]
    verbs: [ "get", "list", "watch", "patch" ]

  - apiGroups: ["helm.toolkit.fluxcd.io"]
    resources: [ "helmreleases" ]
    verbs: [ "get", "list", "watch", "patch" ]

  - apiGroups: [ "notification.toolkit.fluxcd.io" ]
    resources: [ "providers", "alerts" ]
    verbs: [ "get", "list", "watch", "patch" ]

  - apiGroups: ["infra.contrib.fluxcd.io"]
    resources: ["terraforms"]
    verbs: [ "get", "list", "watch", "patch" ]

  # Read access for all other Kubernetes objects
  - apiGroups: ["*"]
    resources: ["*"]
    verbs: [ "get", "list", "watch" ]
```