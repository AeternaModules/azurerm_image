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
  # --- Unconfirmed validation candidates, derived from azurerm_image's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: hyper_v_generation
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: source_virtual_machine_id
  #   source:    [from commonids.ValidateVirtualMachineID] !ok
  # path: source_virtual_machine_id
  #   source:    [from commonids.ValidateVirtualMachineID] err != nil
  # path: os_disk.os_type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: os_disk.os_state
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: os_disk.managed_disk_id
  #   source:    [from commonids.ValidateManagedDiskID] !ok
  # path: os_disk.managed_disk_id
  #   source:    [from commonids.ValidateManagedDiskID] err != nil
  # path: os_disk.blob_uri
  #   source:    validation.IsURLWithScheme(...) - no translation rule yet, add one
  # path: os_disk.caching
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: os_disk.size_gb
  #   source:    validation.NoZeroValues(...) - no translation rule yet, add one
  # path: os_disk.disk_encryption_set_id
  #   source:    [from validate.DiskEncryptionSetID] !ok
  # path: os_disk.disk_encryption_set_id
  #   source:    [from validate.DiskEncryptionSetID] err != nil
  # path: os_disk.storage_type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: data_disk.managed_disk_id
  #   source:    [from commonids.ValidateManagedDiskID] !ok
  # path: data_disk.managed_disk_id
  #   source:    [from commonids.ValidateManagedDiskID] err != nil
  # path: data_disk.blob_uri
  #   source:    validation.IsURLWithScheme(...) - no translation rule yet, add one
  # path: data_disk.caching
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: data_disk.size_gb
  #   source:    validation.NoZeroValues(...) - no translation rule yet, add one
  # path: data_disk.disk_encryption_set_id
  #   source:    [from validate.DiskEncryptionSetID] !ok
  # path: data_disk.disk_encryption_set_id
  #   source:    [from validate.DiskEncryptionSetID] err != nil
  # path: data_disk.storage_type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
}

