# Create a Pod in the Kind cluster
resource "kubernetes_manifest" "test" {
  manifest = yamldecode(<<-EOT
  apiVersion: v1
  kind: Pod
  metadata:
    name: example-pod2
  spec:
    container:
      name: nginx
      image: nginx-latest
      port:
        container_port: 80
  EOT
  )
}
