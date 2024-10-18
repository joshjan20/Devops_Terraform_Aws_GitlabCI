# Terraform AWS VPC and EC2 Infrastructure

This Terraform project creates an AWS Virtual Private Cloud (VPC), a subnet, a security group, and an EC2 instance. The VPC has public subnets and security group rules to allow SSH access. The EC2 instance is launched within the created VPC and associated with the created security group.

## Prerequisites

Before you begin, ensure you have the following installed:

- [Terraform](https://www.terraform.io/downloads.html) (v0.12 or later)
- [AWS CLI](https://aws.amazon.com/cli/)
- An AWS account with appropriate permissions to create VPCs, subnets, security groups, and EC2 instances.

## Project Structure

```
├── provider.tf       # Defines the AWS provider and region
├── main.tf           # Configures the modules for VPC and EC2
├── variable.tf       # Defines the variables
├── vpc/              # Module to configure VPC, subnet, and security group
│   ├── main.tf
│   ├── output.tf
│   └── variable.tf
└── web/              # Module to create the EC2 instance
    └── main.tf
```

## Modules

### VPC Module (`vpc/`)

This module creates a VPC, a public subnet, and a security group.

- **VPC CIDR**: 10.0.0.0/16
- **Public Subnet CIDR**: 10.0.1.0/24
- **Security Group**: Allows inbound SSH traffic (port 22) from any IP (`0.0.0.0/0`).

### EC2 Module (`web/`)

This module launches an EC2 instance within the created VPC, using the public subnet and security group created in the VPC module.

- **AMI**: `ami-06b21ccaeff8cd686` (Amazon Linux 2)
- **Instance Type**: `t2.micro`

## Variables

- `region`: AWS region where resources will be created. Default is `us-east-1`.
- `vpc_cidr`: CIDR block for the VPC.
- `pb_cidr`: CIDR block for the public subnet.
- `ext_ip`: External IP address or range that can access the EC2 instance via SSH (default is `0.0.0.0/0`).

## Outputs

- `pb_sn`: Public subnet ID.
- `sg`: Security group ID for SSH access.

## Usage

1. **Clone the repository**:

    ```bash
    git clone <repo-url>
    cd <repo-directory>
    ```

2. **Initialize Terraform**:

    Run the following command to initialize Terraform and download the required provider plugins.

    ```bash
    terraform init
    ```

3. **Modify Variables** (Optional):

    If you want to change the AWS region or CIDR blocks, modify the `variable.tf` file in the root and `vpc/variable.tf` in the VPC module.

4. **Plan the infrastructure**:

    Preview the changes that Terraform will make.

    ```bash
    terraform plan
    ```

5. **Apply the configuration**:

    Create the infrastructure on AWS.

    ```bash
    terraform apply
    ```

    You will be prompted to confirm before applying the changes.

6. **Destroy the infrastructure**:

    To remove the resources created by Terraform, run:

    ```bash
    terraform destroy
    ```

## Notes

- Ensure your AWS credentials are properly configured via the AWS CLI or environment variables.
- You might need to modify the AMI ID (`ami-06b21ccaeff8cd686`) depending on the region you are deploying in.
- The security group allows SSH access from any IP (`0.0.0.0/0`). For better security, restrict this to your IP.

---

This `README.md` provides all the necessary information to understand, use, and customize the Terraform configuration for this project.