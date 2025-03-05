# Simple config for kindcluster + terraform

## Run
```
./wrapper.sh apply
```

## Test
```
./test.sh
```

# Always separate cluster infra e.g. VM + network creation > cluster creation > cluster infra resources > other yaml (ideally use flux/argocd for this)

