output "images_id" {
  description = "Map of id values across all images, keyed the same as var.images"
  value       = { for k, v in azurerm_image.images : k => v.id if v.id != null && length(v.id) > 0 }
}
output "images_data_disk" {
  description = "Map of data_disk values across all images, keyed the same as var.images"
  value       = { for k, v in azurerm_image.images : k => v.data_disk if v.data_disk != null && length(v.data_disk) > 0 }
}
output "images_hyper_v_generation" {
  description = "Map of hyper_v_generation values across all images, keyed the same as var.images"
  value       = { for k, v in azurerm_image.images : k => v.hyper_v_generation if v.hyper_v_generation != null && length(v.hyper_v_generation) > 0 }
}
output "images_location" {
  description = "Map of location values across all images, keyed the same as var.images"
  value       = { for k, v in azurerm_image.images : k => v.location if v.location != null && length(v.location) > 0 }
}
output "images_name" {
  description = "Map of name values across all images, keyed the same as var.images"
  value       = { for k, v in azurerm_image.images : k => v.name if v.name != null && length(v.name) > 0 }
}
output "images_os_disk" {
  description = "Map of os_disk values across all images, keyed the same as var.images"
  value       = { for k, v in azurerm_image.images : k => v.os_disk if v.os_disk != null && length(v.os_disk) > 0 }
}
output "images_resource_group_name" {
  description = "Map of resource_group_name values across all images, keyed the same as var.images"
  value       = { for k, v in azurerm_image.images : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "images_source_virtual_machine_id" {
  description = "Map of source_virtual_machine_id values across all images, keyed the same as var.images"
  value       = { for k, v in azurerm_image.images : k => v.source_virtual_machine_id if v.source_virtual_machine_id != null && length(v.source_virtual_machine_id) > 0 }
}
output "images_tags" {
  description = "Map of tags values across all images, keyed the same as var.images"
  value       = { for k, v in azurerm_image.images : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "images_zone_resilient" {
  description = "Map of zone_resilient values across all images, keyed the same as var.images"
  value       = { for k, v in azurerm_image.images : k => v.zone_resilient if v.zone_resilient != null }
}

