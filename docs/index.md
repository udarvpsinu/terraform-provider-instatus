---
page_title: "Instatus Provider"
subcategory: ""
description: |-
  Terraform provider for managing Instatus status page components.
---

# Instatus Provider

The Instatus provider allows you to manage [Instatus](https://instatus.com) status page components using Terraform.

## Example Usage

```terraform
terraform {
  required_providers {
    instatus = {
      source  = "udarvpsinu/instatus"
      version = "~> 0.1"
    }
  }
}

provider "instatus" {
  api_key = var.instatus_api_key
  page_id = var.instatus_page_id
}
```

## Authentication

The provider requires an Instatus API key and Page ID. These can be provided in two ways:

### Environment Variables

```bash
export INSTATUS_API_KEY="your-api-key"
export INSTATUS_PAGE_ID="your-page-id"
```

### Provider Configuration

```terraform
provider "instatus" {
  api_key = "your-api-key"
  page_id = "your-page-id"
}
```

## Getting API Credentials

1. Log in to your [Instatus dashboard](https://instatus.com)
2. Navigate to **Settings** → **API**
3. Generate an API key
4. Get your Page ID from the URL or settings

## Schema

### Required

- `api_key` (String, Sensitive) - Instatus API key for authentication
- `page_id` (String) - Instatus page ID to manage components for

## Resources

- [instatus_component](resources/component) - Manage status page components
