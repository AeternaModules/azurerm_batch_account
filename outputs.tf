output "batch_accounts_id" {
  description = "Map of id values across all batch_accounts, keyed the same as var.batch_accounts"
  value       = { for k, v in azurerm_batch_account.batch_accounts : k => v.id }
}
output "batch_accounts_account_endpoint" {
  description = "Map of account_endpoint values across all batch_accounts, keyed the same as var.batch_accounts"
  value       = { for k, v in azurerm_batch_account.batch_accounts : k => v.account_endpoint }
}
output "batch_accounts_allowed_authentication_modes" {
  description = "Map of allowed_authentication_modes values across all batch_accounts, keyed the same as var.batch_accounts"
  value       = { for k, v in azurerm_batch_account.batch_accounts : k => v.allowed_authentication_modes }
}
output "batch_accounts_encryption" {
  description = "Map of encryption values across all batch_accounts, keyed the same as var.batch_accounts"
  value       = { for k, v in azurerm_batch_account.batch_accounts : k => v.encryption }
}
output "batch_accounts_identity" {
  description = "Map of identity values across all batch_accounts, keyed the same as var.batch_accounts"
  value       = { for k, v in azurerm_batch_account.batch_accounts : k => v.identity }
}
output "batch_accounts_key_vault_reference" {
  description = "Map of key_vault_reference values across all batch_accounts, keyed the same as var.batch_accounts"
  value       = { for k, v in azurerm_batch_account.batch_accounts : k => v.key_vault_reference }
}
output "batch_accounts_location" {
  description = "Map of location values across all batch_accounts, keyed the same as var.batch_accounts"
  value       = { for k, v in azurerm_batch_account.batch_accounts : k => v.location }
}
output "batch_accounts_name" {
  description = "Map of name values across all batch_accounts, keyed the same as var.batch_accounts"
  value       = { for k, v in azurerm_batch_account.batch_accounts : k => v.name }
}
output "batch_accounts_network_profile" {
  description = "Map of network_profile values across all batch_accounts, keyed the same as var.batch_accounts"
  value       = { for k, v in azurerm_batch_account.batch_accounts : k => v.network_profile }
}
output "batch_accounts_pool_allocation_mode" {
  description = "Map of pool_allocation_mode values across all batch_accounts, keyed the same as var.batch_accounts"
  value       = { for k, v in azurerm_batch_account.batch_accounts : k => v.pool_allocation_mode }
}
output "batch_accounts_primary_access_key" {
  description = "Map of primary_access_key values across all batch_accounts, keyed the same as var.batch_accounts"
  value       = { for k, v in azurerm_batch_account.batch_accounts : k => v.primary_access_key }
  sensitive   = true
}
output "batch_accounts_public_network_access_enabled" {
  description = "Map of public_network_access_enabled values across all batch_accounts, keyed the same as var.batch_accounts"
  value       = { for k, v in azurerm_batch_account.batch_accounts : k => v.public_network_access_enabled }
}
output "batch_accounts_resource_group_name" {
  description = "Map of resource_group_name values across all batch_accounts, keyed the same as var.batch_accounts"
  value       = { for k, v in azurerm_batch_account.batch_accounts : k => v.resource_group_name }
}
output "batch_accounts_secondary_access_key" {
  description = "Map of secondary_access_key values across all batch_accounts, keyed the same as var.batch_accounts"
  value       = { for k, v in azurerm_batch_account.batch_accounts : k => v.secondary_access_key }
  sensitive   = true
}
output "batch_accounts_storage_account_authentication_mode" {
  description = "Map of storage_account_authentication_mode values across all batch_accounts, keyed the same as var.batch_accounts"
  value       = { for k, v in azurerm_batch_account.batch_accounts : k => v.storage_account_authentication_mode }
}
output "batch_accounts_storage_account_id" {
  description = "Map of storage_account_id values across all batch_accounts, keyed the same as var.batch_accounts"
  value       = { for k, v in azurerm_batch_account.batch_accounts : k => v.storage_account_id }
}
output "batch_accounts_storage_account_node_identity" {
  description = "Map of storage_account_node_identity values across all batch_accounts, keyed the same as var.batch_accounts"
  value       = { for k, v in azurerm_batch_account.batch_accounts : k => v.storage_account_node_identity }
}
output "batch_accounts_tags" {
  description = "Map of tags values across all batch_accounts, keyed the same as var.batch_accounts"
  value       = { for k, v in azurerm_batch_account.batch_accounts : k => v.tags }
}

