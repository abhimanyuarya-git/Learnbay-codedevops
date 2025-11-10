# AWS Infrastructure with GitHub Actions CI/CD

This repository contains Terraform infrastructure code with automated CI/CD pipelines using GitHub Actions.

## 📁 Project Structure

```
├── .github/workflows/          # GitHub Actions workflows
│   ├── basic-ci.yml           # Basic validation pipeline
│   ├── terraform-pipeline.yml # Full CI/CD pipeline
│   ├── manual-deploy.yml      # Manual deployment
│   ├── security-scan.yml      # Security scanning
│   └── test.yml              # Simple test pipeline
├── Project/                   # Main infrastructure
│   ├── main.tf               # VPC, subnets, EC2 instances
│   ├── variables.tf          # Input variables
│   ├── outputs.tf            # Output values
│   ├── terraform.tfvars      # Default values
│   ├── dev.tfvars           # Development environment
│   └── prod.tfvars          # Production environment
└── vpc/                      # VPC module (simplified)
    ├── main.tf
    ├── variables.tf
    ├── outputs.tf
    └── terraform.tfvars
```

## 🚀 Infrastructure Components

### VPC Infrastructure
- **VPC**: 10.0.0.0/16 CIDR block
- **Public Subnets**: 2 subnets across AZs
- **Private Subnets**: 2 subnets across AZs
- **Internet Gateway**: For public internet access
- **NAT Gateway**: For private subnet internet access
- **Route Tables**: Proper routing configuration

### EC2 Instances
- **Web Servers**: Configurable count (default: 2)
- **Instance Type**: t3.micro (dev), t3.small (prod)
- **Security Groups**: HTTP, HTTPS, SSH access
- **Auto-scaling**: Ready for ASG integration

## 🔄 CI/CD Pipelines

### 1. Basic CI (`basic-ci.yml`)
- **Trigger**: Push/PR to main
- **Actions**: Format check, validate, init

### 2. Full CI/CD (`terraform-pipeline.yml`)
- **Lint Job**: Code quality checks
- **Plan Job**: Shows changes on PRs
- **Deploy Job**: Deploys on main branch push

### 3. Manual Deploy (`manual-deploy.yml`)
- **Environments**: dev, staging, prod
- **Actions**: plan, apply, destroy
- **Trigger**: Manual workflow dispatch

### 4. Security Scan (`security-scan.yml`)
- **Trivy**: Vulnerability scanning
- **Checkov**: Infrastructure security
- **Schedule**: Weekly automated scans

## ⚙️ Setup Instructions

### 1. Prerequisites
- AWS Account with appropriate permissions
- S3 bucket for Terraform state
- GitHub repository

### 2. Configure Secrets
Add these secrets in GitHub Settings → Secrets:
```
AWS_ACCESS_KEY_ID=your_access_key
AWS_SECRET_ACCESS_KEY=your_secret_key
```

### 3. Update Backend Configuration
Edit `Project/main.tf` and `vpc/providers.tf`:
```hcl
backend "s3" {
  bucket = "your-actual-bucket-name"
  key    = "project/terraform.tfstate"
  region = "us-east-1"
}
```

### 4. Environment Configuration
- **Development**: Uses `dev.tfvars`
- **Production**: Uses `prod.tfvars`
- **Custom**: Modify variables as needed

## 🎯 Usage

### Automatic Deployment
1. **Create PR** → Triggers validation and plan
2. **Merge to main** → Triggers automatic deployment

### Manual Deployment
1. Go to **Actions** tab
2. Select **Manual Deploy**
3. Choose environment and action
4. Click **Run workflow**

### Environment Variables
```bash
# Development
environment = "dev"
instance_count = 1
instance_type = "t3.micro"

# Production
environment = "prod"
instance_count = 3
instance_type = "t3.small"
```

## 🔒 Security Features

- **State Encryption**: S3 backend with encryption
- **IAM Roles**: Least privilege access
- **Security Groups**: Restricted access rules
- **Vulnerability Scanning**: Automated security checks
- **Branch Protection**: Required PR reviews

## 📊 Monitoring & Outputs

The infrastructure outputs:
- VPC ID and CIDR blocks
- Subnet IDs (public/private)
- EC2 instance IDs and public IPs
- Security group IDs

## 🛠️ Customization

### Adding New Environments
1. Create `{env}.tfvars` file
2. Add environment to workflow choices
3. Configure environment protection rules

### Scaling Infrastructure
- Modify `instance_count` variable
- Add auto-scaling groups
- Configure load balancers

### Additional Resources
- RDS databases
- ElastiCache clusters
- Application Load Balancers
- CloudWatch monitoring

## 🚨 Troubleshooting

### Common Issues
1. **State Lock**: Check S3 bucket permissions
2. **AMI Not Found**: Update AMI ID for your region
3. **Quota Limits**: Check AWS service quotas

### Pipeline Failures
- Check AWS credentials
- Verify S3 bucket exists
- Review Terraform syntax

## 📝 Best Practices

- ✅ Use environment-specific tfvars
- ✅ Enable branch protection rules
- ✅ Regular security scans
- ✅ State file encryption
- ✅ Proper tagging strategy
- ✅ Resource naming conventions

## 🔄 Next Steps

1. **Add monitoring**: CloudWatch, alerts
2. **Implement logging**: Centralized logging
3. **Add databases**: RDS, DynamoDB
4. **Configure CDN**: CloudFront distribution
5. **Set up backups**: Automated backup strategy

Your infrastructure is now ready for production deployment! 🎉