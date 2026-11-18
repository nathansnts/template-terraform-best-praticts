terraform {
  backend "s3" {
    key          = "plataforma/prd/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}
