# Check for appropriate APIs enabled
resource "google_project_service" "gcp_services" {
  for_each           = toset(var.gcp_service_list)
  service            = each.key
  disable_on_destroy = false
}

# Create blank service account
resource "google_service_account" "compute_sa" {
  account_id   = "bce-demo-compute-sa"
  display_name = "BCE Demo Compute SA"
  depends_on   = [google_project_service.gcp_services]
}

# Create Network
resource "google_compute_network" "bce-demo-network" {
  name                    = "bce-demo-network"
  auto_create_subnetworks = true
  routing_mode            = "GLOBAL"
  depends_on              = [google_project_service.gcp_services]
}

# Create Firewall Rules
resource "google_compute_firewall" "allow-rdp" {
  name    = "test-firewall"
  network = google_compute_network.bce-demo-network.name

  direction = "INGRESS"
  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }
  source_ranges = ["0.0.0.0/0"]
  depends_on    = [google_compute_network.bce-demo-network]
}

# Create Managed VM 
resource "google_compute_instance" "managed_vm" {
  name         = "managed-vm"
  machine_type = "e2-medium"

  boot_disk {
    initialize_params {
      image = "windows-2022"
    }
  }

  network_interface {
    network = google_compute_network.bce-demo-network.name
    access_config {
      // Ephemeral Public IP
    }
  }

  metadata = {
    sysprep-specialize-script-ps1 = templatefile("${path.module}/helpers/managed-vm.tftpl", { cmet = var.chrome_enrollment_token, tf_password = random_password.password.result, username = var.vm_user_name })
  }

  service_account {
    email  = google_service_account.compute_sa.email
    scopes = ["cloud-platform"]
  }

}

# Create Unmanaged VM
resource "google_compute_instance" "unmanaged_vm" {
  name         = "unmanaged-vm"
  machine_type = "e2-medium"

  boot_disk {
    initialize_params {
      image = "windows-2022"
    }
  }

  network_interface {
    network = google_compute_network.bce-demo-network.name
    access_config {
      // Ephemeral Public IP
    }
  }

  metadata = {
    sysprep-specialize-script-ps1 = templatefile("${path.module}/helpers/managed-vm.tftpl", { cmet = "", tf_password = random_password.password.result, username = var.vm_user_name })
  }

  service_account {
    email  = google_service_account.compute_sa.email
    scopes = ["cloud-platform"]
  }

}