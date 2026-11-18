resource "aws_instance" "this" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  associate_public_ip_address = false
  vpc_security_group_ids      = var.security_group_ids
  iam_instance_profile        = var.instance_profile
  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }
  root_block_device {
    encrypted   = true
    kms_key_id  = var.kms_key_arn
    volume_size = var.root_volume_size
    volume_type = var.root_volume_type
  }
  tags        = merge(var.tags, { Name = var.name })
  volume_tags = var.tags
  lifecycle {
    precondition {
      condition     = length(var.security_group_ids) > 0 && var.root_volume_size > 0
      error_message = "Informe SGs explícitos e disco maior que zero."
    }
  }
}
