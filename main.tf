terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"

  backend "s3" {
        bucket = "tf-test-buck"  # Replace with your bucket name
        key    = "aws-terraform/terraform.tfstate"  # Replace with your desired path
        region = "us-east-2"  # Replace with your AWS region
        # dynamodb_table = "your-dynamodb-table-name"  # Optional: For state locking
        # encrypt = true # Optional: Enable encryption
      }
}

provider "aws" {
  region  = "us-east-2"
  profile = "ashok-aws"
}

resource "aws_instance" "ashok_app" {
  ami           = "ami-0d0f28110d16ee7d6"
  instance_type = "t2.micro"

  tags = {
    Name = "AshokAppServer"
    Owner = "Ashok" 
  }
}


resource "aws_s3_bucket" "statefiletest" {
  bucket = "tf-test-buck"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

