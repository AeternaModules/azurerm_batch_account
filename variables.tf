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
  # --- Unconfirmed validation candidates, derived from azurerm_batch_account's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    [from validate.AccountName] !regexp.MustCompile(`^[a-z0-9]+$`).MatchString(value)
  # path: name
  #   source:    [from validate.AccountName] 3 > len(value)
  # path: name
  #   condition: length(value) <= 24
  #   message:   [from validate.AccountName: invalid when len(value) > 24]
  #   source:    [from validate.AccountName: invalid when len(value) > 24]
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
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: storage_account_id
  #   source:    [from commonids.ValidateStorageAccountID] !ok
  # path: storage_account_id
  #   source:    [from commonids.ValidateStorageAccountID] err != nil
  # path: storage_account_authentication_mode
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: storage_account_node_identity
  #   source:    [from commonids.ValidateUserAssignedIdentityID] !ok
  # path: storage_account_node_identity
  #   source:    [from commonids.ValidateUserAssignedIdentityID] err != nil
  # path: allowed_authentication_modes[*]
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: pool_allocation_mode
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: network_profile.account_access.default_action
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: network_profile.account_access.ip_rule.ip_range
  #   source:    [from validate.BatchAccountIpRange] re != nil && !re.MatchString(value)
  # path: network_profile.account_access.ip_rule.action
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: network_profile.node_management_access.default_action
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: network_profile.node_management_access.ip_rule.ip_range
  #   source:    [from validate.BatchAccountIpRange] re != nil && !re.MatchString(value)
  # path: network_profile.node_management_access.ip_rule.action
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: key_vault_reference.id
  #   source:    [from azure.ValidateResourceID] !ok
  # path: key_vault_reference.id
  #   source:    [from azure.ValidateResourceID] err != nil
  # path: key_vault_reference.url
  #   source:    validation.IsURLWithHTTPS(...) - no translation rule yet, add one
  # path: identity.type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: identity.identity_ids[*]
  #   source:    [from commonids.ValidateUserAssignedIdentityID] !ok
  # path: identity.identity_ids[*]
  #   source:    [from commonids.ValidateUserAssignedIdentityID] err != nil
  # path: encryption.key_vault_key_id
  #   source:    [from keyvault.ValidateNestedItemID] !ok
  # path: encryption.key_vault_key_id
  #   source:    [from keyvault.ValidateNestedItemID] err != nil
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

