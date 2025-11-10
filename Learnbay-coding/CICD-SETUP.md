# GitHub Actions CI/CD Pipeline Setup Guide

## Overview
This repository contains GitHub Actions workflows for automating Terraform infrastructure deployment with CI/CD best practices.

## Workflows Created

### 1. `terraform-cicd.yml` - Main CI/CD Pipeline
- **Triggers**: Push to main/develop, Pull Requests to main
- **Jobs**:
  - `terraform-check`: Validates Terraform code formatting and syntax
  - `terraform-plan`: Runs on PRs to show planned changes
  - `terraform-apply`: Deploys to production on main branch pushes

### 2. `multi-env-deploy.yml` - Manual Environment Deployment
- **Trigger**: Manual workflow dispatch
- **Purpose**: Deploy to specific environments (dev/staging/prod)

## Setup Steps

### 1. Repository Secrets
Add these secrets in GitHub repository settings:
```
AWS_ACCESS_KEY_ID=your_aws_access_key
AWS_SECRET_ACCESS_KEY=your_aws_secret_key
```

### 2. Environment Protection Rules
1. Go to Settings → Environments
2. Create environments: `dev`, `staging`, `production`
3. Add protection rules for production:
   - Required reviewers
   - Wait timer
   - Restrict to main branch

### 3. S3 Backend Setup
1. Create an S3 bucket for Terraform state
2. Update `backend.tf` with your bucket name
3. Ensure your AWS credentials have S3 access

### 4. Terraform Variables
Create environment-specific `.tfvars` files:
- `dev.tfvars`
- `staging.tfvars`
- `prod.tfvars`

## Usage

### Automatic Deployment
1. Create a Pull Request → Triggers validation and plan
2. Merge to main → Triggers automatic deployment

### Manual Deployment
1. Go to Actions tab
2. Select "Multi-Environment Deployment"
3. Click "Run workflow"
4. Choose environment and run

## Best Practices Implemented

- ✅ Code validation before deployment
- ✅ Terraform plan review in PRs
- ✅ Environment-specific deployments
- ✅ Remote state management
- ✅ AWS credentials security
- ✅ Manual approval for production

## Next Steps

1. Set up branch protection rules
2. Add security scanning workflows
3. Implement drift detection
4. Add notification integrations (Slack/Teams)