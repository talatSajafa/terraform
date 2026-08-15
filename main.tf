terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region                      = "us-east-1"
  access_key                  = "mock_key"
  secret_key                  = "mock_secret"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
}

# Updated Web Server Configuration
resource "aws_instance" "web_server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t3.medium" # Updated instance type

  tags = {
    Name        = "Win-Production-Server" # Updated name tag
    Environment = "Production"
  }
}

output "server_details" {
  value = {
    name = aws_instance.web_server.tags["Name"]
    type = aws_instance.web_server.instance_type
  }
}
