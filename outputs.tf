output "batch_accounts_id" {
  description = "Map of id values across all batch_accounts, keyed the same as var.batch_accounts"
  value       = { for k, v in azurerm_batch_account.batch_accounts : k => v.id if v.id != null && length(v.id) > 0 }
}
output "batch_accounts_account_endpoint" {
  description = "Map of account_endpoint values across all batch_accounts, keyed the same as var.batch_accounts"
  value       = { for k, v in azurerm_batch_account.batch_accounts : k => v.account_endpoint if v.account_endpoint != null && length(v.account_endpoint) > 0 }
}
output "batch_accounts_allowed_authentication_modes" {
  description = "Map of allowed_authentication_modes values across all batch_accounts, keyed the same as var.batch_accounts"
  value       = { for k, v in azurerm_batch_account.batch_accounts : k => v.allowed_authentication_modes if v.allowed_authentication_modes != null && length(v.allowed_authentication_modes) > 0 }
}
output "batch_accounts_encryption" {
  description = "Map of encryption values across all batch_accounts, keyed the same as var.batch_accounts"
  value       = { for k, v in azurerm_batch_account.batch_accounts : k => v.encryption if v.encryption != null && length(v.encryption) > 0 }
}
output "batch_accounts_identity" {
  description = "Map of identity values across all batch_accounts, keyed the same as var.batch_accounts"
  value       = { for k, v in azurerm_batch_account.batch_accounts : k => v.identity if v.identity != null && length(v.identity) > 0 }
}
output "batch_accounts_key_vault_reference" {
  description = "Map of key_vault_reference values across all batch_accounts, keyed the same as var.batch_accounts"
  value       = { for k, v in azurerm_batch_account.batch_accounts : k => v.key_vault_reference if v.key_vault_reference != null && length(v.key_vault_reference) > 0 }
}
output "batch_accounts_location" {
  description = "Map of location values across all batch_accounts, keyed the same as var.batch_accounts"
  value       = { for k, v in azurerm_batch_account.batch_accounts : k => v.location if v.location != null && length(v.location) > 0 }
}
output "batch_accounts_name" {
  description = "Map of name values across all batch_accounts, keyed the same as var.batch_accounts"
  value       = { for k, v in azurerm_batch_account.batch_accounts : k => v.name if v.name != null && length(v.name) > 0 }
}
output "batch_accounts_network_profile" {
  description = "Map of network_profile values across all batch_accounts, keyed the same as var.batch_accounts"
  value       = { for k, v in azurerm_batch_account.batch_accounts : k => v.network_profile if v.network_profile != null && length(v.network_profile) > 0 }
}
output "batch_accounts_pool_allocation_mode" {
  description = "Map of pool_allocation_mode values across all batch_accounts, keyed the same as var.batch_accounts"
  value       = { for k, v in azurerm_batch_account.batch_accounts : k => v.pool_allocation_mode if v.pool_allocation_mode != null && length(v.pool_allocation_mode) > 0 }
}
output "batch_accounts_primary_access_key" {
  description = "Map of primary_access_key values across all batch_accounts, keyed the same as var.batch_accounts"
  value       = { for k, v in azurerm_batch_account.batch_accounts : k => v.primary_access_key if v.primary_access_key != null && length(v.primary_access_key) > 0 }
  sensitive   = true
}
output "batch_accounts_public_network_access_enabled" {
  description = "Map of public_network_access_enabled values across all batch_accounts, keyed the same as var.batch_accounts"
  value       = { for k, v in azurerm_batch_account.batch_accounts : k => v.public_network_access_enabled if v.public_network_access_enabled != null }
}
output "batch_accounts_resource_group_name" {
  description = "Map of resource_group_name values across all batch_accounts, keyed the same as var.batch_accounts"
  value       = { for k, v in azurerm_batch_account.batch_accounts : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "batch_accounts_secondary_access_key" {
  description = "Map of secondary_access_key values across all batch_accounts, keyed the same as var.batch_accounts"
  value       = { for k, v in azurerm_batch_account.batch_accounts : k => v.secondary_access_key if v.secondary_access_key != null && length(v.secondary_access_key) > 0 }
  sensitive   = true
}
output "batch_accounts_storage_account_authentication_mode" {
  description = "Map of storage_account_authentication_mode values across all batch_accounts, keyed the same as var.batch_accounts"
  value       = { for k, v in azurerm_batch_account.batch_accounts : k => v.storage_account_authentication_mode if v.storage_account_authentication_mode != null && length(v.storage_account_authentication_mode) > 0 }
}
output "batch_accounts_storage_account_id" {
  description = "Map of storage_account_id values across all batch_accounts, keyed the same as var.batch_accounts"
  value       = { for k, v in azurerm_batch_account.batch_accounts : k => v.storage_account_id if v.storage_account_id != null && length(v.storage_account_id) > 0 }
}
output "batch_accounts_storage_account_node_identity" {
  description = "Map of storage_account_node_identity values across all batch_accounts, keyed the same as var.batch_accounts"
  value       = { for k, v in azurerm_batch_account.batch_accounts : k => v.storage_account_node_identity if v.storage_account_node_identity != null && length(v.storage_account_node_identity) > 0 }
}
output "batch_accounts_tags" {
  description = "Map of tags values across all batch_accounts, keyed the same as var.batch_accounts"
  value       = { for k, v in azurerm_batch_account.batch_accounts : k => v.tags if v.tags != null && length(v.tags) > 0 }
}

