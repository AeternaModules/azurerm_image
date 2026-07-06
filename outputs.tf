output "images" {
  description = "All image resources"
  value       = azurerm_image.images
}
output "images_data_disk" {
  description = "List of data_disk values across all images"
  value       = [for k, v in azurerm_image.images : v.data_disk]
}
output "images_hyper_v_generation" {
  description = "List of hyper_v_generation values across all images"
  value       = [for k, v in azurerm_image.images : v.hyper_v_generation]
}
output "images_location" {
  description = "List of location values across all images"
  value       = [for k, v in azurerm_image.images : v.location]
}
output "images_name" {
  description = "List of name values across all images"
  value       = [for k, v in azurerm_image.images : v.name]
}
output "images_os_disk" {
  description = "List of os_disk values across all images"
  value       = [for k, v in azurerm_image.images : v.os_disk]
}
output "images_resource_group_name" {
  description = "List of resource_group_name values across all images"
  value       = [for k, v in azurerm_image.images : v.resource_group_name]
}
output "images_source_virtual_machine_id" {
  description = "List of source_virtual_machine_id values across all images"
  value       = [for k, v in azurerm_image.images : v.source_virtual_machine_id]
}
output "images_tags" {
  description = "List of tags values across all images"
  value       = [for k, v in azurerm_image.images : v.tags]
}
output "images_zone_resilient" {
  description = "List of zone_resilient values across all images"
  value       = [for k, v in azurerm_image.images : v.zone_resilient]
}

