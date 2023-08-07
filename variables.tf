variable "chrome_enrollment_token" {
  type        = string
  description = "Chrome Enterprise enrollment token"
}

variable "gcp_service_list" {
  description = "The list of apis necessary for the project"
  type        = list(string)
  default = [
    "cloudresourcemanager.googleapis.com",
    "compute.googleapis.com",
    "iam.googleapis.com"
  ]
}

variable "project_id" {
  type        = string
  description = "Project to deploy resources within"
}

variable "region" {
  type        = string
  description = "Default region to use for resources"
  default     = "us-central1"
}

variable "vm_user_name" {
  type        = string
  description = "User name to use for VM connectivity"
  default     = "bce_demo"
}

variable "zone" {
  type        = string
  description = "Default zone to use for resources"
  default     = "us-central1-b"
}

