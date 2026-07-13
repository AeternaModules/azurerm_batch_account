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
        - key_vault_key_id (optional)
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
    pool_allocation_mode                = optional(string)
    public_network_access_enabled       = optional(bool)
    storage_account_authentication_mode = optional(string)
    storage_account_id                  = optional(string)
    storage_account_node_identity       = optional(string)
    tags                                = optional(map(string))
    encryption = optional(list(object({
      key_vault_key_id = optional(string)
    })))
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
        default_action = optional(string)
        ip_rule = optional(list(object({
          action   = optional(string)
          ip_range = string
        })))
      }))
      node_management_access = optional(object({
        default_action = optional(string)
        ip_rule = optional(list(object({
          action   = optional(string)
          ip_range = string
        })))
      }))
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.batch_accounts : (
        length(v.name) <= 24
      )
    ])
    error_message = "[from validate.AccountName: invalid when len(value) > 24]"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_accounts : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_accounts : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_accounts : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_accounts : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 28 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

