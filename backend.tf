terraform {  
  backend "s3" {  
    bucket       = "my-state-file-terraform-bucket"  
    key          = "statefile.tfstate"  
    region       = "us-east-1"  
    # use_lockfile = true  #S3 native locking
  }  
}