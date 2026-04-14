# ☁️ Self-Healing Infrastructure


## 📖 Overview

This repository provides a robust framework for building and managing a **self-healing infrastructure** in the cloud. Leveraging Infrastructure as Code (IaC) principles with Terraform and integrating with AWS services, this project automates the detection of infrastructure anomalies and initiates predefined remediation actions without human intervention. The goal is to minimize downtime, reduce operational overhead, and ensure high availability for applications deployed on the platform.

Designed for DevOps engineers, SREs, and cloud architects, this solution offers a foundational structure for resilient cloud environments, enabling rapid recovery from failures and consistent infrastructure state.

## ✨ Features

-   ⚕️ **Automated Self-Healing**: Proactive detection of infrastructure issues (e.g., failed instances, unhealthy services) and automated remediation through a combination of monitoring and action scripts.
-   🏗️ **Infrastructure as Code (IaC)**: Define, provision, and manage AWS resources using Terraform for consistency, version control, and reproducibility.
-   🐳 **Containerized Application Deployment**: Support for deploying applications using Docker, facilitating portable and scalable service deployments onto the provisioned infrastructure.
-   ☁️ **AWS Cloud Integration**: Deep integration with Amazon Web Services for provisioning compute, network, storage, and other essential services.
-   📊 **Monitoring & Alerting Foundations**: Contains configurations and scripts for integrating monitoring solutions to gather metrics and trigger alerts, forming the basis for self-healing actions.
-   🚀 **Operational Automation**: A collection of shell scripts to automate common operational tasks, health checks, and remediation workflows.
-   🔄 **CI/CD Ready**: Configured with GitHub Actions workflows to automate infrastructure changes, deployments, and validation processes.

## 🛠️ Tech Stack

**Cloud & IaC:**

![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)

