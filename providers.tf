terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      Project     = "aws-budget-alerts"
      ManagedBy   = "terraform"
      Repository  = "https://github.com/Felland-Arthur/aws-budget-alerts-terraform"
      Owner       = "Felland-Arthur"
    }
  }
}
