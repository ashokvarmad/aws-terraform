terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
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