provider "kubernetes" {
  config_path = "../cluster/test-cluster-config"
}

# Create a Pod in the Kind cluster
resource "kubernetes_manifest" "test" {
  manifest = yamldecode(<<-EOT
  apiVersion: v1
  kind: Pod
  metadata:
    name: example-pod2
    namespace: default
  spec:
    containers:
    - image: nginx:latest
      name: example-pod2
      ports:
      - containerPort: 80
      resources: {}
    dnsPolicy: ClusterFirst
    restartPolicy: Always
  EOT
  )
}
