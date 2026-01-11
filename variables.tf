variable "batch_accounts" {
  description = <<EOT
Map of batch_accounts, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - allowed_authentication_modes
    - pool_allocation_mode
    - public_network_access_enabled
    - storage_account_authentication_mode
    - storage_account_id
    - storage_account_node_identity
    - tags
    - encryption (block):
        - key_vault_key_id (required)
    - identity (block):
        - identity_ids (optional)
        - type (required)
    - key_vault_reference (block):
        - id (required)
        - url (required)
    - network_profile (block):
        - account_access (optional, block):
            - default_action (optional)
            - ip_rule (optional, block):
                - action (optional)
                - ip_range (required)
        - node_management_access (optional, block):
            - default_action (optional)
            - ip_rule (optional, block):
                - action (optional)
                - ip_range (required)
EOT

  type = map(object({
    location                            = string
    name                                = string
    resource_group_name                 = string
    allowed_authentication_modes        = optional(set(string))
    pool_allocation_mode                = optional(string, "BatchService")
    public_network_access_enabled       = optional(bool, true)
    storage_account_authentication_mode = optional(string)
    storage_account_id                  = optional(string)
    storage_account_node_identity       = optional(string)
    tags                                = optional(map(string))
    encryption = optional(object({
      key_vault_key_id = string
    }))
    identity = optional(object({
      identity_ids = optional(set(string))
      type         = string
    }))
    key_vault_reference = optional(object({
      id  = string
      url = string
    }))
    network_profile = optional(object({
      account_access = optional(object({
        default_action = optional(string, "Deny")
        ip_rule = optional(object({
          action   = optional(string, "Allow")
          ip_range = string
        }))
      }))
      node_management_access = optional(object({
        default_action = optional(string, "Deny")
        ip_rule = optional(object({
          action   = optional(string, "Allow")
          ip_range = string
        }))
      }))
    }))
  }))
}

