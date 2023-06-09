variable "vm_suffixes" {
  default     = ["-gitlub-runner-01","-gitlab-runner-02","-gitlab-runner-03","-gitlab-runner-04"]
  type        = list
  description = "List of VMs suffix-names"
}

variable "instance_name" {
  default     = "std-014-40"
  type        = string
  description = "Instance name"
  nullable    = false
}

variable "vm_type" {
  default     = "standard-v1"
  type        = string
  description = "Gitlab Runner"
  validation {
    condition     = contains(toset(["standard-v1", "standard-v2", "standard-v3"]), var.vm_type)
    error_message = "(Optional) Select type of virtual machine from the list: standard-v1, standard-v2, standard-v3."
  }
  nullable    = false
}

variable "zone" {
  default     = "ru-central1-a"
  type        = string
  description = "Zone for instance on Yandex Cloud"
  validation {
    condition     = contains(toset(["ru-central1-a", "ru-central1-b", "ru-central1-c"]), var.zone)
    error_message = "Select availability zone from the list: ru-central1-a, ru-central1-b, ru-central1-c."
  }
  nullable    = false
}

variable "preemptible" {
  default     = true
  type        = bool
  description = "(Optional) Specifies if the machine is preemptible"
}

variable "resources_cores" {
  default     = 2
  type        = number
  description = "CPU cores"
  nullable    = false
}

variable "resources_memory" {
  default     = 2
  type        = number
  description = "RAM size in GB"
  nullable    = false
}

variable "disk_type" {
  default     = "network-ssd"
  type        = string
  description = "(Optional) Type of the disk that is being created"
}

variable "disk_size" {
  default     = 50
  type        = string
  description = "(Optional) Size of the disk in GB"
}

variable "subnet_id" {
  type        = string
  description = "ID of the subnet to attach this interface to"
  nullable    = false
}

variable "nat" {
  default     = true
  type        = bool
  description = "(Optional) Provide a public address, for instance, to access from Internet"
}
