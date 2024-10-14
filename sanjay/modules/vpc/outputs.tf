# output "vpc_name" {
#   description = "The name of the VPC network"
#   value       = google_compute_network.vpc_network.name
# }

# output "subnet_names" {
#   description = "Names of the created subnets"
#   value       = [for subnet in google_compute_subnetwork.subnet : subnet.name]
# }