![Terraform](https://img.shields.io/badge/Terraform-%237B42BC.svg?style=for-the-badge&logo=terraform&logoColor=white)

**Containerization:**

![Docker](https://img.shields.io/badge/docker-%230DB7ED.svg?style=for-the-badge&logo=docker&logoColor=white)

**Automation & Scripting:**

![Shell Script](https://img.shields.io/badge/Shell%20Script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white)

**CI/CD:**

![GitHub Actions](https://img.shields.io/badge/GitHub%20Actions-%23267FD0.svg?style=for-the-badge&logo=githubactions&logoColor=white)

## 🚀 Quick Start

This guide will help you set up and provision your self-healing infrastructure.

### Prerequisites

Before you begin, ensure you have the following installed and configured:

-   **AWS Account**: An active AWS account with programmatic access keys.
-   **AWS CLI**: Version 2 recommended.
    *   [Install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
    *   Configure with `aws configure` (requires `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, `AWS_REGION`).
-   **Terraform**: Version 1.0.0 or higher.
    *   [Install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)
-   **Docker**: Docker Desktop or Docker Engine.
    *   [Install Docker](https://docs.docker.com/get-docker/)

### Installation (Tools)

The core components of this repository are infrastructure definitions and scripts. There is no traditional "installation" beyond setting up the prerequisites.

1.  **Clone the repository**
    ```bash
    git clone https://github.com/hs2002-18/Self-Healing-Infrastructure.git
    cd Self-Healing-Infrastructure
    ```

2.  **AWS CLI v2 (Optional, if using bundled version)**
    If you prefer to use the `awscliv2.zip` included in this repository instead of a system-wide installation, you can extract it:
    ```bash
    # For Linux/macOS
    unzip awscliv2.zip -d /tmp
    sudo /tmp/aws/install --update
    # For Windows, refer to AWS CLI documentation for installation from zip.
    ```
    Ensure your AWS credentials are configured for programmatic access:
    ```bash
    aws configure
    # You will be prompted for:
    # AWS Access Key ID: [Your Access Key]
    # AWS Secret Access Key: [Your Secret Key]
    # Default region name: [e.g., us-east-1]
    # Default output format: [e.g., json]
    ```

### Infrastructure Provisioning with Terraform

The `terraform` directory contains the IaC definitions for your AWS infrastructure.

1.  **Initialize Terraform**
    Navigate to the `terraform` directory and initialize the backend and providers.
    ```bash
    cd terraform
    terraform init
    ```

2.  **Review the Plan**
    Generate an execution plan to see what actions Terraform will perform.
    ```bash
    terraform plan
    ```

3.  **Apply the Configuration**
    Apply the planned changes to provision your AWS infrastructure.
    ```bash
    terraform apply
    ```
    Confirm with `yes` when prompted.

### Deploying Sample Applications (using Docker)

The `apps` and `docker` directories are intended for defining and deploying your applications onto the provisioned infrastructure. This example demonstrates a generic Docker application deployment.

1.  **Navigate to Docker directory**
    ```bash
    cd ../docker # Assuming you are in terraform/
    ```

2.  **Build your Docker image**
    (Assuming a `Dockerfile` exists for a sample application within `docker/` or `apps/`).
    ```bash
    docker build -t my-self-healing-app .
    ```

3.  **Run the Docker container (example)**
    ```bash
    docker run -p 80:80 my-self-healing-app
    ```
    *Note: Actual deployment to the self-healing infrastructure would involve integration with services like AWS ECS, EKS, or EC2 User Data/SSM, orchestrated by Terraform or custom scripts for automated scaling and recovery.*

## 📁 Project Structure

```
Self-Healing-Infrastructure/
├── .github/              # GitHub Actions workflows for CI/CD automation
│   └── workflows/        # CI/CD pipeline definitions
├── .gitignore            # Specifies intentionally untracked files and directories
├── apps/                 # Placeholder for application codebases or deployment definitions
├── aws/                  # AWS-specific configurations, scripts, or service integrations
├── awscliv2.zip          # Bundled AWS CLI v2 installation package (optional to use)
├── docker/               # Dockerfiles and Docker Compose configurations for containerized services
├── monitoring/           # Configurations and scripts for infrastructure monitoring and alerting
├── scripts/              # Collection of shell scripts for automation, health checks, and remediation
└── terraform/            # Terraform configurations for provisioning AWS infrastructure
    ├── main.tf           # Main Terraform configuration file
    ├── variables.tf      # Input variable definitions for Terraform modules
    └── outputs.tf        # Output value definitions from Terraform resources
```

## ⚙️ Configuration

### Environment Variables

The following environment variables are typically required for AWS CLI and Terraform to interact with your AWS account:

| Variable                | Description                                | Example                           | Required |

| :---------------------- | :----------------------------------------- | :-------------------------------- | :------- |

| `AWS_ACCESS_KEY_ID`     | Your AWS account's access key ID.          | `AKIAIOSFODNN7EXAMPLE`            | Yes      |

| `AWS_SECRET_ACCESS_KEY` | Your AWS account's secret access key.      | `wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY` | Yes      |

| `AWS_REGION`            | The default AWS region for resource deployment. | `us-east-1`                       | Yes      |

*It is recommended to use AWS IAM roles or AWS SSO for managing credentials in production environments for enhanced security.*

### Key Configuration Files

-   `terraform/*.tf`: Terraform configuration files defining the infrastructure resources. These files contain module calls, resource definitions, and variable declarations.
-   `docker/Dockerfile`: Defines how a specific application or service is packaged into a Docker image.
-   `monitoring/*`: Contains configurations for monitoring tools (ee.g., CloudWatch alarm definitions, Prometheus rules).
-   `scripts/*.sh`: Shell scripts containing automation logic for various operational tasks, including health checks and remediation.

## 🔧 Usage & Automation

### Deploying and Managing Infrastructure

-   **Provision Infrastructure**: Use `terraform apply` within the `terraform/` directory to create or update your cloud resources.
-   **Destroy Infrastructure**: To tear down all provisioned resources (use with caution!), run `terraform destroy` in the `terraform/` directory.

### Implementing Self-Healing Logic

The `monitoring/` and `scripts/` directories are central to the self-healing capabilities.

1.  **Define Monitoring**: Set up CloudWatch Alarms (via Terraform) or other monitoring tools (e.g., Prometheus rules in `monitoring/`) to detect unhealthy states (e.g., high CPU, instance down).
2.  **Create Remediation Scripts**: Develop shell scripts in `scripts/` that can take corrective actions (e.g., restart a service, replace an unhealthy instance, scale up resources).
3.  **Automate Actions**: Integrate these scripts with AWS Lambda functions or EC2 User Data/SSM documents, triggered by monitoring alarms, to execute remediation automatically. (These integrations would be defined in `aws/` or `terraform/` to link alarms to actions.)

### Running Custom Automation Scripts

The `scripts/` directory is where you'll find or add custom automation. These scripts can be run manually or integrated into your CI/CD pipelines and self-healing mechanisms.

```bash

# Example: Run a health check script
./scripts/check_service_health.sh
```
*You would populate this directory with your specific operational scripts tailored to your infrastructure.*



## 📄 Author
### Harsh Shrimali



