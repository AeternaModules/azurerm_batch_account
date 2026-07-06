output "batch_accounts" {
  description = "All batch_account resources"
  value       = azurerm_batch_account.batch_accounts
  sensitive   = true
}
output "batch_accounts_account_endpoint" {
  description = "List of account_endpoint values across all batch_accounts"
  value       = [for k, v in azurerm_batch_account.batch_accounts : v.account_endpoint]
}
output "batch_accounts_allowed_authentication_modes" {
  description = "List of allowed_authentication_modes values across all batch_accounts"
  value       = [for k, v in azurerm_batch_account.batch_accounts : v.allowed_authentication_modes]
}
output "batch_accounts_encryption" {
  description = "List of encryption values across all batch_accounts"
  value       = [for k, v in azurerm_batch_account.batch_accounts : v.encryption]
}
output "batch_accounts_identity" {
  description = "List of identity values across all batch_accounts"
  value       = [for k, v in azurerm_batch_account.batch_accounts : v.identity]
}
output "batch_accounts_key_vault_reference" {
  description = "List of key_vault_reference values across all batch_accounts"
  value       = [for k, v in azurerm_batch_account.batch_accounts : v.key_vault_reference]
}
output "batch_accounts_location" {
  description = "List of location values across all batch_accounts"
  value       = [for k, v in azurerm_batch_account.batch_accounts : v.location]
}
output "batch_accounts_name" {
  description = "List of name values across all batch_accounts"
  value       = [for k, v in azurerm_batch_account.batch_accounts : v.name]
}
output "batch_accounts_network_profile" {
  description = "List of network_profile values across all batch_accounts"
  value       = [for k, v in azurerm_batch_account.batch_accounts : v.network_profile]
}
output "batch_accounts_pool_allocation_mode" {
  description = "List of pool_allocation_mode values across all batch_accounts"
  value       = [for k, v in azurerm_batch_account.batch_accounts : v.pool_allocation_mode]
}
output "batch_accounts_primary_access_key" {
  description = "List of primary_access_key values across all batch_accounts"
  value       = [for k, v in azurerm_batch_account.batch_accounts : v.primary_access_key]
  sensitive   = true
}
output "batch_accounts_public_network_access_enabled" {
  description = "List of public_network_access_enabled values across all batch_accounts"
  value       = [for k, v in azurerm_batch_account.batch_accounts : v.public_network_access_enabled]
}
output "batch_accounts_resource_group_name" {
  description = "List of resource_group_name values across all batch_accounts"
  value       = [for k, v in azurerm_batch_account.batch_accounts : v.resource_group_name]
}
output "batch_accounts_secondary_access_key" {
  description = "List of secondary_access_key values across all batch_accounts"
  value       = [for k, v in azurerm_batch_account.batch_accounts : v.secondary_access_key]
  sensitive   = true
}
output "batch_accounts_storage_account_authentication_mode" {
  description = "List of storage_account_authentication_mode values across all batch_accounts"
  value       = [for k, v in azurerm_batch_account.batch_accounts : v.storage_account_authentication_mode]
}
output "batch_accounts_storage_account_id" {
  description = "List of storage_account_id values across all batch_accounts"
  value       = [for k, v in azurerm_batch_account.batch_accounts : v.storage_account_id]
}
output "batch_accounts_storage_account_node_identity" {
  description = "List of storage_account_node_identity values across all batch_accounts"
  value       = [for k, v in azurerm_batch_account.batch_accounts : v.storage_account_node_identity]
}
output "batch_accounts_tags" {
  description = "List of tags values across all batch_accounts"
  value       = [for k, v in azurerm_batch_account.batch_accounts : v.tags]
}

