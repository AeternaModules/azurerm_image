variable "images" {
  description = <<EOT
Map of images, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - hyper_v_generation
    - source_virtual_machine_id
    - tags
    - zone_resilient
    - data_disk (block):
        - blob_uri (optional)
        - caching (optional)
        - disk_encryption_set_id (optional)
        - lun (optional)
        - managed_disk_id (optional)
        - size_gb (optional)
        - storage_type (required)
    - os_disk (block):
        - blob_uri (optional)
        - caching (optional)
        - disk_encryption_set_id (optional)
        - managed_disk_id (optional)
        - os_state (optional)
        - os_type (optional)
        - size_gb (optional)
        - storage_type (required)
EOT

  type = map(object({
    location                  = string
    name                      = string
    resource_group_name       = string
    hyper_v_generation        = optional(string) # Default: "V1"
    source_virtual_machine_id = optional(string)
    tags                      = optional(map(string))
    zone_resilient            = optional(bool) # Default: false
    data_disk = optional(object({
      blob_uri               = optional(string)
      caching                = optional(string) # Default: "None"
      disk_encryption_set_id = optional(string)
      lun                    = optional(number)
      managed_disk_id        = optional(string)
      size_gb                = optional(number)
      storage_type           = string
    }))
    os_disk = optional(object({
      blob_uri               = optional(string)
      caching                = optional(string) # Default: "None"
      disk_encryption_set_id = optional(string)
      managed_disk_id        = optional(string)
      os_state               = optional(string)
      os_type                = optional(string)
      size_gb                = optional(number)
      storage_type           = string
    }))
  }))
}

