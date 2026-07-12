output "images_data_disk" {
  description = "Map of data_disk values across all images, keyed the same as var.images"
  value       = { for k, v in azurerm_image.images : k => v.data_disk }
}
output "images_hyper_v_generation" {
  description = "Map of hyper_v_generation values across all images, keyed the same as var.images"
  value       = { for k, v in azurerm_image.images : k => v.hyper_v_generation }
}
output "images_location" {
  description = "Map of location values across all images, keyed the same as var.images"
  value       = { for k, v in azurerm_image.images : k => v.location }
}
output "images_name" {
  description = "Map of name values across all images, keyed the same as var.images"
  value       = { for k, v in azurerm_image.images : k => v.name }
}
output "images_os_disk" {
  description = "Map of os_disk values across all images, keyed the same as var.images"
  value       = { for k, v in azurerm_image.images : k => v.os_disk }
}
output "images_resource_group_name" {
  description = "Map of resource_group_name values across all images, keyed the same as var.images"
  value       = { for k, v in azurerm_image.images : k => v.resource_group_name }
}
output "images_source_virtual_machine_id" {
  description = "Map of source_virtual_machine_id values across all images, keyed the same as var.images"
  value       = { for k, v in azurerm_image.images : k => v.source_virtual_machine_id }
}
output "images_tags" {
  description = "Map of tags values across all images, keyed the same as var.images"
  value       = { for k, v in azurerm_image.images : k => v.tags }
}
output "images_zone_resilient" {
  description = "Map of zone_resilient values across all images, keyed the same as var.images"
  value       = { for k, v in azurerm_image.images : k => v.zone_resilient }
}

