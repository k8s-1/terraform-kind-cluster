# Simple config for kindcluster + terraform

## Run
```
tf init
tf plan
tf apply
```

# Always separate cluster infra e.g. VM + network creation > cluster creation > cluster infra resources > other yaml (ideally use flux/argocd for this)
