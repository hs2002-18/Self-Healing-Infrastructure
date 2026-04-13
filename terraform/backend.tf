terraform{
    backend "s3"{
        bucket = "self-healing-terraform-remote-backend-bucket"
        key = "self-healing/terraform.tfstate"
        region  = "ap-south-1"
        dynamodb_table = "terraform-lock"
    }
}