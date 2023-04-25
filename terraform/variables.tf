variable "iam_token" {
  type        = string
  description = "IAM token for access to cloud and folder"
  sensitive   = true
  nullable    = false
}

variable "cloud_id" {
  type        = string
  description = "ID of Cloud"
  nullable    = false
}

variable "folder_id" {
  type        = string
  description = "ID of Folder"
  nullable    = false
}

variable "zone" {
  default     = "ru-central1-a"
  type        = string
  description = "Default zone for infrastructure"
  validation {
    condition     = contains(toset(["ru-central1-a", "ru-central1-b", "ru-central1-c"]), var.zone)
    error_message = "Select availability zone from the list: ru-central1-a, ru-central1-b, ru-central1-c."
  }
  nullable    = false
}

variable "disk_image_id" {
  default     = "f2emjomb63oc6ddm7lqt"
  type        = string
  description = "Disk image ID for instance: ubuntu-20-04-lts-v20230424"
}
