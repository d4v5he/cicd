resource "aws_security_group" "example" {
  name        = "example-sg-${var.environment}"
  description = "Security group for ${var.environment} environment"
  vpc_id      = "${var.vpc_ip}"

  dynamic "ingress" {
    for_each = local.ingress_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  tags = merge(
    {
      Name        = "example-sg-${var.environment}"
      Environment = var.environment
    },
    var.environment == "dev" ? { Dev = "true" } : {}
  )
}
