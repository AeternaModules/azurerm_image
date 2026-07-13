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
    hyper_v_generation        = optional(string)
    source_virtual_machine_id = optional(string)
    tags                      = optional(map(string))
    zone_resilient            = optional(bool)
    data_disk = optional(list(object({
      blob_uri               = optional(string)
      caching                = optional(string)
      disk_encryption_set_id = optional(string)
      lun                    = optional(number)
      managed_disk_id        = optional(string)
      size_gb                = optional(number)
      storage_type           = string
    })))
    os_disk = optional(object({
      blob_uri               = optional(string)
      caching                = optional(string)
      disk_encryption_set_id = optional(string)
      managed_disk_id        = optional(string)
      os_state               = optional(string)
      os_type                = optional(string)
      size_gb                = optional(number)
      storage_type           = string
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.images : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.images : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.images : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.images : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 26 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

