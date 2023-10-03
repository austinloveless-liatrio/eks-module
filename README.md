# eks-crossplane-argocd-sample

Sample project for deploying AWS resources using AWS EKS with Crossplane and Argo CD

---

## Requirements

1. Terraform >= 0.14 (Specify the exact version in `versions.tf`)
2. AWS CLI installed and configured
3. Git
4. [pre-commit](https://pre-commit.com/#install)
5. [tflint](https://github.com/terraform-linters/tflint)
6. [tfsec](https://github.com/tfsec/tfsec)

## Project Structure

The project follows this directory structure:

```
project-root/
├── README.md
├── main.tf
├── provider.tf
├── variables.tf
├── outputs.tf
├── versions.tf
├── .pre-commit-config.yaml
├── modules/
│   ├── ec2_instance/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── ...
```

## Directory Structure

- `main.tf`: This file contains the main set of configuration code for your Terraform project.
- `provider.tf`: This file defines the provider and required version.
- `variables.tf`: This file defines variables used in the Terraform configuration.
- `outputs.tf`: This file defines any outputs from your Terraform project.
- `.pre-commit-config.yaml`: This file contains configurations for pre-commit hooks.
- `modules/`: This directory contains Terraform modules.
  - `ec2_instance/`: An example module to set up an AWS EC2 instance.

## Instructions

### 1. Clone the Repository

First, clone this repository to your local machine.

```bash
git clone <repository_url>
```

### 2. Install pre-commit Hooks

Install the pre-commit hooks defined in `.pre-commit-config.yaml`.

```bash
pre-commit install
```

### 3. Initialize Terraform

Navigate to the `project-root/` directory and initialize Terraform.

```bash
cd project-root/
terraform init
```

### 4. Configure Variables

Open `variables.tf` and configure the necessary variables. You can also create a `terraform.tfvars` file to set these values.

### 5. Plan and Apply

Run a plan to ensure everything looks good.

```bash
terraform plan
```

If the plan looks good, apply it.

```bash
terraform apply
```

You'll be prompted to confirm that you want to create the resources defined in your `main.tf` file. Type `yes` to proceed.

### 6. Outputs

After `terraform apply` completes, you'll see outputs defined in `outputs.tf`.

### 7. Cleanup

After you are done using the infrastructure or want to start over, run the following command to destroy all the resources created by Terraform:

```bash
terraform destroy
```

## Usage of Modules

Modules in the `modules/` directory can be used by referring to their path in the `main.tf` file. For example, to use the `ec2_instance` module:

```hcl
module "ec2_instance" {
  source = "./modules/ec2_instance"
  // Variables specific to the ec2_instance module
}
```

## Pre-Commit Hooks

This repository uses pre-commit hooks to run `terraform fmt`, `terraform validate` before each commit. These hooks ensure that your Terraform files are correctly formatted and validated.

### To Run Hooks Manually

You can also manually run the pre-commit hooks with the following command:

```bash
pre-commit run --all-files
```

### To Skip Hooks

You can skip pre-commit hooks with the follow command:

```bash
git commit --no-verify -m "your commit message"
```