# GitHub Actions Pipeline - Complete Setup Guide

## What We Created

### 1. Basic CI Pipeline (`basic-ci.yml`)
- Validates Terraform code on every push/PR
- Checks formatting and syntax

### 2. Advanced CI/CD Pipeline (`terraform-pipeline.yml`)
- **Lint Job**: Code quality checks
- **Plan Job**: Shows changes on PRs
- **Deploy Job**: Deploys on main branch

### 3. Manual Deploy (`manual-deploy.yml`)
- Choose environment (dev/staging/prod)
- Choose action (plan/apply/destroy)
- Manual trigger only

### 4. Security Scan (`security-scan.yml`)
- Vulnerability scanning with Trivy
- Infrastructure security with Checkov
- Runs on push, PR, and weekly schedule

## Setup Steps

### 1. Repository Setup
```bash
# Initialize git repository
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/username/repo.git
git push -u origin main
```

### 2. GitHub Secrets
Go to Settings → Secrets and variables → Actions:
```
AWS_ACCESS_KEY_ID=your_access_key
AWS_SECRET_ACCESS_KEY=your_secret_key
```

### 3. Environment Protection
Settings → Environments → Create:
- `dev` (no restrictions)
- `staging` (require reviewers)
- `production` (require reviewers + wait timer)

### 4. Branch Protection
Settings → Branches → Add rule for `main`:
- Require status checks
- Require PR reviews
- Restrict pushes

## How to Use

### Automatic Workflows
- **Push to main** → Runs lint + deploy
- **Create PR** → Runs lint + plan
- **Weekly** → Security scan

### Manual Workflows
1. Go to Actions tab
2. Select "Manual Deploy"
3. Click "Run workflow"
4. Choose environment and action

## Workflow Triggers Explained

```yaml
on:
  push:                    # Code pushed to branch
  pull_request:           # PR created/updated
  workflow_dispatch:      # Manual trigger
  schedule:              # Cron schedule
```

## Next Steps

1. **Test the pipeline**: Create a PR to test
2. **Add notifications**: Slack/Teams integration
3. **Add more environments**: staging, UAT
4. **Implement drift detection**: Scheduled checks
5. **Add cost estimation**: Infracost integration

Your GitHub Actions pipeline is ready to use!