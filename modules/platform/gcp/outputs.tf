output cluster_ca_cert {
  value = base64decode(google_container_cluster.primary.master_auth.0.cluster_ca_certificate)
}

output master_endpoint {
  value = "https://${google_container_cluster.primary.private_cluster_config.0.private_endpoint}"
}