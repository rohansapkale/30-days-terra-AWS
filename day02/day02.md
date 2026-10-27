# Day 2 — Terraform Providers & Resource Provisioning ☁️

**Learning Track:** AWS & DevOps  
**Focus:** Terraform Providers, Resource Creation, and State Management

## 📚 What I Learned

- **Terraform Providers:** Understood why providers are required and how they allow Terraform to interact with platforms like AWS through their APIs.
- **Resource Provisioning:** Learned how Terraform configuration files define the cloud resources we want to create and manage.
- **Terraform Workflow:** Explored how `terraform init`, `terraform plan`, and `terraform apply` work together to manage infrastructure.
- **Terraform State File:** Learned about `terraform.tfstate`, which records Terraform's knowledge of managed resources and their attributes.
- **Plan vs. Apply:** Understood that `terraform plan` previews proposed changes, while `terraform apply` executes the planned operations.

## 🔄 Understanding the Workflow

1. `terraform init` — Initializes the working directory and installs the required providers.
2. `terraform plan` — Calculates and displays proposed changes by evaluating the configuration, Terraform state, and refreshed information about managed resources when applicable.
3. `terraform apply` — Executes the planned operations through the provider APIs to create, update, or delete resources.

## 💡 Key Takeaway

Terraform uses providers to communicate with cloud platforms, while its state file helps track managed infrastructure.

**Important clarification:** `terraform plan` is not guaranteed to avoid API calls. With refresh enabled by default, Terraform can query AWS to refresh information about existing managed resources. The plan previews changes but does not apply them. Terraform normally updates its state as part of an apply operation; initialization and planning can also create local files such as `.terraform.lock.hcl` and a saved plan file if requested.

## 🎯 Next: Day 3

- Write a Terraform configuration for an AWS resource.
- Configure AWS authentication securely.
- Review the execution plan before provisioning.
- Verify the resource in AWS and understand the resulting state file.

## 📈 Progress

- [x] Understand Terraform providers
- [x] Learn how Terraform defines resources
- [x] Understand `terraform init`
- [x] Learn the purpose of `terraform plan`
- [x] Understand the basics of Terraform state
- [ ] Provision and verify an AWS resource using Terraform

**Learning approach:** Concept → Hands-on Lab → Validation → Documentation

#Terraform #AWS #DevOps #InfrastructureAsCode #CloudComputing