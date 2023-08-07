
output "managed_vm_info" {
  value = "IP: ${google_compute_instance.managed_vm.network_interface.0.access_config.0.nat_ip} Password: ${nonsensitive(random_password.password.result)}"
}

output "unmanaged_vm_info" {
  value = "IP: ${google_compute_instance.unmanaged_vm.network_interface.0.access_config.0.nat_ip} Password: ${nonsensitive(random_password.password.result)}"
}