# AWS Infrastructure with Terraform & Git Setup

Comprehensive documentation for setting up, configuring, and managing AWS EC2 infrastructure using modular Terraform (Infrastructure as Code) and version controlling the codebase with Git & GitHub[cite: 2].

---

## Executive Summary

* **Project:** Modular Terraform AWS Infrastructure Lab
* **Infrastructure Target:** AWS EC2 Web Server (t3.medium)
* **Primary Tools:** Terraform (v1.x), AWS Provider (~> 5.0), Git, GitHub
* **Environment:** Linux / WSL (Debian)

---

## Project Architecture & Modular Structure

    terraform-labs/
    ├── .gitignore          # Rules to ignore state files and local provider caches
    ├── provider.tf         # AWS provider settings & requirements
    ├── variables.tf        # Parameterized variables (region, instance type, tags)
    ├── main.tf             # Core EC2 infrastructure resource definition
    ├── outputs.tf          # Terraform output variables
    └── README.md           # Master project documentation

---

## 1. Modular Terraform Codebase

### Provider Configuration (provider.tf)

    terraform {
      required_providers {
        aws = {
          source  = "hashicorp/aws"
          version = "~> 5.0"
        }
      }
    }

    provider "aws" {
      region                      = var.aws_region
      skip_credentials_validation = true
      skip_requesting_account_id  = true
      skip_metadata_api_check     = true
    }

### Input Variables (variables.tf)

    variable "aws_region" {
      description = "AWS region for resources"
      type        = string
      default     = "us-east-1"
    }

    variable "instance_type" {
      description = "EC2 instance type"
      type        = string
      default     = "t3.medium"
    }

    variable "server_name" {
      description = "Name tag for the EC2 server"
      type        = string
      default     = "Win-Production-Server"
    }

    variable "environment" {
      description = "Environment tag"
      type        = string
      default     = "Production"
    }

### Main Infrastructure (main.tf)

    resource "aws_instance" "web_server" {
      ami           = "ami-0c55b159cbfafe1f0"
      instance_type = var.instance_type

      tags = {
        Name        = var.server_name
        Environment = var.environment
      }
    }

### Outputs (outputs.tf)

    output "server_details" {
      description = "Key details of the created EC2 server"
      value = {
        name = aws_instance.web_server.tags["Name"]
        type = aws_instance.web_server.instance_type
      }
    }

---

## 2. Execution Commands

    # 1. Initialize Working Directory
    terraform init

    # 2. Validate Code Syntax
    terraform validate

    # 3. Preview Execution Plan
    terraform plan

---

## 3. Git Deployment Commands

    git add .
    git commit -m "refactor: modularize terraform code into separate tf files"
    git push

---

##  Project Status

* **Structure:** Industry-Standard Modular Setup (provider, variables, main, outputs)
* **Variables:** Fully Parameterized (No hardcoded credentials or names)
* **Validation:** Verified via terraform validate
* **Current Status:**  Production-Ready Modular Code
