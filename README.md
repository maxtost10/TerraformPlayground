# TerraformPlayground

This repository contains a minimal, production-ready infrastructure setup for a personal or team-based data lab. It uses **Terraform** to provision Azure resources including:

- A Resource Group
- A Storage Account
- An Azure Databricks Workspace
- (Optional) A GitHub Actions workflow for automated deployment

---

## 📁 Folder Structure & Purpose

### `infra/main.tf`

Defines the core infrastructure resources:
- Azure Resource Group
- Azure Storage Account
- Azure Databricks Workspace
- Random string for name uniqueness

This is the main entry point for Terraform to build your cloud data lab.

---

### `infra/backend.tf`

Defines the **Terraform remote state backend**.

Terraform needs to store the state of what it has created. This file configures Azure Blob Storage as the place to store that `.tfstate` file.

You must manually create the `tfstate` storage account & container once before the first `terraform init`.

---

### `infra/variables.tf`

(Optional) Declares variables used in the project, such as:
- `client_id`
- `client_secret`
- `tenant_id`

This improves readability and allows separation of config from logic.

---

### `infra/terraform.tfvars`

Provides **concrete values** for the variables defined in `variables.tf`, e.g.:
```hcl
client_id     = "your-client-id"
client_secret = "your-secret"
tenant_id     = "your-tenant-id"
