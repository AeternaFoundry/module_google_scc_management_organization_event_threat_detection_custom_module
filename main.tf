resource "google_scc_management_organization_event_threat_detection_custom_module" "scc_management_organization_event_threat_detection_custom_modules" {
  for_each = var.scc_management_organization_event_threat_detection_custom_modules

  organization     = each.value.organization
  config           = each.value.config
  deletion_policy  = each.value.deletion_policy
  display_name     = each.value.display_name
  enablement_state = each.value.enablement_state
  location         = each.value.location
  type             = each.value.type

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

