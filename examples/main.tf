terraform {
  required_providers {
    instatus = {
      source  = "udarvpsinu/instatus"
      version = "~> 0.1"
    }
  }
}

provider "instatus" {
  # Configuration options
  # api_key and page_id can be set via environment variables:
  # export INSTATUS_API_KEY="your-api-key"
  # export INSTATUS_PAGE_ID="your-page-id"
}

# Simple component
resource "instatus_component" "api" {
  name        = "API Service"
  description = "Main API service"
  status      = "OPERATIONAL"
  show_uptime = true
}

# Parent component
resource "instatus_component" "infrastructure" {
  name        = "Infrastructure"
  description = "Infrastructure services"
  status      = "OPERATIONAL"
  show_uptime = true
  order       = 1
}

# Child component
resource "instatus_component" "database" {
  name        = "Database"
  description = "Primary database cluster"
  status      = "OPERATIONAL"
  show_uptime = true
  grouped     = true
  group_id    = instatus_component.infrastructure.id
}

# Another child component
resource "instatus_component" "cache" {
  name        = "Cache"
  description = "Redis cache layer"
  status      = "OPERATIONAL"
  show_uptime = true
  grouped     = true
  group_id    = instatus_component.infrastructure.id
}
