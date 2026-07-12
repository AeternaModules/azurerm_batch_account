resource "azurerm_batch_account" "batch_accounts" {
  for_each = var.batch_accounts

  location                            = each.value.location
  name                                = each.value.name
  resource_group_name                 = each.value.resource_group_name
  allowed_authentication_modes        = each.value.allowed_authentication_modes
  pool_allocation_mode                = each.value.pool_allocation_mode
  public_network_access_enabled       = each.value.public_network_access_enabled
  storage_account_authentication_mode = each.value.storage_account_authentication_mode
  storage_account_id                  = each.value.storage_account_id
  storage_account_node_identity       = each.value.storage_account_node_identity
  tags                                = each.value.tags

  dynamic "encryption" {
    for_each = each.value.encryption != null ? [each.value.encryption] : []
    content {
      key_vault_key_id = encryption.value.key_vault_key_id
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? [each.value.identity] : []
    content {
      identity_ids = identity.value.identity_ids
      type         = identity.value.type
    }
  }

  dynamic "key_vault_reference" {
    for_each = each.value.key_vault_reference != null ? [each.value.key_vault_reference] : []
    content {
      id  = key_vault_reference.value.id
      url = key_vault_reference.value.url
    }
  }

  dynamic "network_profile" {
    for_each = each.value.network_profile != null ? [each.value.network_profile] : []
    content {
      dynamic "account_access" {
        for_each = network_profile.value.account_access != null ? [network_profile.value.account_access] : []
        content {
          default_action = account_access.value.default_action
          dynamic "ip_rule" {
            for_each = account_access.value.ip_rule != null ? account_access.value.ip_rule : []
            content {
              action   = ip_rule.value.action
              ip_range = ip_rule.value.ip_range
            }
          }
        }
      }
      dynamic "node_management_access" {
        for_each = network_profile.value.node_management_access != null ? [network_profile.value.node_management_access] : []
        content {
          default_action = node_management_access.value.default_action
          dynamic "ip_rule" {
            for_each = node_management_access.value.ip_rule != null ? node_management_access.value.ip_rule : []
            content {
              action   = ip_rule.value.action
              ip_range = ip_rule.value.ip_range
            }
          }
        }
      }
    }
  }
}

