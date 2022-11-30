terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.34.0"
    }
  }
}

provider "google" {
  credentials = file("cred.json")
  project = var.project
  region = var.region 
  zone = var.zone 
}

resource "google_compute_network" "vpc_network" {
  name = var.name_network
}


resource "random_string" "texto" {
  length = var.randomlength
  special = false
  upper = false
}
resource "google_storage_bucket" "mi_bucket" {
  name = "my_bucket${random_string.texto.result}"
  location = var.region
}

resource "google_compute_address" "ip_address" {
    name = var.static_ip

}

resource "google_compute_instance" "vm_name" {
    depends_on = [
      google_compute_network.vpc_network, google_compute_address.ip_address
    ]
    name = var.instance_name
    machine_type = var.machine_type
    tags = ["web", "dev", "ops"]

    boot_disk {
      initialize_params {
        image = "projects/ubuntu-os-cloud/global/images/ubuntu-1804-bionic-v20220824"
      }
    }
    network_interface {
        network = google_compute_network.vpc_network.name
        access_config {
            nat_ip = google_compute_address.ip_address.address
        }   
    }
}