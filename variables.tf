variable "scc_management_organization_event_threat_detection_custom_modules" {
  description = <<EOT
Map of scc_management_organization_event_threat_detection_custom_modules, attributes below
Required:
    - organization
Optional:
    - config
    - deletion_policy
    - display_name
    - enablement_state
    - location
    - type
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    organization     = string
    config           = optional(string)
    deletion_policy  = optional(string)
    display_name     = optional(string)
    enablement_state = optional(string)
    location         = optional(string)
    type             = optional(string)
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.scc_management_organization_event_threat_detection_custom_modules : (
        v.config == null || (can(jsondecode(v.config)))
      )
    ])
    error_message = "must be valid JSON"
  }
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

