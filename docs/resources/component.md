---
page_title: "instatus_component Resource - terraform-provider-instatus"
subcategory: ""
description: |-
  Manages an Instatus status page component.
---

# instatus_component (Resource)

Manages an Instatus status page component. Components represent services or systems displayed on your status page.

## Example Usage

### Simple Component

```terraform
resource "instatus_component" "api" {
  name        = "API Service"
  description = "Main API service"
  status      = "OPERATIONAL"
  show_uptime = true
}
```

### Nested Components (Parent/Child)

```terraform
# Parent component
resource "instatus_component" "web_services" {
  name        = "Web Services"
  description = "All web-related services"
  status      = "OPERATIONAL"
  show_uptime = true
}

# Child component
resource "instatus_component" "website" {
  name        = "Website"
  description = "Main website"
  status      = "OPERATIONAL"
  show_uptime = true
  grouped     = true
  group_id    = instatus_component.web_services.id
}

# Grandchild component (multi-level nesting)
resource "instatus_component" "cdn" {
  name        = "CDN"
  description = "Content delivery network"
  status      = "OPERATIONAL"
  show_uptime = true
  grouped     = true
  group_id    = instatus_component.website.id
}
```

### Component with Specific Order

```terraform
resource "instatus_component" "database" {
  name        = "Database"
  description = "Primary database"
  status      = "OPERATIONAL"
  show_uptime = true
  order       = 1
}
```

### Archived Component

```terraform
resource "instatus_component" "legacy" {
  name        = "Legacy Service"
  description = "Deprecated service"
  status      = "OPERATIONAL"
  archived    = true
}
```

## Schema

### Required

- `name` (String) - The name of the component

### Optional

- `archived` (Boolean) - Whether the component is archived. Default: `false`
- `description` (String) - The description of the component. Default: `""`
- `group_id` (String) - The ID of the parent component group (required if `grouped` is `true`)
- `grouped` (Boolean) - Whether this component belongs to a group. Default: `false`
- `order` (Number) - The display order of the component. If not set, Instatus manages the order automatically
- `show_uptime` (Boolean) - Whether to show uptime metrics for this component. Default: `true`
- `status` (String) - The status of the component. Valid values:
  - `OPERATIONAL` (default) - Component is working normally
  - `UNDERMAINTENANCE` - Component is under maintenance
  - `DEGRADEDPERFORMANCE` - Component has degraded performance
  - `PARTIALOUTAGE` - Component has partial outage
  - `MAJOROUTAGE` - Component has major outage

### Read-Only

- `id` (String) - The unique identifier of the component
- `unique_email` (String) - The unique email address for this component (used for automation and email-based updates)

## Import

Components can be imported using their ID:

```bash
terraform import instatus_component.api <component-id>
```

Example:

```bash
terraform import instatus_component.api cm1a2b3c4d5e6f7g8h9i0
```
